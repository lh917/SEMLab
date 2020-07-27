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
    
    var tab:Tab?
    
    func configureTab (tab:Tab) {
        
        self.tab = tab
        
        // Set image of that tab to the corresponding image
        tabImageView.image = UIImage(named: tab.imageName)
        
    }
    
}
