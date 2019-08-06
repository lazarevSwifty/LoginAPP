//
//  DetailViewController.swift
//  LoginApp
//
//  Created by Владислав Лазарев on 06/08/2019.
//  Copyright © 2019 Владислав Лазарев. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet var welcomeLabel: UILabel!
    var text: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "background")!)
        welcomeLabel.text = "Привет, \(String(describing: text!))!"
    }
    

    
}
