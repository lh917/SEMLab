//
//  TabCollectionViewCell.swift
//  SEMproto
//
//  Created by Han on 2020/7/27.
//  Copyright © 2020 Emyr . All rights reserved.
//

import UIKit

class TabCollectionViewCell: UICollectionViewCell {
    
    // This customised class controls the behaviour of tab images and touch behaviour
    
    // Gain access to the tab image
    @IBOutlet weak var tabImageView: UIImageView!
    
    @IBOutlet weak var sampleNameLabel: UILabel!
    
    var tab:Tab?
    
    // Set tab image
    func configureTab (tab:Tab) {
        
        self.tab = tab
        
        // Set image of that tab to the corresponding image
        tabImageView.image = UIImage(named: tab.imageName)
        sampleNameLabel.text = tab.sampleName
        
        
    }
    
    // Animate the tab when clicked
    func tabAnimation (){
        
        UIView.transition(from: tabImageView, to: tabImageView, duration: 0.3, options: [.showHideTransitionViews, .transitionFlipFromLeft], completion: nil)
        
    }
    
}
