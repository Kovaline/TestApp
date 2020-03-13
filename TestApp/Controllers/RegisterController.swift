//
//  RegisterController.swift
//  TestApp
//
//  Created by  AnnaigHoinart on 12.03.2020.
//  Copyright © 2020 Ikovalen. All rights reserved.
//

import UIKit

class RegisterController: UIViewController {

    
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    
    
    @IBAction func signUpButtonClicked(_ sender: Any) {
        let signUp = LogInLoader()
        signUp.SignUp(name: nameField.text!, email: emailField.text!, password: passwordField.text!, controller: self)

    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
