//
//  ViewController.swift
//  TestApp
//
//  Created by  AnnaigHoinart on 12.03.2020.
//  Copyright © 2020 Ikovalen. All rights reserved.
//

import UIKit
import Alamofire

class LogInController: UIViewController {
    
    
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

    @IBAction func logInButtonClicked(_ sender: Any) {
        let login = LogInLoader()
        login.SignIn(email: emailField.text!, password: passwordField.text!, controller: self)
    }
}

