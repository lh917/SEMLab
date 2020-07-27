//
//  TabModel.swift
//  SEMproto
//
//  Created by Han on 2020/7/27.
//  Copyright © 2020 Emyr . All rights reserved.
//

import Foundation

class TabModel {
    
    // Number of models as optional, provided in main script
    var numModels:Int?
    
    
    // Function to generate an array of Tabs
    func getTabArray (numModels:Int) -> [Tab] {
        
        // Create empty array to contain tabs
        var tabArray = [Tab]()
        
        // Loop through the number given
        for count in 1 ... (numModels) {
            
            // Create a new tab
            let tab = Tab()
            
            // Assign image name, MUST BE THE SAME AS THE IMAGE FILE
            tab.imageName = "tab_image\(count)"
            
            tabArray.append(tab)
            
        }
        return tabArray
    }
    
}
