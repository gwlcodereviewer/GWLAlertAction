//
//  ViewController.swift
//  GWLAlertAction
//
//  Created by gwl on 19/05/20.
//  Copyright © 2020 Galaxyweblinks. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func actionOnShowAlert(_ sender: Any) {
        ///////////////////////////////////
        let buttonsOk = AlertButtonStyle(abuttonText: "OK") {
            print("OK")
        }
        let buttonCancel = AlertButtonStyle(abuttonText: "Done", abuttonTextColor: .green) {
            print("Cancel")
        }
        let buttonDone = AlertButtonStyle(abuttonText: "Cancel", abuttonTextColor: .red) {
            print("Done")
        }
        
        GWLAlertAction.shared.showAlart(type: .alert, title: "Message", message: "Messages bring a refreshingly beautiful and responsive Material Design touch to the old state of text messages. Major Features Messages bring a refreshingly beautiful", aAlertButtonStyle: [buttonsOk,buttonCancel,buttonDone],aDirection: .horizontal)
    }
    
    @IBAction func actionOnSheet(_ sender: Any) {
        let buttonsOk = AlertButtonStyle(abuttonText: "OK") {
            print("OK")
        }
        let buttonCancel = AlertButtonStyle(abuttonText: "Done Sure it") {
            print("Cancel")
        }

        let buttonDoned = AlertButtonStyle(abuttonText: "Dismis", abuttonTextColor: .green) {
            print("Dismis")
        }
        GWLAlertAction.shared.showAlart(type: .actionsheet, title: "Message", message: "Messages bring a refreshingly beautiful.", aAlertButtonStyle: [buttonsOk,buttonCancel,buttonDoned,buttonDoned,buttonDoned])
    }
}

