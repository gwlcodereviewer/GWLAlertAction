
//
//  File.swift
//  GWLAlertAction
//
//  Created by gwl on 19/05/20.
//  Copyright © 2020 Galaxyweblinks. All rights reserved.
//

import UIKit

class AlertButtonStyle{
    typealias AlertComplition = (() -> Void)?
    var aAlertComplition: AlertComplition? = nil
    var buttonText: String = "Ok"
    var buttonTextColor: UIColor = .blue
    var buttonFontName: String = "Helvetica"
    var buttomFontSize : CGFloat  = 17.0
    init(){}
    init(abuttonText: String, callback: AlertComplition) {
        buttonText = abuttonText
        aAlertComplition = callback
    }
    init(abuttonText: String, abuttonTextColor: UIColor, callback: AlertComplition) {
        buttonText = abuttonText
        buttonTextColor = abuttonTextColor
        aAlertComplition = callback
    }
    init(abuttonText: String?, abuttonTextColor: UIColor?, abuttonFontName: String?, abuttomFontSize: CGFloat?, callback: AlertComplition) {
        buttonText = abuttonText ?? "Ok"
        buttonTextColor = abuttonTextColor ?? .blue
        buttonFontName = abuttonFontName ?? "Helvetica"
        buttomFontSize = abuttomFontSize ?? 17.0
        aAlertComplition = callback
    }
    @objc func actionOnUpInside(_ sender: UIButton){
        if let subviews: [UIView] = sender.superview?.subviews  {
            for item in subviews {
                if item.tag == sender.tag {
                    if let label = item as? UILabel {
                        label.alpha = 1.0
                        if let comp = aAlertComplition {
                            comp!()
                        }
                    }
                }
            }
        }
    }
    @objc func actionOnUpOutside(_ sender: UIButton){
        if let subviews: [UIView] = sender.superview?.subviews  {
            for item in subviews {
                if item.tag == sender.tag {
                    if let label = item as? UILabel {
                        label.alpha = 0.5
                    }
                }
            }
        }
    }
}

