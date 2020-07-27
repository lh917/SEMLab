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
    
    // Set number of models
    let numTabs:Int = 5
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set up array of tabs
        tabArray = model.getTabArray(numModels: numTabs)
        
        // Set view controller as datasource and delegate of the collection view
        mainMenuCollectionView.dataSource = self
        mainMenuCollectionView.delegate = self

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
    

}

