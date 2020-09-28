//
//  NetworkManager.swift
//  10 random
//
//  Created by  User on 24.09.2020.
//

import Foundation

class NetworkManager: ObservableObject {
    
   
    

    let listMaker = MakingAList()
    
    @Published var posts =  [MyListDataType]()
   
    
    
    func fetchData(){
        if let url = URL(string: "https://random-word-api.herokuapp.com/word?number=10"){
            let  session = URLSession ( configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error == nil{
                    let decoder = JSONDecoder()
                    if let safeData = data {
                        do{
                 let results =  try decoder.decode(Words.self, from: safeData)
                            DispatchQueue.main.async {
                                
                                self.posts = self.listMaker.makingAList(MyArray: results)
                                
                            }
                            print (results)
                        }
                        catch{
                            print (error)
                        }
                    }
                }
            }
            task.resume()
        }
    }
}

