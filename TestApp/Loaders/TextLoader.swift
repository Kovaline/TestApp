//
//  TextLoader.swift
//  TestApp
//
//  Created by  AnnaigHoinart on 13.03.2020.
//  Copyright © 2020 Ikovalen. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class TextLoader: NSObject {
    
    var text = ""
    func loadText(locale: String, controller: UIViewController){
        let url = "http://apiecho.cf/api/get/text/"
        let parameters = ["Locale":locale]
        let header: HTTPHeaders = ["Authorization":"Bearer \(LogInLoader.accessToken)"]
        
        AF.request(url, method: .get, parameters: parameters, encoding: URLEncoding(), headers: header).responseJSON { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                if json["success"] == false {
                    let alert = UIAlertController(title: json["errors"][0]["name"].string!, message: json["errors"][0]["message"].string!, preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                    controller.present(alert, animated: true)
                    if response.response?.statusCode == 401 {
                        LogInLoader().logOut(controller: controller)
                    }
                } else {
                    self.text = json["data"].string!
                    controller.performSegue(withIdentifier: "showResult", sender: self)
                }
            case .failure(let error):
                print(error)
                
            }
        }
    }
}
