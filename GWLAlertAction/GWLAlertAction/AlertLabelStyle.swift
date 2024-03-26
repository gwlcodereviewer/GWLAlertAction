//
//  AlertLabelStyle.swift
//  GWLAlertAction
//
//  Created by gwl on 19/05/20.
//  Copyright © 2020 Galaxyweblinks. All rights reserved.
//

import UIKit

class AlertLabelStyle {
    var title : String = "Message"
    var message : String = "The subtitle"
    var titleFontName : String = "Helvetica"
    var messageFontName : String = "Helvetica"
    var titleFontSize : CGFloat  = 22.0
    var messageFontSize : CGFloat  = 17.0
    var titleTextColor : UIColor  = .black
    var messageTextColor : UIColor  = .gray
    init() {
    }
    init(atitle: String?,
         amessage: String?,
         atitleFontName: String?,
         amessageFontName: String?,
         atitleFontSize: CGFloat?,
         amessageFontSize: CGFloat?,
         atitleTextColor: UIColor?,
         amessageTextColor: UIColor?) {
        title = atitle ?? "Message"
        message = amessage ?? "The subtitle"
        titleFontName = atitleFontName ?? "Helvetica"
        messageFontName = amessageFontName ?? "Helvetica"
        titleFontSize = atitleFontSize ?? 22.0
        messageFontSize = amessageFontSize ?? 17.0
        titleTextColor = atitleTextColor ?? .black
        messageTextColor = amessageTextColor ?? .gray
    }
    init(atitle: String,amessage: String) {
        title = atitle
        message = amessage
    }
    init(atitle: String,
         amessage: String,
         atitleFontName: String,
         amessageFontName: String,
         atitleFontSize: CGFloat,
         amessageFontSize: CGFloat) {
        title = atitle
        message = amessage
        titleFontName = atitleFontName 
        messageFontName = amessageFontName
        titleFontSize = atitleFontSize
        messageFontSize = amessageFontSize
    }
}
