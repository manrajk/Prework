//
//  SettingsViewController.swift
//  Prework
//
//  Created by Manraj Kumar on 1/13/21.
//

import UIKit

class SettingsViewController: UIViewController {

    
    @IBOutlet weak var curTest: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func closeButton(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    
    
    
}
