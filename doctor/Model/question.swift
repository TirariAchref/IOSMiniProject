//
//  question.swift
//  doctor
//
//  Created by achref on 9/11/2021.
//

import Foundation

enum categorieQuestion
{
    case maladiescardiovasculaires,
         cancers,
         problemesrespiratoires,
         systemenerveuxetcerveau,
         problemesintimes,
         maladiesdepeau,
         troublesdigestifs,
         osetarticulations,
         grandesmaladies,
         groquesetdependaces,
         autre
}



struct Question{
    
    let idQuestion: Int
    let Description : String
    let DateCreation : Date
    let categoriequestion : categorieQuestion
    let user : User
    let reponses : Array<Reponse>
    
    init( idQuestion: Int,
          Description : String,
          DateCreation : Date,
          categoriequestion : categorieQuestion,
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
