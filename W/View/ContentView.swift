//
//  ContentView.swift
//  10 random
//
//  Created by  User on 24.09.2020.
//

import SwiftUI






struct ContentView: View {
    
    
    
   @ObservedObject var networkManager = NetworkManager()
    
     let url = "https://dictionary.cambridge.org/dictionary/english/"
   
    var body: some View {
        
        NavigationView{
            
            List(networkManager.posts){ post in
                NavigationLink(destination: DetailView(url:  url + post.word)) {
                Text(post.word)
                    .navigationBarTitle("Words Of random! ")
                    .padding()
                    
            }
            }
            .onAppear(perform: {networkManager.fetchData()})
        }
    
        }
    


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
}
