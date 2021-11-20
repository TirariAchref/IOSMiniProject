//
//  event.swift
//  doctor
//
//  Created by achref on 9/11/2021.
//

import Foundation


struct event : Decodable {
    let idevent : Int
    let name : String
    let description : String
    let money : Float
    let moneyreached : Float
    let datefin : Date
    let user : User
    init(idevent : Int,
          name : String,
          description : String,
          money : Float,
          moneyreached : Float,
          datefin : Date,
          user : User)
    {
        self.idevent = idevent
        self.name = name
        self.description = description
        self.money = money
        self.moneyreached = moneyreached
        self.datefin = datefin
        self.user = user
        
    }
}
