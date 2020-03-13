//
//  ResultController.swift
//  TestApp
//
//  Created by  AnnaigHoinart on 12.03.2020.
//  Copyright © 2020 Ikovalen. All rights reserved.
//

import UIKit

class ResultController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    var text = ""
    var dictionary = [Character:Int]()
    var charsAray = [Character]()

    @IBOutlet weak var resultTable: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        print(text)
        countChars()
        charsAray = Array(dictionary.keys).sorted()
        resultTable.delegate = self
        resultTable.dataSource = self
        

        // Do any additional setup after loading the view.
    }
    
    func countChars(){
        let chars = Array(text)
        var tmpDictionary = [Character:Int]()
        chars.forEach({ (char) in
        if let numberOfChars = tmpDictionary[char]  {
            tmpDictionary[char] = numberOfChars + 1
        } else {
            tmpDictionary[char] = 1
        }
        })
        dictionary = tmpDictionary
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dictionary.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = resultTable.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ResultCell
        
        cell.resultLabel.text = "\(charsAray[indexPath.row]) = \(dictionary[charsAray[indexPath.row]]!)"
        return cell
    }
    

}
