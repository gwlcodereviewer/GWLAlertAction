//
//  AlertViewCreater.swift
//  GWLAlertAction
//
//  Created by gwl on 19/05/20.
//  Copyright © 2020 Galaxyweblinks. All rights reserved.
//
import UIKit

extension AlertView {
    func makeTitlelable() -> UILabel {
        let titleLable = UILabel()
        titleLable.numberOfLines = 0
        titleLable.text = aMessage.title
        titleLable.setContentHuggingPriority(UILayoutPriority(rawValue: 252), for: .vertical)
        titleLable.textColor = aMessage.titleTextColor
        titleLable.font = UIFont(name: aMessage.titleFontName, size: aMessage.titleFontSize)
        titleLable.backgroundColor = UIColor.clear
        titleLable.textAlignment = .center
        titleLable.translatesAutoresizingMaskIntoConstraints = false
        popupView.addSubview(titleLable)
        return titleLable
    }
    func makeMessagelable() -> UITextView {
        let messageLable = UITextView(frame: .zero, textContainer: nil)
        messageLable.text = aMessage.message
        messageLable.sizeToFit()
        messageLable.isScrollEnabled = false
        messageLable.automaticallyAdjustsScrollIndicatorInsets = false
        messageLable.isUserInteractionEnabled = true
        messageLable.isEditable = false
        messageLable.textColor = aMessage.messageTextColor
        messageLable.font = UIFont(name: aMessage.messageFontName, size: aMessage.messageFontSize)
        messageLable.backgroundColor = UIColor.clear
        messageLable.textAlignment = .center
        messageLable.translatesAutoresizingMaskIntoConstraints = false
        popupView.addSubview(messageLable)
        return messageLable
    }
    func makeSeparator() -> UILabel {
        let titleLable = UILabel()
        titleLable.backgroundColor = aConfiguration.aSepratorColor
        titleLable.translatesAutoresizingMaskIntoConstraints = false
        popupView.addSubview(titleLable)
        return titleLable
    }
    func makeButtonWith(aButtonStyle: [AlertButtonStyle], fromView: UIView)  {
        var lastLabel: UIView? = nil
        var lastIndex = aButtonStyle.count - 1
        if aAlertType == .actionsheet {
            lastIndex = aButtonStyle.count - 2
        }
        for (index, style) in aButtonStyle.enumerated() {
            let buttonLable = UILabel()
            buttonLable.numberOfLines = 0
            buttonLable.tag = index + 100
            buttonLable.text = style.buttonText
            buttonLable.textColor = style.buttonTextColor
            buttonLable.font = UIFont(name: style.buttonFontName, size: style.buttomFontSize)
            buttonLable.backgroundColor = UIColor.clear
            buttonLable.textAlignment = .center
            buttonLable.translatesAutoresizingMaskIntoConstraints = false
            popupView.addSubview(buttonLable)
            if aConfiguration.aButtonsDirection == .horizontal {
                if index == 0 {
                    lastLabel = self.addButtonConstraints(aButtonLabel: buttonLable, topView: fromView, sideView: popupView, isLastObject: lastIndex == index, isFirstObject: true, aStyle: style)
                }else {
                    lastLabel = self.addButtonConstraints(aButtonLabel: buttonLable, topView: fromView, sideView: lastLabel!, isLastObject: lastIndex == index, isFirstObject: false, aStyle: style)
                }
            }else {
                if index == 0 {
                    lastLabel = self.addButtonConstraints(aButtonLabel: buttonLable, topView: fromView, sideView: popupView, isLastObject: lastIndex == index, isFirstObject: true, aStyle: style)
                }else {
                    lastLabel = self.addButtonConstraints(aButtonLabel: buttonLable, topView: lastLabel!, sideView: popupView, isLastObject: lastIndex == index, isFirstObject: false, aStyle: style)
                }
            }
        }
    }
    func makeSheetCancelButton(aButtonStyle: AlertButtonStyle, tag: Int)  {
        let bottomView = UIView()
        bottomView.backgroundColor = aConfiguration.aAlartBackgroundColor
        bottomView.clipsToBounds = true
        bottomView.layer.cornerRadius = 10
        bottomView.translatesAutoresizingMaskIntoConstraints = false
        sheetView.addSubview(bottomView)
        sheetView.addConstraint(NSLayoutConstraint(item: bottomView, attribute: .leading, relatedBy: .equal, toItem: sheetView, attribute: .leading, multiplier: 1.0, constant: 0))
        sheetView.addConstraint(NSLayoutConstraint(item: bottomView, attribute: .trailing, relatedBy: .equal, toItem: sheetView, attribute: .trailing, multiplier: 1.0, constant: 0))
        sheetView.addConstraint(NSLayoutConstraint(item: bottomView, attribute: .bottom, relatedBy: .equal, toItem: sheetView, attribute: .bottom, multiplier: 1.0, constant: 0))
        bottomView.addConstraint(NSLayoutConstraint(item: bottomView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 50))
        let buttonLable = UILabel()
        buttonLable.numberOfLines = 0
        buttonLable.text = aButtonStyle.buttonText
        buttonLable.textColor = aButtonStyle.buttonTextColor
        buttonLable.font = UIFont(name: aButtonStyle.buttonFontName, size: aButtonStyle.buttomFontSize)
        buttonLable.backgroundColor = UIColor.clear
        buttonLable.tag = tag + 100
        buttonLable.textAlignment = .center
        buttonLable.translatesAutoresizingMaskIntoConstraints = false
        bottomView.addSubview(buttonLable)
        applySameConstraints(oldView: bottomView, newView: buttonLable)
        makeButtonForClick(aButtonLabel: buttonLable, style: aButtonStyle)
    }
    func makeButtonForClick(aButtonLabel: UIView, style: AlertButtonStyle) {
        let button = UIButton()
        button.setTitle("", for: [])
        button.tag = aButtonLabel.tag
        button.backgroundColor = .clear
        aButtonLabel.superview?.addSubview(button)
        button.addTarget(style, action: #selector(AlertButtonStyle.actionOnUpOutside(_:)), for: .allTouchEvents)
        button.addTarget(style, action: #selector(AlertButtonStyle.actionOnUpInside(_:)), for: .touchUpInside)
        button.addTarget(self, action: #selector(self.actionOnRemove(_:)), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        applySameConstraints(oldView: aButtonLabel, newView: button)
    }
}
