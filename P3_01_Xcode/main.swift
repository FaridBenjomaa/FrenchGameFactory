//
//  main.swift
//  P3_01_Xcode
//
//  Created by Farid Benjomaa on 09/02/2021.
//

import Foundation

// Joueur
var player1 : String = "Player 1"
var player2 : String = "Player 2"

// personnages Joueur 1
var player1Chara1 = Character()
var player1Chara2 = Character()
var player1Chara3 = Character()


// personnages Joueur 2
var player2Chara1 = Character()
var player2Chara2 = Character()
var player2Chara3 = Character()

// Armes
var axe = Weapon()
axe.name = "Hache"
axe.attackPoint = 100

var sword = Weapon()
sword.name = "Epée"
sword.attackPoint = 20

var shield = Weapon()
shield.name = "Bouclier"
shield.attackPoint = 0
shield.protectPoint = 30

/* ************************************************************************
                                Fonction
 ************************************************************************** */
func armeRandom(character: Character){
    let numalea = Int.random(in: 1..<4)
    
    switch numalea {
        case 1:
            character.weapon = axe
            print("\(character.name!) optien la \(character.weapon.name) qui se trouve dans le coffre")
        case 2:
            character.weapon = sword
            print("\(character.name!) optien l' \(character.weapon.name) qui se trouve dans le coffre")
        case 3:
            character.weapon = shield
            print("\(character.name!) optien le \(character.weapon.name) qui se trouve dans le coffre")
        default:
            character.weapon = axe
    }
}


func menuPersonage(character: Character) {
    print("Quels est le nom de votre personnage : ")
    if let choice = readLine(){
        character.name = choice
    
    }
}
func armeChoise(character: Character){
    print("Quel arme voulez vous ?"
            + "\n1.  Une ache"
            + "\n2.  Une epée"
            + "\n3.  Un bouclier")
    if let arme = readLine() {
        switch arme {
            case "1": // Ajouter une nouvelle activité
                character.weapon = axe
                print("\(character.name!) posede une \(character.weapon.name)")
            case "2": // Consulter la banque
                character.weapon = sword
                print("\(character.name!) posede une \(character.weapon.name)")
            case "3": // Consulter la grange
                character.weapon = shield
                print("\(character.name!) posede un \(character.weapon.name)")
            default:
                print("Je ne comprends pas")
        }
        
    }
}

func ChagerdeNom(character: Character) {
    print("Ce nom existe deja merci d'en choisir un autre : ")
    if let choice = readLine(){
        character.name = choice
    }
}


func combat(character : Character, character2: Character){
    character2.lifePoint -= character.weapon.attackPoint
    if character2.lifePoint <= 0 {
        character2.lifePoint = 0
        character2.state = "KO"
    }
    print("\n\(character.name!) attaque \(character2.name!) "
        + "\n \(character2.name!) perd \(character.weapon.attackPoint) point de vie"
    + "\n il reste \(character2.lifePoint) point de vie à \(character2.name!)")
    if character2.lifePoint <= 0 {
        print("\(character2.name!) est KO!")
    }
}



func menuAttackJ1(){
    
            var p1 : Int = 0
            var p2 : Int = 0
        var perso : String?
            
        if player1Chara1.lifePoint <= 0 {
            print("Quel personnage voulez vous ?"
                    + "\n2.  \(player1Chara2.name!)"
                    + "\n3.  \(player1Chara3.name!)")
            perso = readLine()
        }else if player1Chara2.lifePoint <= 0 {
            print("Quel personnage voulez vous ?"
                    + "\n1.  \(player1Chara1.name!)"
                    + "\n3.  \(player1Chara3.name!)")
            perso = readLine()
        }else if player1Chara3.lifePoint <= 0 {
            print("Quel personnage voulez vous ?"
                    + "\n1.  \(player1Chara1.name!)"
                    + "\n2.  \(player1Chara2.name!)")
            
            perso = readLine()
        }else if ((player1Chara3.lifePoint <= 0) && (player1Chara2.lifePoint <= 0)) {
                print("Quel personnage voulez vous ?"
                        + "\n1.  \(player1Chara1.name!)")
                perso = readLine()
        }else if ((player1Chara1.lifePoint <= 0) && (player1Chara2.lifePoint <= 0)) {
            print("Quel personnage voulez vous ?"
                    + "\n1.  \(player1Chara3.name!)")
            perso = readLine()
        }else if ((player1Chara3.lifePoint <= 0) && (player1Chara1.lifePoint <= 0)) {
            print("Quel personnage voulez vous ?"
                    + "\n1.  \(player1Chara2.name!)")
            perso = readLine()
        }else{
            print("Quel personnage voulez vous ?"
                    + "\n1.  \(player1Chara1.name!)"
                    + "\n2.  \(player1Chara2.name!)"
                    + "\n3.  \(player1Chara3.name!)")
            perso = readLine()
            
        }
    
        if perso != nil {
            switch perso {
                case "1": // Ajouter une nouvelle activité
                    p1 = 1
                case "2": // Consulter la banque
                    p1 = 2
                case "3": // Consulter la grangeplayer2 = player1Chara1.name!
                    p1 = 3
                default:
                    print("Je ne comprends pas")
            }
        }
        
        if player2Chara1.lifePoint <= 0 {
            print("Quel personnage voulez attaquer ?"
                    + "\n2.  \(player2Chara2.name!)"
                    + "\n3.  \(player2Chara3.name!)")
            perso = readLine()
        }else if player2Chara2.lifePoint <= 0 {
            print("Quel personnage voulez attaquer ?"
                    + "\n1.  \(player2Chara1.name!)"
                    + "\n3.  \(player2Chara3.name!)")
            perso = readLine()
        }else if player2Chara3.lifePoint <= 0 {
            print("Quel personnage voulez attaquer ?"
                    + "\n1.  \(player2Chara1.name!)"
                    + "\n2.  \(player2Chara2.name!)")

            perso = readLine()
        }else if ((player2Chara3.lifePoint <= 0) && (player2Chara2.lifePoint <= 0)) {
            print("Quel personnage voulez vous ?"
                    + "\n1.  \(player1Chara1.name!)")
            perso = readLine()
        }else if ((player2Chara1.lifePoint <= 0) && (player2Chara2.lifePoint <= 0)){
            print("Quel personnage voulez vous ?"
                    + "\n1.  \(player1Chara3.name!)")
            perso = readLine()
        }else if ((player2Chara3.lifePoint <= 0) && (player2Chara1.lifePoint <= 0)) {
            print("Quel personnage voulez vous ?"
                    + "\n1.  \(player1Chara2.name!)")
            perso = readLine()
        }else{
            print("Quel personnage voulez attaquer ?"
                    + "\n1.  \(player2Chara1.name!)"
                    + "\n2.  \(player2Chara2.name!)"
                    + "\n3.  \(player2Chara3.name!)")
           perso = readLine()
               
        }
            if perso != nil {
                switch perso {
                    case "1": // Ajouter une nouvelle activité
                        p2 = 4
                    case "2": // Consulter la banque
                        p2 = 5
                    case "3": // Consulter la grangeplayer2 = player1Chara1.name!
                        p2 = 6
                    default:
                        print("Je ne comprends pas")
                }
            }
            
                
                let coffre = Int.random(in: 1..<10)
              
    
                if p1 == 1 && p2 == 4{
                    if coffre  == 1 {
                        print("Un coffre apparait")
                        armeRandom(character: player1Chara1)
                    }
                    combat(character: player1Chara1, character2: player2Chara1)
                    
                }
                if p1 == 1 && p2 == 5{
                    
                    if coffre  == 1 {
                        print("Un coffre apparait")
                        armeRandom(character: player1Chara1)
                    }
                    combat(character: player1Chara1, character2: player2Chara2)
                }
    
                if p1 == 1 && p2 == 6{
                   
                    if coffre  == 1 {
                        print("Un coffre apparait")
                        armeRandom(character: player1Chara1)
                    }
                    combat(character: player1Chara1, character2: player2Chara3)
                }
    
                if p1 == 2 && p2 == 4{
                    
                    if coffre  == 1 {
                        print("Un coffre apparait")
                        armeRandom(character: player1Chara2)
                    }
                    combat(character: player1Chara2, character2: player2Chara1)
                }
    
                if p1 == 2 && p2 == 5{
                    
                    if coffre  == 1 {
                        print("Un coffre apparait")
                        armeRandom(character: player1Chara2)
                    }
                    combat(character: player1Chara2, character2: player2Chara2)
                }
                if p1 == 2 && p2 == 6{
                    
                    if coffre  == 1 {
                        print("Un coffre apparait")
                        armeRandom(character: player1Chara2)
                    }
                    combat(character: player1Chara2, character2: player2Chara3)
                }
                if p1 == 3 && p2 == 4{
                    
                    if coffre  == 1 {
                        print("Un coffre apparait")
                        armeRandom(character: player1Chara3)
                    }
                    combat(character: player1Chara3, character2: player2Chara1)
                }
    
                if p1 == 3 && p2 == 5{
                    
                    if coffre  == 1 {
                        print("Un coffre apparait")
                        armeRandom(character: player1Chara3)
                    }
                    combat(character: player1Chara3, character2: player2Chara2)
                }
    
                if p1 == 3 && p2 == 6{
                   
                    if coffre  == 1 {
                        print("Un coffre apparait")
                        armeRandom(character: player1Chara3)
                    }
                    combat(character: player1Chara3, character2: player2Chara3)
                }
     
    }
    
func menuAttackJ2(){
    
    var p1 : Int = 0
    var p2 : Int = 0
    var perso : String?
    
    
  /*   if player2Chara1.lifePoint <= 0 {
        print("Quel personnage voulez vous ?"
                + "\n2.  \(player2Chara2.name!)"
                + "\n3.  \(player2Chara3.name!)")
        perso = readLine()
    }else if player2Chara2.lifePoint <= 0 {
        print("Quel personnage voulez vous ?"
                + "\n1.  \(player2Chara1.name!)"
                + "\n3.  \(player2Chara3.name!)")
        perso = readLine()
    }else if player2Chara3.lifePoint <= 0 {
        print("Quel personnage voulez vous ?"
                + "\n1.  \(player2Chara1.name!)"
                + "\n2.  \(player2Chara2.name!)")
        
        perso = readLine()
    }else if player2Chara3.lifePoint <= 0 && player2Chara2.lifePoint <= 0 {
        print("Quel personnage voulez vous ?"
                + "\n1.  \(player2Chara1.name!)")
        perso = readLine()
    }else if player2Chara1.lifePoint <= 0 && player2Chara2.lifePoint <= 0 {
        print("Quel personnage voulez vous ?"
                + "\n3.  \(player2Chara3.name!)")
        perso = readLine()
    }else if player2Chara3.lifePoint <= 0 && player2Chara1.lifePoint <= 0 {
        print("Quel personnage voulez vous ?"
                + "\n2.  \(player2Chara2.name!)")
        perso = readLine()
    }else{ */
    
        print("Quel personnage voulez vous choisir ?")
        if player1Chara1.state != "life"{
            print("\n1.  \(player2Chara1.name!) KO")
        }else{
            print("\n1.  \(player2Chara1.name!)")
        }
    if player1Chara1.state != "life"{
        print("\n2.  \(player2Chara2.name!) KO")
    }else{
        print("\n2.  \(player2Chara2.name!)")
    }
    if player1Chara1.state != "life"{
        print("\n3.  \(player2Chara3.name!) KO")
    }else{
        print("\n3.  \(player2Chara3.name!)")
    }
        perso = readLine()
        
   
    if perso != nil {
        switch perso {
            case "1": // Ajouter une nouvelle activité
                p1 = 1
            case "2": // Consulter la banque
                p1 = 2
            case "3": // Consulter la grangeplayer2 = player1Chara1.name!
                p1 = 3
            default:
                print("Je ne comprends pas")
        }
    }
    
    print("Quel personnage voulez vous attaquer ?")
    if player1Chara1.state != "life"{
        print("\n1.  \(player1Chara1.name!) KO")
    }else{
        print("\n1.  \(player1Chara1.name!)")
    }
    if player1Chara1.state != "life"{
        print("\n2.  \(player1Chara2.name!) KO")
    }else{
        print("\n2.  \(player1Chara2.name!)")
    }
    if player1Chara1.state != "life"{
        print("\n3.  \(player1Chara3.name!) KO")
    }else{
        print("\n3.  \(player1Chara3.name!)")
    }
    perso = readLine()
    if perso != nil {
        switch perso {
            case "1": // Ajouter une nouvelle activité
                p2 = 4
            case "2": // Consulter la banque
                p2 = 5
            case "3": // Consulter la grangeplayer2 = player1Chara1.name!
                p2 = 6
            default:
                print("Je ne comprends pas")
        }
    }
    
    let coffre = Int.random(in: 1..<10)
    
    if p1 == 1 && p2 == 4{
        if coffre  == 1 {
            print("Un coffre apparait")
            armeRandom(character: player2Chara1)
        }
        combat(character: player2Chara1, character2: player1Chara1)
      
    }
    if p1 == 1 && p2 == 5{
        if coffre  == 1 {
            print("Un coffre apparait")
            armeRandom(character: player2Chara1)
        }
        combat(character: player2Chara1, character2: player1Chara2)
    }
    if p1 == 1 && p2 == 6{
        if coffre  == 1 {
            print("Un coffre apparait")
            armeRandom(character: player2Chara1)
        }
        combat(character: player2Chara1, character2: player1Chara3)
    }
    if p1 == 2 && p2 == 4{
        if coffre  == 1 {
            print("Un coffre apparait")
            armeRandom(character: player2Chara2)
        }
        combat(character: player2Chara2, character2: player1Chara1)
    }
    if p1 == 2 && p2 == 5{
        if coffre  == 1 {
            print("Un coffre apparait")
            armeRandom(character: player2Chara2)
        }
        combat(character: player2Chara2, character2: player1Chara2)
    }
    if p1 == 2 && p2 == 6{
        if coffre  == 1 {
            print("Un coffre apparait")
            armeRandom(character: player2Chara2)
        }
        combat(character: player2Chara2, character2: player1Chara3)
    }
    if p1 == 3 && p2 == 4{
        if coffre  == 1 {
            print("Un coffre apparait")
            armeRandom(character: player2Chara3)
        }
        combat(character: player2Chara3, character2: player1Chara1)
    }
    if p1 == 3 && p2 == 5{
        if coffre  == 1 {
            print("Un coffre apparait")
            armeRandom(character: player2Chara3)
        }
        combat(character: player2Chara3, character2: player1Chara2)
    }
   
    if p1 == 3 && p2 == 6{
        if coffre  == 1 {
            print("Un coffre apparait")
            armeRandom(character: player2Chara3)
        }
        combat(character: player2Chara3, character2: player1Chara3)
    }
    
}
        
    

func game() {
    print("Vous avez le droit de choisir 3 personnage"
            + " vous devez leur donner un nom unique chaqu'un"
            + " et luis choisir une arme")
    
    print("******************"
            + "\nLe Joeur 1 Choisis"
            + "\n******************")
    
    menuPersonage(character: player1Chara1)
    armeChoise(character: player1Chara1)
    menuPersonage(character: player1Chara2)
    while player1Chara1.name == player1Chara2.name {
        ChagerdeNom(character: player1Chara2)
    }
    armeChoise(character: player1Chara2)
    menuPersonage(character: player1Chara3)
    while (player1Chara1.name == player1Chara3.name) || (player1Chara2.name == player1Chara3.name)  {
        ChagerdeNom(character: player1Chara3)
    }
    armeChoise(character: player1Chara3)
    
    print("******************"
        + "\nLe Joeur 2 Choisis"
        + "\n******************")
    
    menuPersonage(character: player2Chara1)
    while (player2Chara1.name == player1Chara1.name) || (player2Chara1.name == player1Chara2.name) || (player2Chara1.name == player1Chara3.name)  {
        ChagerdeNom(character: player2Chara1)
    }
    armeChoise(character: player2Chara1)
    menuPersonage(character: player2Chara2)
    while (player2Chara1.name == player2Chara2.name) || (player2Chara2.name == player1Chara1.name) || (player2Chara2.name == player1Chara2.name) || (player2Chara2.name == player1Chara3.name) {
        ChagerdeNom(character: player2Chara2)
    }
    armeChoise(character: player2Chara2)
    menuPersonage(character: player2Chara3)
    while (player2Chara1.name == player2Chara3.name) || (player2Chara2.name == player2Chara3.name) || (player2Chara3.name == player1Chara1.name) || (player2Chara3.name == player1Chara2.name) || (player2Chara3.name == player1Chara3.name) {
        ChagerdeNom(character: player2Chara3)
    }
    armeChoise(character: player2Chara3)
            
    print   ("******************"
            + "\n La partie peu commencer"
            + "\n******************")
    
    let numberP1 = Int.random(in: 0..<10)
    let numberP2 = Int.random(in: 0..<10)
    
    if numberP1 > numberP2 {
        
        while ((player1Chara1.lifePoint > 0) && (player1Chara2.lifePoint > 0) && (player1Chara3.lifePoint > 0)) || ((player2Chara1.lifePoint > 0) && (player2Chara2.lifePoint > 0) && (player2Chara3.lifePoint > 0)){
            print("Le Joueur 1 commence : ")
            menuAttackJ1()
            print("Le Joueur 2  joue : ")
            menuAttackJ2()
            
        }
        
    }else{
        
        while ((player1Chara1.lifePoint > 0) && (player1Chara2.lifePoint > 0) && (player1Chara3.lifePoint > 0)) || ((player2Chara1.lifePoint > 0) && (player2Chara2.lifePoint > 0) && (player2Chara3.lifePoint > 0)){
            print("Le Joueur 2 commence : ")
            menuAttackJ2()
            print("Le Joueur 1  joue : ")
            menuAttackJ1()
        }
    }
  
    }

game()
    

