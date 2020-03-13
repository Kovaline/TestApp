//
//  LocaleController.swift
//  TestApp
//
//  Created by  AnnaigHoinart on 12.03.2020.
//  Copyright © 2020 Ikovalen. All rights reserved.
//

import UIKit

class LocaleController: UIViewController, UITableViewDataSource, UITableViewDelegate {
 
    
 
    
    @IBOutlet weak var localesTable: UITableView!
    
    let locales = [ "bg_BG", "da_DK", "el_GR", "en_NG", "en_ZA", "fi_FI", "he_IL", "ka_GE", "me_ME", "nl_NL", "pt_PT", "sr_Cyrl_RS", "tr_TR", "zh_TW", "ar_JO", "en_AU", "en_NZ", "es_AR", "hr_HR", "kk_KZ", "ro_MD", "sr_Latn_RS", "uk_UA", "ar_SA", "bn_BD", "de_AT", "en_CA", "en_PH", "es_ES", "fr_BE", "is_IS", "ko_KR", "mn_MN", "ro_RO", "sr_RS", "at_AT", "de_CH", "en_GB", "en_SG", "es_PE", "fr_CA", "hu_HU", "it_CH", "nb_NO", "ru_RU", "sv_SE", "de_DE", "en_HK", "en_UG", "es_VE", "fr_CH", "hy_AM", "it_IT", "lt_LT", "ne_NP", "pl_PL", "sk_SK", "vi_VN", "cs_CZ", "el_CY", "en_IN", "en_US", "fa_IR", "fr_FR", "id_ID", "ja_JP", "lv_LV", "nl_BE", "pt_BR", "sl_SI", "th_TH", "zh_CN"]
    var locale = ""
    
    @IBAction func logOutButtonClicked(_ sender: Any) {
        let logOut = LogInLoader()
        logOut.logOut(controller: self)
     }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        localesTable.delegate = self
        localesTable.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let chosenCell = localesTable.cellForRow(at: indexPath) as! LocalesCell
        locale = chosenCell.localesLabel.text!
        TextLoader().loadText(locale: locale, controller: self)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        locales.count
     }
     
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = localesTable.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! LocalesCell
        cell.localesLabel.text = locales[indexPath.row]
        
        return cell
     }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showResult" {
            let result = segue.destination as! ResultController
            if let resultText = sender as? TextLoader {
                result.text = resultText.text
                
            }
            
        }
    }

}
