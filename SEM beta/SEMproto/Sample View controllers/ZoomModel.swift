//
//  ZoomModel.swift
//  SEMproto
//
//  Created by Emyr  on 04/08/2020.
//  Copyright © 2020 Emyr . All rights reserved.
//

import Foundation

class ZoomModel {
    func getZooms(index:Int) -> [Zoom] {
        //declare empty array
        var generatedZooms = [Zoom]()
        
        //defines properties for each entry and appends to array
        for j in 0...(samplesFakeDB.sampleArray[index].count-1) {
            let newEntry = Zoom()
            // Level of magnification 
            newEntry.labelText = "x\(samplesFakeDB.sampleArray[index][j]["mag"]!)"
            if j == 0 {
                newEntry.isLit = true
            }
            else {
                newEntry.isLit = false
            }
            
            
            generatedZooms += [newEntry]
        }
        //returns array of sample objects
        return generatedZooms
    }
}

