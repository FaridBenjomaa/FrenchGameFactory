//
//  Character.swift
//  P3_01_Xcode
//
//  Created by Farid Benjomaa on 09/02/2021.
//

import Foundation

class Character {

    var name : String?
    var lifePoint : Int = 100
    var weapon = Weapon()
    var isALive : Bool = true
    var protectPoint = 0
    var healPoint = 40
    var canHeal = true
   
    init(name: String){
        self.name = name
        self.lifePoint = 100
        self.isALive = true
    }
    
    func changeName() {
        if game.party.langue == "Fr"{
            print("\nCe nom existe deja merci d'en choisir un autre : ")
        }else{
            print("\nThis name already exists please choose another one : ")
        }
        if let choice = readLine(){
            name = choice.capitalized
        }
    }
    func armeChoice() {
        
        var arme : String?
        
        func choice(){
            if game.party.langue == "Fr"{
                print("\nQuel arme voulez vous ?"
                        + "\n1.  Une ache"
                        + "\n2.  Une epée"
                        + "\n3.  Un bouclier"
                        + "\n4.  Livre")
            }else{
                print("\nWitch weapon do you want ?"
                        + "\n1.  Axe"
                        + "\n2.  Sword"
                        + "\n3.  Shield"
                        + "\n4.  Book")
            }
            arme = readLine()
        }
        choice()
        if  arme != nil {
            switch arme {
                case "1": // Ajouter une nouvelle activité
                    weapon = game.axe
                    if game.party.langue == "Fr"{
                        print("\(name!) posede une \(weapon.name)")
                    }else{
                        print("\(name!) has a  \(weapon.name)")
                    }
                    
                case "2": // Consulter la banque
                    weapon = game.sword
                    if game.party.langue == "Fr"{
                        print("\(name!) posede une \(weapon.name)")
                    }else{
                        print("\(name!) has a  \(weapon.nameEn)")
                    }
                    
                case "3": // Consulter la grange
                    weapon = game.shield
                    
                    if game.party.langue == "Fr"{
                        print("\(name!) posede un \(weapon.name)")
                    }else{
                        print("\(name!) has a \(weapon.nameEn)")
                    }
                    
                case "4" :
                    weapon = game.book
                    
                    if game.party.langue == "Fr"{
                        print("\(name!) posede un \(weapon.name)")
                    }else{
                        print("\(name!) has a  \(weapon.nameEn)")
                    }
                    
                default:
                    if game.party.langue == "Fr"{
                        print("Merci de faire un choix entre 1 et 4")
                        choice()
                    }else{
                        print("Please make a choice between 1 and 4")
                        choice()
                    }
                    
            }
            
        }
    
    }
    func weaponChoiceAlea(){
        
        let arme = Int.random(in: 0..<5)
        
        func choice(){
            if game.party.langue == "Fr"{
                print("\nQuel arme voulez vous ?"
                        + "\n1.  Une ache"
                        + "\n2.  Une epée"
                        + "\n3.  Un bouclier"
                        + "\n4. main nue")
            }else{
                print("\nWitch weapon do you want ?"
                        + "\n1.  Axe"
                        + "\n2.  Sword"
                        + "\n3.  Shield"
                        + "\n4.  Hand")
            }
            
        }
        choice()
        
        switch arme {
            case 1: // Ajouter une nouvelle activité
                weapon = game.axe
                if game.party.langue == "Fr"{
                    print("\(name!) posede une \(weapon.name)")
                }else{
                    print("\(name!) has a  \(weapon.name)")
                }
                
            case 2: // Consulter la banque
                weapon = game.sword
                if game.party.langue == "Fr"{
                    print("\(name!) posede une \(weapon.name)")
                }else{
                    print("\(name!) has a  \(weapon.name)")
                }
            case 3: // Consulter la grange
                weapon = game.shield
                if game.party.langue == "Fr"{
                    print("\(name!) posede une \(weapon.name)")
                }else{
                    print("\(name!) has a  \(weapon.name)")
                }
            case 4 :
                weapon = game.book
                if game.party.langue == "Fr"{
                    print("\(name!) posede une \(weapon.name)")
                }else{
                    print("\(name!) has a  \(weapon.name)")
                }
            default:
                if game.party.langue == "Fr"{
                    print("Merci de faire un choix entre 1 et 4")
                    choice()
                }else{
                    print("Please make a choice between 1 and 4")
                    choice()
                }
                
               
        }
      
    }
    func attack(character2: Character, team: Team){
        character2.lifePoint -= weapon.attackPoint
        team.teamPoint -= weapon.attackPoint
        if character2.lifePoint <= 0 {
            character2.lifePoint = 0
            character2.isALive = false
        }
        
        if team.teamPoint <= 0 {
            team.teamPoint = 0
        }
        
        
        if game.party.langue == "Fr"{
            print("\n\(name!) attaque \(character2.name!) "
                    + "\n \(character2.name!) perd \(weapon.attackPoint) point de vie"
                    + "\n il reste \(character2.lifePoint) point de vie à \(character2.name!)")
        }else{
            print("\n\(name!) attack \(character2.name!) "
                    + "\n \(character2.name!) lose \(weapon.attackPoint) healt point"
                    + "\n there are \(character2.lifePoint) life point left to  \(character2.name!)")
        }
        
        if character2.lifePoint <= 0 {
            if game.party.langue == "Fr"
            {
                print("\(character2.name!) est KO!")
            }else{
                print("\(character2.name!) is KO!")
                
            }
            
            
        }
    }
    func heal(character2: Character, team: Team){
        character2.lifePoint += healPoint
        team.teamPoint += healPoint
        if game.party.langue == "Fr"{
            print("\(name!) utilise une potion sur \(character2.name!) qui soigne de \(healPoint) point de vie")
        }else{
            print("\(name!) Use a potion on \(character2.name!) and heal  \(healPoint)  life point")
        }
        
        if character2.lifePoint >= 100 {
            character2.lifePoint = 100
        }
        if game.party.langue == "Fr"{
            print("Les point de vie de \(character2.name!) sont maintenant de \(character2.lifePoint) point de vie")
        }else{
            print("\(character2.name!)'s life point are now \(character2.lifePoint) life point")
        }
        
        if team.teamPoint >= 300  {
            team.teamPoint = 300
        }
        
        
        
        
        
        
        
    }
    

}
