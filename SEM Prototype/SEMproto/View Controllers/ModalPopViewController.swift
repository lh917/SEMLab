//
//  ModalPopViewController.swift
//  SEMproto
//
//  Created by Han on 2020/7/29.
//  Copyright © 2020 Emyr . All rights reserved.
//

import UIKit

class ModalPopViewController: UIViewController, TabProtocol {
    
    // Connect the labels, views and button
    @IBOutlet weak var dimView: UIView!
    @IBOutlet weak var dialogView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var mainTextLabel: UILabel!
    @IBOutlet weak var nextButton: UIButton!
    
    // Placeholder text
    var titleText = "Test Title"
    var mainText = "Test Text"
    
    // Init model
    var model = TabModel()
    var modalArray = [Tab]()
    // Number to keep track of the tab clicked
    var currentTabNumber:Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Assign delegate 
        model.delegate = self
        
        // Style the corner of the dialog view
        dialogView.layer.cornerRadius = 10
        
        // Load local JSON file
        model.getLocalJsonFile()
        
    }
    
    // Update text fileds once currentTabNumber is renewed 
    func updateTextFields (){
        // Update the texts inside modal once currentTabNumber is updated
        if currentTabNumber != nil{
            titleLabel.text = modalArray[currentTabNumber!].textTitle
            mainTextLabel.text = modalArray[currentTabNumber!].sampleText
        }
        
    }
    
    //MARK: - TabProtocol Methods
    // This method will be called once the model.getLocalJsonFile() is called in viewDidLoad()
    func textRetrived(_ tab: [Tab]) {
        // Get a reference to the tab array
        self.modalArray = tab
        
    }
    
    // MARK: - Button Action Method
    @IBAction func buttonTapped(_ sender: Any) {
        
        // TODO: Define button action
        
    }
    

}
