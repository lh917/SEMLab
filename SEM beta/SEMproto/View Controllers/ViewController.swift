//
//  ViewController.swift
//  SEMproto
//
//  Created by Emyr  on 24/07/2020.
//  Copyright © 2020 Emyr . All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    // Gain access to main menu collection view
    @IBOutlet weak var mainMenuCollectionView: UICollectionView!
    
    
    // Init tab model and array
    let model = TabModel()
    var tabArray = [Tab]()
    //variable to record whether this is the first time loading the menu. If true, it means the user has returned to menu screen from the sample screen
    var backIndex = Bool()
    
    
    
    // Set number of models
    let numTabs:Int = samplesFakeDB.sampleArray.count
    
    // Popup window controller
    var modalDialog:ModalPopViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set up array of tabs
        tabArray = model.getTabArray()
        
        // Set view controller as datasource and delegate of the collection view
        mainMenuCollectionView.dataSource = self
        mainMenuCollectionView.delegate = self
        
        // Init modal dialog controller
        if #available(iOS 13.0, *) {
            modalDialog = storyboard?.instantiateViewController(identifier: "ModalVC") as? ModalPopViewController
            modalDialog?.modalPresentationStyle = .formSheet
            modalDialog?.preferredContentSize = CGSize(width: 1000, height: 1000)
        } else {
            // TODO: Fallback on earlier versions
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        // After the view appears, summon the welcome modal (if this is first time loading). On subsequently returning to menu screen, user presses to summon the welcome modal
        if modalDialog != nil && backIndex == false {
            present(modalDialog!, animated: true, completion: nil)
            
            // Update texts based on currentTabNumber
            modalDialog!.showWelcomeMessage(isAgain:backIndex)
        }
    }
    
    
    
    
    //MARK: - Collection View Delegate Methods
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        // Return number of tabs to be displayed
        return tabArray.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "menuTab", for: indexPath) as! TabCollectionViewCell
        
        let tab = tabArray[indexPath.row]
        
        // Configure each tab/cell
        cell.configureTab(tab: tab)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        // Animate the tab
        let cell = collectionView.cellForItem(at: indexPath) as? TabCollectionViewCell
        cell?.tabAnimation()
        
        // If modalDialog is not empty, show the content
        if modalDialog != nil {
            modalDialog!.currentTabNumber = indexPath.row
            present(modalDialog!, animated: true, completion: nil)
            
            // Update texts based on currentTabNumber
            modalDialog!.updateTextFields()
        }
        
    }
    
    

}

