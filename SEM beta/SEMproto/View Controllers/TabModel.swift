//
//  TabModel.swift
//  SEMproto
//
//  Created by Han on 2020/7/27.
//  Copyright © 2020 Emyr . All rights reserved.
//

import Foundation

// Impelement delegate protocol
protocol TabProtocol {
    func textRetrived(_ tab:[Tab])
}

class TabModel {
    
    // Number of models as optional, provided in main script
    var numModels:Int?
    
    // Assign delegate
    var delegate:TabProtocol?
    
    
    // Function to generate an array of Tabs
    func getTabArray() -> [Tab] {
        
        // Create empty array to contain tabs
        var tabArray = [Tab]()
        
        // Loop through the number given
        for count in 0 ... (samplesFakeDB.sampleArray.count - 1) {
            
            // Create a new tab
            let tab = Tab()
            
            // Assign image name, MUST BE THE SAME AS THE IMAGE FILE
            //tab.imageName = samplesFakeDB.sampleArray[count][0]["image"]!
            tab.imageName = "tab_image\(count+1)"
            tab.sampleName = samplesFakeDB.sampleArray[count][0]["name"]!
            
            tabArray.append(tab)
            
        }
        return tabArray
    }
    
    // Function to load local json file and process the file to generate Tab object
    func getLocalJsonFile(){
        
        // Get path to json file, returns path if exist, or returns nil
        // Double check if the path exists
        if let path = Bundle.main.path(forResource: "TabQuestions", ofType: "json") {
            // Path exists, create URL object from path
            let url = URL(fileURLWithPath: path)
            
            // Get data from URL
            do {
                // Obtain the json data
                let data = try Data(contentsOf: url)
                
                // Try to decode the data into objects
                let decoder = JSONDecoder()
                let array = try decoder.decode([Tab].self, from: data)
                
                // Notify the delegate, pass on the questions to modal pop view controller
                delegate?.textRetrived(array)
                
            } catch{
                // Error: could not download the data at that url
                print("Decoder error!")
            }
            
        } else {
            // Cannot find path
            print("Could not find the json file!")
            return
        }

    }
    
    
}
