//
//  question.swift
//  doctor
//
//  Created by achref on 9/11/2021.
//

import Foundation




struct Question : Decodable{
    
    let idQuestion: Int
    let Description : String
    let DateCreation : Date
    let categoriequestion : String
    let user : User
    let reponses : Array<Reponse>
    
    init( idQuestion: Int,
          Description : String,
          DateCreation : Date,
          categoriequestion : String,
          user : User,
          reponses : Array<Reponse>)
    {
        self.idQuestion = idQuestion
        self.Description = Description
        self.DateCreation = DateCreation
        self.categoriequestion = categoriequestion
        self.user = user
        self.reponses = reponses
        
    }
    
}
