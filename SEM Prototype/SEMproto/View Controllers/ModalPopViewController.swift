//
//  ModalPopViewController.swift
//  SEMproto
//
//  Created by Han on 2020/7/29.
//  Copyright © 2020 Emyr . All rights reserved.
//

import UIKit

class ModalPopViewController: UIViewController {
    
    // Connect the labels, views and button
    @IBOutlet weak var dimView: UIView!
    @IBOutlet weak var dialogView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var mainTextLabel: UILabel!
    @IBOutlet weak var nextButton: UIButton!
    
    var titleText = ""
    var mainText = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Set the texts for title and main text
        titleLabel.text = titleText
        mainTextLabel.text = mainText
    }
    
    // Button action method
    @IBAction func buttonTapped(_ sender: Any) {
    }
    

}
