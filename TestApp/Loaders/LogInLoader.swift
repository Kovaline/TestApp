//
//  LogInLoader.swift
//  TestApp
//
//  Created by  AnnaigHoinart on 12.03.2020.
//  Copyright © 2020 Ikovalen. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class LogInLoader: NSObject {
    static var accessToken = ""
    
    func SignIn(email: String, password: String, controller: UIViewController){
        let url = "http://apiecho.cf/api/login/"
        let parameters = ["email":email, "password":password]
        AF.request(url, method: .post, parameters: parameters).responseJSON { response in
                switch response.result {
                case .success(let value):
                    let json = JSON(value)
                    print(json)
                    if json["success"] == false {
                        let alert = UIAlertController(title: json["errors"][0]["name"].string!, message: json["errors"][0]["message"].string!, preferredStyle: .alert)
                        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                        controller.present(alert, animated: true)
                    } else {
                        LogInLoader.self.accessToken = json["data"]["access_token"].string!
                        print(json["data"]["access_token"])
                        controller.performSegue(withIdentifier: "showLocale", sender: self)
                    }
                case .failure:
                    print("Error: Failed to load token")
                        
                }
        }
    }
    
    func SignUp(name: String, email: String, password: String, controller: UIViewController) {
        let url = "http://apiecho.cf/api/signup/"
        let parameters = ["name":name, "email":email, "password":password]
        AF.request(url, method: .post, parameters: parameters).responseJSON { response in
                switch response.result {
                case .success(let value):
                    let json = JSON(value)
                    print(json)
                    if json["success"] == false {
                        let alert = UIAlertController(title: json["errors"][0]["name"].string!, message: json["errors"][0]["message"].string!, preferredStyle: .alert)
                        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                        controller.present(alert, animated: true)
                    } else {
                        LogInLoader.self.accessToken = json["data"]["access_token"].string!
                        controller.performSegue(withIdentifier: "showLocale", sender: self)
                    }
                case .failure:
                    print("Error: Failed to load token")
                        
                }
        }
    }
    
    func logOut(controller: UIViewController){
        LogInLoader.self.accessToken = ""
        _ = controller.navigationController?.popToRootViewController(animated: true)
    }
}
