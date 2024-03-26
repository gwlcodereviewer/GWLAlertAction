//
//  GWLAlertAction.swift
//  GWLAlertAction
//
//  Created by gwl on 19/05/20.
//  Copyright © 2020 Galaxyweblinks. All rights reserved.
//

import  UIKit

class GWLAlertAction {
    public static let shared = GWLAlertAction()
    func showAlart(type: AlertView.AlertType, title: String, message: String, aAlertButtonStyle: [AlertButtonStyle]) {
        ///////////////////////////////////
        let labelStyle =  AlertLabelStyle(atitle: title, amessage: message)
        ///////////////////////////////////
        let config = AlertConfiguration(aBackgroundColor: .white, aDirection: .vertical, aFlexiblity: .fixLeddingTrailing, sepratorColor: .gray, sepratorBetweenTitleAndMessage: nil)
        _ = AlertView(aType: type , aAlertLabelStyle: labelStyle, aAlertButtonStyle: aAlertButtonStyle, aAlertConfiguration: config)
    }
    
    func showAlart(type: AlertView.AlertType, title: String, message: String, aAlertButtonStyle: [AlertButtonStyle], aDirection: ButtonsDirection) {
           ///////////////////////////////////
           let labelStyle =   AlertLabelStyle(atitle: title, amessage: message, atitleFontName: nil, amessageFontName: nil, atitleFontSize: nil, amessageFontSize: nil, atitleTextColor: .black, amessageTextColor: .black)
           ///////////////////////////////////
           let config = AlertConfiguration(aBackgroundColor: .white, aDirection: aDirection, aFlexiblity: .fixLeddingTrailing, sepratorColor: .gray, sepratorBetweenTitleAndMessage: false)
                
           _ = AlertView(aType: type , aAlertLabelStyle: labelStyle, aAlertButtonStyle: aAlertButtonStyle, aAlertConfiguration: config)
        
     }
}
