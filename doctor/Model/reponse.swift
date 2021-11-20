//
//  reponse.swift
//  doctor
//
//  Created by achref on 9/11/2021.
//

import Foundation


struct Reponse : Decodable{
    
    let idReponse : Int
    let Description : String
    let DateCreation : Date
    let Question : Question
    let user : User
    init (idReponse : Int,
           Description : String,
           DateCreation : Date,
           Question : Question,
          user : User
    )
    {
        self.idReponse = idReponse
        self.Description = Description
        self.DateCreation = DateCreation
        self.Question = Question
        self.user = user
    }
}
