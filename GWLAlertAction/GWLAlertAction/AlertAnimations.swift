//
//  AlertAnimations.swift
//  GWLAlertAction
//
//  Created by gwl on 21/05/20.
//  Copyright © 2020 Galaxyweblinks. All rights reserved.
//

import UIKit

class AlertAnimations {
    let sheetBottomValue: CGFloat = -35.0
    var sheetBottomConstraint: NSLayoutConstraint?
    func showSheetAnimation(inview: UIView){
        sheetBottomConstraint?.constant = 400
        inview.layoutIfNeeded()
        inview.alpha = 0
        UIView.animate(withDuration: 0.2, delay: 0.0, options: .curveEaseInOut, animations: {
            self.sheetBottomConstraint?.constant = self.sheetBottomValue
            inview.alpha = 1
            inview.layoutIfNeeded()
        }) { (value) in
            self.sheetBottomConstraint?.constant = self.sheetBottomValue
            inview.alpha = 1
            inview.layoutIfNeeded()
        }
    }
    func hideSheetAnimation(inview: UIView){
        UIView.animate(withDuration: 0.2, delay: 0.0, options: .curveEaseInOut, animations: {
            self.sheetBottomConstraint?.constant = 400
            inview.alpha = 0
            inview.layoutIfNeeded()
        }) { (value) in
            self.sheetBottomConstraint?.constant =  400
            inview.alpha = 0
            inview.layoutIfNeeded()
            inview.removeFromSuperview()
        }
    }
    func showAlerAnimation(inview: UIView, sheetView: UIView){
        sheetView.alpha = 0
        inview.alpha = 0
        inview.layoutIfNeeded()
        UIView.animate(withDuration: 0.2, delay: 0.0, options: .curveEaseInOut, animations: {
            sheetView.alpha = 1
            inview.alpha = 1
            inview.layoutIfNeeded()
        }) { (value) in
            sheetView.alpha = 1
            inview.alpha = 1
            inview.layoutIfNeeded()
        }
    }
    func hideAlerAnimation(inview: UIView, sheetView: UIView){
        UIView.animate(withDuration: 0.2, delay: 0.0, options: .curveEaseInOut, animations: {
            sheetView.alpha = 0
            inview.alpha = 0
            inview.layoutIfNeeded()
        }) { (value) in
            sheetView.alpha = 0
            inview.alpha = 0
            inview.layoutIfNeeded()
            inview.removeFromSuperview()
        }
    }
}
