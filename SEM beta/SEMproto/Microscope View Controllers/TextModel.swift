//
//  TextModel.swift
//  SEMproto
//
//  Created by Han on 2020/8/9.
//  Copyright © 2020 Emyr . All rights reserved.
//

import Foundation

protocol TextProtocol {
    func textRetrived(_ text: [Text])
}

class TextModel {
    
    var delegate:TextProtocol?
    
    func getTextArray () -> [Text] {
        
        var textArray = [Text]()
        
        for _ in 1...3{
            
            let text = Text()
            textArray.append(text)
            
        }
        
        return textArray
        
    }
    
    func getLocalData () {
        
        // Get path to json file, returns path if exist, or returns nil
        // Double check if the path exists
        if let path = Bundle.main.path(forResource: "IntroductionText", ofType: "json") {
            // Path exists, create URL object from path
            let url = URL(fileURLWithPath: path)
            
            // Get data from URL
            do {
                // Obtain the json data
                let data = try Data(contentsOf: url)
                
                // Try to decode the data into objects
                let decoder = JSONDecoder()
                let array = try decoder.decode([Text].self, from: data)
                
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
