//
//  AlertView.swift
//  GWLAlertAction
//
//  Created by gwl on 19/05/20.
//  Copyright © 2020 Galaxyweblinks. All rights reserved.
//

import UIKit

enum ButtonsDirection {
    case horizontal
    case vertical
}

class AlertView: UIView {
    enum AlertType {
        case alert
        case actionsheet
    }
   
    let maxWidth : CGFloat = 300.0
    let minHeight : CGFloat = 150.0
    let leddingTrailingValue : CGFloat = 40.0
    var superView : UIWindow? = nil
    var aAlertType : AlertType = .alert
    var popupView = UIView()
    var sheetView = UIView()
    var animation = AlertAnimations()
    var aMessage: AlertLabelStyle = AlertLabelStyle()
    var aButtons: [AlertButtonStyle] = []
    var aConfiguration: AlertConfiguration = AlertConfiguration()
    var aMessageView: UITextView = UITextView()
    var aMessageViewHight: NSLayoutConstraint?
    init(aAlertLabelStyle:AlertLabelStyle, aAlertButtonStyle: [AlertButtonStyle]) {
        super.init(frame: .zero)
        aMessage = aAlertLabelStyle
        aButtons = aAlertButtonStyle
        self.makeview()
    }
    init(aType: AlertType, aAlertLabelStyle:AlertLabelStyle, aAlertButtonStyle: [AlertButtonStyle], aAlertConfiguration : AlertConfiguration) {
        super.init(frame: .zero)
        aMessage = aAlertLabelStyle
        aButtons = aAlertButtonStyle
        aConfiguration = aAlertConfiguration
        aAlertType = aType
        self.makeview()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    func makeview() {
        NotificationCenter.default.addObserver(self, selector: #selector(self.rotated), name: UIDevice.orientationDidChangeNotification, object: nil)
        if  let window = UIApplication.shared.windows.first {
            superView = window
            self.backgroundColor = UIColor(white: 0.0, alpha: 0.3)
            superView?.addSubview(self)
            self.translatesAutoresizingMaskIntoConstraints = false
            addSelfToSuperView()
            sheetView.translatesAutoresizingMaskIntoConstraints = false
            sheetView.layer.cornerRadius = 10
            sheetView.clipsToBounds = true
            sheetView.backgroundColor = .clear
            self.addSubview(sheetView)
            sheetView.addSubview(popupView)
            popupView.backgroundColor = aConfiguration.aAlartBackgroundColor
            popupView.clipsToBounds = true
            popupView.layer.cornerRadius = 10
            popupView.translatesAutoresizingMaskIntoConstraints = false
            addBaseViewConstraints()
            makeSheetBottom()
            makeMessages()
            makeButtons(messageLabel: aMessageView)
            if aAlertType == .alert{
                animation.showAlerAnimation(inview: self, sheetView: sheetView)
            }else {
                animation.showSheetAnimation(inview: self)
            }
            self.layoutIfNeeded()
            self.rotated()
        }
    }
    func makeMessages() {
        let titleLabel = makeTitlelable()
        aMessageView = makeMessagelable()
        addTitlelabelConstraints(titleLable: titleLabel)
        if aConfiguration.aSepratorBetweenTitleAndMessage {
            addVerticalSeparatorConstraints(separator: makeSeparator(), byView: titleLabel, firstObject: false)
        }
        addMessagelabelConstraints(messageLable: aMessageView, titleLable: titleLabel)
        addVerticalSeparatorConstraints(separator: makeSeparator(), byView: aMessageView, firstObject: true)
        if aAlertType == .actionsheet &&  aButtons.count == 0 {
            applyBottomOnlyConstraints(popupView: popupView, messageLabel: aMessageView)
        }
    }
    func makeButtons(messageLabel: UIView) {
        if aAlertType == .actionsheet &&  aButtons.count >= 2 {
            makeButtonWith(aButtonStyle: aButtons, fromView: messageLabel)
        } else if aAlertType == .alert {
            if aButtons.count > 0 {
                makeButtonWith(aButtonStyle: aButtons, fromView: messageLabel)
            }else {
                makeButtonWith(aButtonStyle: [AlertButtonStyle()], fromView: messageLabel)
            }
        }
    }
    func makeSheetBottom() {
        if aAlertType == .actionsheet {
            if aButtons.count > 0 {
                makeSheetCancelButton(aButtonStyle: aButtons.last!, tag: aButtons.count - 1)
            }else {
                makeSheetCancelButton(aButtonStyle: AlertButtonStyle(), tag: 0)
            }
        }
    }
    @objc func actionOnRemove(_ sender: UIButton){
        if aAlertType == .alert{
            animation.hideAlerAnimation(inview: self, sheetView: sheetView)
        }else {
            animation.hideSheetAnimation(inview: self)
        }
    }
    @objc func rotated() {
        if aConfiguration.aAlertFlexiblity == .fixWidth {
            disableMessageScrolling()
            self.layoutIfNeeded()
            let popUpHeight = sheetView.frame.size.height
            let viewHeight = self.frame.size.height
            if popUpHeight > viewHeight {
                enableMessageScrolling()
            }else {
                disableMessageScrolling()
            }
            self.layoutIfNeeded()
        }
    }
    func enableMessageScrolling() {
        aMessageView.isScrollEnabled = true
        aMessageViewHight =  applyHeightOnlyConstraints(messageView: aMessageView, value: 200)
    }
    func disableMessageScrolling() {
        aMessageView.isScrollEnabled = false
        if aMessageViewHight != nil {
            aMessageView.removeConstraint(aMessageViewHight!)
        }
    }
}
