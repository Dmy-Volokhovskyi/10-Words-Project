//
//  MakingAList .swift
//  10 random
//
//  Created by  User on 25.09.2020.
//

import SwiftUI

struct MakingAList{
    
    
    let sharedDefault = UserDefaults(suiteName: "group.RandomWords")!
    
    func makingAList( MyArray : [String]) -> [MyListDataType] {
        
        
        var WorsArray = [MyListDataType]()
      
        for word in MyArray{
            
            WorsArray.append ( MyListDataType(word: word))
        }
        return WorsArray
    }
    
    
}
struct MyListDataType : Identifiable {
    var word : String
   var id = UUID()
    
}

