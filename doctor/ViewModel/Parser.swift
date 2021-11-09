//
//  Parser.swift
//  doctor
//
//  Created by achref on 9/11/2021.
//

import Foundation


struct Parser {
    
    func parse(){
        let api = URL(string: "fd")
        
        URLSession.shared.dataTask(with: api!){
            data,response,error in
            if error != nil {
                print(error?.localizedDescription)
                return
            }
            do{
                let result = try JSONDecoder().decode(Root.self,from: data!)
                print(result)
                                                      
            }catch{
                
            }
        }.resume()
    }
}
