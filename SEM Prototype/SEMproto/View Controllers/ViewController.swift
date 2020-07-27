//
//  ViewController.swift
//  SEMproto
//
//  Created by Emyr  on 24/07/2020.
//  Copyright © 2020 Emyr . All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var menuCollectionView: UICollectionView!
    
    
    @IBOutlet weak var welcomeInstructions: UIImageView!
    
    @IBOutlet weak var exitButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    @IBAction func exitButtonTapped(_ sender: Any) {
        self.hideMenu()
    }
    
    func hideMenu() {
        exitButton.isHidden = true
        welcomeInstructions.isHidden = true
    }

}

