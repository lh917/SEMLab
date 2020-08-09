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
    var whichSample = Int()
    
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
        dialogView.layer.cornerRadius = 20
        
        // Load local JSON file
        model.getLocalJsonFile()
        
    }
    
    // Update text fields once currentTabNumber is renewed
    func updateTextFields (){
        // Update the texts inside modal once currentTabNumber is updated
        if currentTabNumber != nil{
            titleLabel.text = samplesFakeDB.sampleArray[currentTabNumber!][0]["name"]!
            mainTextLabel.text = modalArray[currentTabNumber!].sampleText
            //disables next button if looking at Welcome instructions, as there is no sample to lead user to
            if currentTabNumber == 5 {
                nextButton.isHidden = true
            }
            else {
                nextButton.isHidden = false
            }
        }
        
    }
    
    // Display the welcome tab when the app is launched 
    func showWelcomeMessage (isAgain:Bool){
        
        if currentTabNumber == nil {
            
            // Welcome message is set at tab 6
            titleLabel.text = modalArray[5].textTitle
            mainTextLabel.text = modalArray[5].sampleText
            if isAgain == false {
                nextButton.isHidden = true
            }
            
        }
        
    }
    
    //MARK: - TabProtocol Methods
    // This method will be called once the model.getLocalJsonFile() is called in viewDidLoad()
    func textRetrived(_ tab: [Tab]) {
        // Get a reference to the tab array
        self.modalArray = tab
        
    }
    
    // MARK: - Button Action Method
    @IBAction func nextButtonTapped(_ sender: Any) {
        // Transition to detailed view
        
        if currentTabNumber == 6 {
            // Transition to SEM Intro
            performSegue(withIdentifier: "microscopeTrans", sender: self)
            
        }
        
        else if currentTabNumber != nil {
            //creates variable to pass to sample screen and tell it which sample is being viewed
            whichSample = currentTabNumber!
            //performs the segue to sample screen
            performSegue(withIdentifier: "viewTrans", sender: self)
        }
        
    }   
    
    @IBAction func returnButtonTapped(_ sender: Any) {
        // Dismiss the modal when tapped
        self.dismiss(animated: true, completion: nil)
        
    }
    
    //defines segue and tells view controller which sample to view
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if currentTabNumber == 6 {
            // segue for the microscope view
            let microViewController = segue.destination as! MicroscopeViewController
            
            // Set the label text
            //microViewController.titleLabel.text = "Scanning Electron Microscope"
            
        }
        
        else if currentTabNumber != nil {
            let vc = segue.destination as! SampleViewController
            vc.whichSample = self.whichSample
        }
        
    }
    

}
