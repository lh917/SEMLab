//
//  ZoomButtonCollectionViewCell.swift
//  SEMproto
//
//  Created by Emyr  on 04/08/2020.
//  Copyright © 2020 Emyr . All rights reserved.
//

import UIKit

class ZoomButtonCollectionViewCell: UICollectionViewCell {
     
    @IBOutlet weak var zoomButtonLabel: UILabel!
    
    
        var zoom:Zoom?
        
        func configureCell(zoom:Zoom, index:Int) {
            //keep track of the button this cell represents
            self.zoom = zoom
            
            //set title of button cell
            zoomButtonLabel.text = zoom.labelText
            
            //changes color of cell if it corresponds to selected view
            if zoom.isLit == true {
                zoomButtonLabel.backgroundColor = UIColor(red: 0/255, green: 140/255, blue: 186/255, alpha: 1)
            }
            
           
            
        }
        
        
    }

