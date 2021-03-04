//
//  Team.swift
//  P3_01_Xcode
//
//  Created by Farid Benjomaa on 11/02/2021.
//

import Foundation

class Team {

    
    var teamName = ""
    var teamPoint = 300
    var teamMember : Array<String>
    var isAttack : Bool = false
   
    
    init(character1: String, character2: String, character3: String, teamName: String){
        self.teamMember = [character1, character2, character3]
        self.teamName = teamName
    }
    
    

}
