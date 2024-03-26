//
//  AlertViewConstraints.swift
//  GWLAlertAction
//
//  Created by gwl on 19/05/20.
//  Copyright © 2020 Galaxyweblinks. All rights reserved.
//

import UIKit

extension AlertView {
    func addSelfToSuperView() {
        self.superView!.addConstraint(NSLayoutConstraint(item: self, attribute: .leading, relatedBy: .equal, toItem: self.superView!, attribute: .leading, multiplier: 1.0, constant: 0))
        self.superView!.addConstraint(NSLayoutConstraint(item: self, attribute: .trailing, relatedBy: .equal, toItem: self.superView!, attribute: .trailing, multiplier: 1.0, constant: 0))
        self.superView!.addConstraint(NSLayoutConstraint(item: self, attribute: .top, relatedBy: .equal, toItem: self.superView!, attribute: .top, multiplier: 1.0, constant: 0))
        self.superView!.addConstraint(NSLayoutConstraint(item: self, attribute: .bottom, relatedBy: .equal, toItem: self.superView!, attribute: .bottom, multiplier: 1.0, constant: 0))
    }
    func addBaseViewConstraints() {
        if aAlertType == .alert {
            self.addConstraint(NSLayoutConstraint(item: sheetView, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1.0, constant: 0))
        }else {
            animation.sheetBottomConstraint = NSLayoutConstraint(item: sheetView, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1.0, constant: -animation.sheetBottomValue)
            self.addConstraint(animation.sheetBottomConstraint!)
        }
        if aConfiguration.aAlertFlexiblity == .fixWidth {
            self.addConstraint(NSLayoutConstraint(item: sheetView, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1.0, constant: 0))
            sheetView.addConstraint(NSLayoutConstraint(item: sheetView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: maxWidth))
        }else {
            self.addConstraint(NSLayoutConstraint(item: sheetView, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1.0, constant: leddingTrailingValue))
            self.addConstraint(NSLayoutConstraint(item: sheetView, attribute: .trailing, relatedBy: .equal, toItem: self, attribute: .trailing, multiplier: 1.0, constant: -leddingTrailingValue))
        }
        sheetView.addConstraint(NSLayoutConstraint(item: sheetView, attribute: .height, relatedBy: .greaterThanOrEqual, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: minHeight))
        addPopUpViewConstraint()
    }
    func addPopUpViewConstraint() {
        sheetView.addConstraint(NSLayoutConstraint(item: popupView, attribute: .leading, relatedBy: .equal, toItem: sheetView, attribute: .leading, multiplier: 1.0, constant: 0))
        sheetView.addConstraint(NSLayoutConstraint(item: popupView, attribute: .trailing, relatedBy: .equal, toItem: sheetView, attribute: .trailing, multiplier: 1.0, constant: 0))
        sheetView.addConstraint(NSLayoutConstraint(item: popupView, attribute: .top, relatedBy: .equal, toItem: sheetView, attribute: .top, multiplier: 1.0, constant: 0))
        sheetView.addConstraint(NSLayoutConstraint(item: popupView, attribute: .bottom, relatedBy: .equal, toItem: sheetView, attribute: .bottom, multiplier: 1.0, constant: aAlertType == .alert ? 0 : -60))
    }
    func addTitlelabelConstraints(titleLable : UILabel) {
        popupView.addConstraint(NSLayoutConstraint(item: titleLable, attribute: .leading, relatedBy: .equal, toItem: popupView, attribute: .leading, multiplier: 1.0, constant: 5))
        popupView.addConstraint(NSLayoutConstraint(item: titleLable, attribute: .trailing, relatedBy: .equal, toItem: popupView, attribute: .trailing, multiplier: 1.0, constant: -5))
        popupView.addConstraint(NSLayoutConstraint(item: titleLable, attribute: .top, relatedBy: .equal, toItem: popupView, attribute: .top, multiplier: 1.0, constant: 10))
    }
    func addMessagelabelConstraints(messageLable : UIView, titleLable : UIView)  {
        popupView.addConstraint(NSLayoutConstraint(item: messageLable, attribute: .leading, relatedBy: .equal, toItem: popupView, attribute: .leading, multiplier: 1.0, constant: 5))
        popupView.addConstraint(NSLayoutConstraint(item: messageLable, attribute: .trailing, relatedBy: .equal, toItem: popupView, attribute: .trailing, multiplier: 1.0, constant: -5))
        popupView.addConstraint(NSLayoutConstraint(item: messageLable, attribute: .top, relatedBy: .equal, toItem: titleLable, attribute: .bottom, multiplier: 1.0, constant: 10))
    }
    func addVerticalSeparatorConstraints(separator : UIView, byView: UIView, firstObject: Bool) {
        popupView.addConstraint(NSLayoutConstraint(item: separator, attribute: .leading, relatedBy: .equal, toItem: popupView, attribute: .leading, multiplier: 1.0, constant: 0))
        popupView.addConstraint(NSLayoutConstraint(item: separator, attribute: .trailing, relatedBy: .equal, toItem: popupView, attribute: .trailing, multiplier: 1.0, constant: 0))
        popupView.addConstraint(NSLayoutConstraint(item: separator, attribute: .top, relatedBy: .equal, toItem: byView, attribute: .bottom, multiplier: 1.0, constant: firstObject == true ? 15 : 5))
        separator.addConstraint(NSLayoutConstraint(item: separator, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 1))
    }
    func addHorizontalSeparatorConstraints(separator : UIView, byView: UIView) {
        popupView.addConstraint(NSLayoutConstraint(item: separator, attribute: .leading, relatedBy: .equal, toItem: byView, attribute: .trailing, multiplier: 1.0, constant: 0))
        popupView.addConstraint(NSLayoutConstraint(item: separator, attribute: .top, relatedBy: .equal, toItem: byView, attribute: .top, multiplier: 1.0, constant: -5))
        popupView.addConstraint(NSLayoutConstraint(item: separator, attribute: .bottom, relatedBy: .equal, toItem: popupView, attribute: .bottom, multiplier: 1.0, constant: 0))
        separator.addConstraint(NSLayoutConstraint(item: separator, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 1))
    }
    func applySameConstraints(oldView: UIView, newView: UIView){
        oldView.superview?.addConstraint(NSLayoutConstraint(item: newView, attribute: .leading, relatedBy: .equal, toItem: oldView, attribute: .leading, multiplier: 1.0, constant: 1))
        oldView.superview?.addConstraint(NSLayoutConstraint(item: newView, attribute: .trailing, relatedBy: .equal, toItem: oldView, attribute: .trailing, multiplier: 1.0, constant: 1))
        oldView.superview?.addConstraint(NSLayoutConstraint(item: newView, attribute: .top, relatedBy: .equal, toItem: oldView, attribute: .top, multiplier: 1.0, constant: 1))
        oldView.superview?.addConstraint(NSLayoutConstraint(item: newView, attribute: .bottom, relatedBy: .equal, toItem: oldView, attribute: .bottom, multiplier: 1.0, constant: 1))
    }
    
    func applyBottomOnlyConstraints(popupView: UIView, messageLabel: UIView){
        popupView.addConstraint(NSLayoutConstraint(item: messageLabel, attribute: .bottom, relatedBy: .equal, toItem: popupView, attribute: .bottom, multiplier: 1.0, constant: -5))
    }
    
    func applyHeightOnlyConstraints(messageView: UIView, value: CGFloat) -> NSLayoutConstraint {
        let messageHeight = NSLayoutConstraint(item: messageView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: value)
        messageView.addConstraint(messageHeight)
        return messageHeight
    }
}
extension AlertView {
    func addButtonConstraints(aButtonLabel: UIView, topView: UIView, sideView: UIView, isLastObject: Bool, isFirstObject:Bool , aStyle: AlertButtonStyle) -> UIView {
        aButtonLabel.addConstraint(NSLayoutConstraint(item: aButtonLabel, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 40))
        if aConfiguration.aButtonsDirection == .horizontal {
            if isFirstObject == true {
                popupView.addConstraint(NSLayoutConstraint(item: aButtonLabel, attribute: .leading, relatedBy: .equal, toItem: sideView, attribute: .leading, multiplier: 1.0, constant: 5))
            }else {
                popupView.addConstraint(NSLayoutConstraint(item: aButtonLabel, attribute: .leading, relatedBy: .equal, toItem: sideView, attribute: .trailing, multiplier: 1.0, constant: 1))
                popupView.addConstraint(NSLayoutConstraint(item: aButtonLabel, attribute: .width, relatedBy: .equal, toItem: sideView, attribute: .width, multiplier: 1.0, constant: 0))
            }
            if isLastObject == true {
                popupView.addConstraint(NSLayoutConstraint(item: aButtonLabel, attribute: .trailing, relatedBy: .equal, toItem: popupView, attribute: .trailing, multiplier: 1.0, constant: -5))
            }else {
                addHorizontalSeparatorConstraints(separator: makeSeparator(), byView: aButtonLabel)
            }
            popupView.addConstraint(NSLayoutConstraint(item: aButtonLabel, attribute: .top, relatedBy: .equal, toItem: topView, attribute: .bottom, multiplier: 1.0, constant: 20))
            popupView.addConstraint(NSLayoutConstraint(item: aButtonLabel, attribute: .bottom, relatedBy: .equal, toItem: popupView, attribute: .bottom, multiplier: 1.0, constant: -5))
        }else {
            popupView.addConstraint(NSLayoutConstraint(item: aButtonLabel, attribute: .leading, relatedBy: .equal, toItem: popupView, attribute: .leading, multiplier: 1.0, constant: 5))
            popupView.addConstraint(NSLayoutConstraint(item: aButtonLabel, attribute: .trailing, relatedBy: .equal, toItem: popupView, attribute: .trailing, multiplier: 1.0, constant: -5))
            popupView.addConstraint(NSLayoutConstraint(item: aButtonLabel, attribute: .top, relatedBy: .equal, toItem: topView, attribute: .bottom, multiplier: 1.0, constant: isFirstObject == true ? 19 : 9))
            
            if isLastObject == true {
                popupView.addConstraint(NSLayoutConstraint(item: aButtonLabel, attribute: .bottom, relatedBy: .equal, toItem: popupView, attribute: .bottom, multiplier: 1.0, constant: -5))
            }else {
                addVerticalSeparatorConstraints(separator: makeSeparator(), byView: aButtonLabel, firstObject: false)
            }
        }
        makeButtonForClick(aButtonLabel: aButtonLabel, style: aStyle)
        return aButtonLabel
    }
}
