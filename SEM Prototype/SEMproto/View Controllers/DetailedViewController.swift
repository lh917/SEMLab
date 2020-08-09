//
//  DetailedViewController.swift
//  SEMproto
//
//  Created by Han on 2020/8/3.
//  Copyright © 2020 Emyr . All rights reserved.
//

import UIKit

class DetailedViewController: UIViewController {

    @IBOutlet weak var dismissButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func dismissButtonTapped(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
        
    }
    

}
