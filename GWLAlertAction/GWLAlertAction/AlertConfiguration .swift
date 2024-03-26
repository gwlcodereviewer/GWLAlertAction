//
//  AlertConfiguration .swift
//  GWLAlertAction
//
//  Created by gwl on 20/05/20.
//  Copyright © 2020 Galaxyweblinks. All rights reserved.
//

import UIKit

class AlertConfiguration {
    enum AlertFlexiblity {
        case fixWidth
        case fixLeddingTrailing
    }
    var aAlartBackgroundColor: UIColor = .white
    var aButtonsDirection: ButtonsDirection = .horizontal
    var aAlertFlexiblity: AlertFlexiblity = .fixWidth
    var aSepratorColor : UIColor  = .gray
    var aSepratorBetweenTitleAndMessage : Bool  = false
    
    init() {
    }
    init(aBackgroundColor: UIColor?,
         aDirection: ButtonsDirection?,
         aFlexiblity: AlertFlexiblity?,
         sepratorColor: UIColor?,
         sepratorBetweenTitleAndMessage: Bool?) {
        aAlartBackgroundColor = aBackgroundColor ?? .white
        aButtonsDirection = aDirection ?? .horizontal
        aAlertFlexiblity = aFlexiblity ?? .fixWidth
        aSepratorColor = sepratorColor ?? .gray
        aSepratorBetweenTitleAndMessage = sepratorBetweenTitleAndMessage ?? false
    }
    
}
