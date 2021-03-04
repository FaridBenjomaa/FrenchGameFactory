//
//  Weapon.swift
//  P3_01_Xcode
//
//  Created by Farid Benjomaa on 09/02/2021.
//

import Foundation

class Weapon{
    
    var nameEn : String = ""
    var name : String = ""
    var attackPoint : Int = 0
    var protectPoint : Int = 0
    var healPoint : Int = 0
    
    init(){
        self.name = ""
        self.nameEn = ""
    }
    
    init(name: String, nameEn : String, attackPoint: Int){
        self.name = name
        self.nameEn = nameEn
        self.attackPoint = attackPoint
    }
    init(name: String, nameEn : String, attackPoint: Int, protectPoint: Int){
        self.name = name
        self.nameEn = nameEn
        self.attackPoint = attackPoint
        self.protectPoint = protectPoint
    }
    init(name: String, nameEn : String, attackPoint: Int, healPoint: Int){
        self.name = name
        self.nameEn = nameEn
        self.attackPoint = attackPoint
        self.healPoint = healPoint
    }
    
    
}
