//
//  user.swift
//  doctor
//
//  Created by achref on 9/11/2021.
//

import Foundation


enum categorieClient 
{
    case admin,client,medecin
}


struct User  {
    let id :    Int
    let nom : String
    let prenom :String
    let email : String
    let password : String
    let phone : String
    let categorielient : categorieClient
    let questions : Array<Question>
    let reponses : Array<Reponse>
    let messageries : Array<messagerie>
   
    
    init(id : Int,
     nom : String,
     prenom :String,
     email : String,
     password : String,
     phone : String,
     categorielient : categorieClient,
         questions : Array<Question>,
    reponses : Array<Reponse>,
         messageries : Array<messagerie>
       
    ){  self.id = id
        self.nom = nom
        self.prenom = prenom
        self.email = email
        self.password = password
        self.phone = phone
        self.categorielient = categorielient
        self.questions = questions
        self.reponses = reponses
        self.messageries = messageries
    

    }
}
