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

// Equipe
var team1 = Team()
team1.teamName = "Equipe 1"

var team2 = Team()
team1.teamName = "Equipe 2"


// Armes
var axe = Weapon()
axe.name = "Hache"
axe.attackPoint = 100

var sword = Weapon()
sword.name = "Epée"
sword.attackPoint = 20

var shield = Weapon()
shield.name = "Bouclier"
shield.attackPoint = 10
shield.protectPoint = 30

var hand = Weapon()
hand.name = "Main"
hand.attackPoint = 5

var tour = 0
/* ************************************************************************
                                Fonction
 ************************************************************************** */
func victoire(){
    team1 = Team()
    team1.teamName = "Equipe 1"
    
    team2 = Team()
    team1.teamName = "Equipe 2"
    
    player1Chara1 = Character()
    player1Chara2 = Character()
    player1Chara3 = Character()
    
    player2Chara1 = Character()
    player2Chara2 = Character()
    player2Chara3 = Character()
    
    tour = 0
    
    print(" voulez vous faire une nouvelle partie ?  : yes -- no")
    if let choice = readLine(){
        switch choice {
            case "YES", "yes":
                game()
            case "NO", "no":
                print("Merci d'avoir jouer")
                break
            default:
                print("Merci d'avoir jouer")
                break
        }
    }
}

func teamChoice(character1: Character, character2: Character, character3: Character, team: Team){
        character1.team = team
        character2.team = team
        character3.team = team
    
    team.teamPoint = character1.lifePoint + character2.lifePoint + character3.lifePoint
}

func armeRandom(character: Character){
    let numalea = Int.random(in: 1..<5)
    
    print("\nUn coffre apparait")
    switch numalea {
        case 1:
            character.weapon = axe
            print("\(character.name!) optient la \(character.weapon.name) qui se trouve dans le coffre")
        case 2:
            character.weapon = sword
            print("\(character.name!) optient l' \(character.weapon.name) qui se trouve dans le coffre")
        case 3:
            character.weapon = shield
            print("\(character.name!) optient le \(character.weapon.name) qui se trouve dans le coffre")
        case 4:
            character.weapon = hand
            print("\(character.name!) optient la \(character.weapon.name) qui se trouve dans le coffre")
        default:
            character.weapon = axe
    }
}


func menuPersonage(character: Character) {
    print("\nQuels est le nom de votre personnage : ")
    if let choice = readLine(){
        character.name = choice.capitalized
    
    }
}

func armeChoise(character: Character){
   
    func choice(){
        print("\nQuel arme voulez vous ?"
                + "\n1.  Une ache"
                + "\n2.  Une epée"
                + "\n3.  Un bouclier"
                + "\n4. main nue")
    }
    choice()
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
            case "4" :
                character.weapon = hand
                print("\(character.name!) posede un \(character.weapon.name)")
            default:
                print("Merci de faire un choix entre 1 et 4")
                choice()
        }
        
    }
}

func ChagerdeNom(character: Character) {
    print("\nCe nom existe deja merci d'en choisir un autre : ")
    if let choice = readLine(){
        character.name = choice.capitalized
    }
}


func combat(character : Character, character2: Character){
    character2.lifePoint -= character.weapon.attackPoint
    character2.team.teamPoint -= character.weapon.attackPoint
    if character2.lifePoint <= 0 {
        character2.lifePoint = 0
        character2.isALive = false
    }
    if character2.team.teamPoint <= 0 {
        character2.team.teamPoint = 0
    }
    print("\n\(character.name!) attaque \(character2.name!) "
        + "\n \(character2.name!) perd \(character.weapon.attackPoint) point de vie"
    + "\n il reste \(character2.lifePoint) point de vie à \(character2.name!)")
    if character2.lifePoint <= 0 {
        print("\(character2.name!) est KO!")
        
    }
}


func menuAttack (c1P1:Character, c2P1: Character, c3P1: Character, c1P2:Character, c2P2: Character, c3P2: Character) {
    
    var p1 : Int = 0
    var p2 : Int = 0
    var perso : String?
    
    func choice(){
        print("\nQuel personnage voulez vous choisir ?:")
        if c1P1.isALive == false {
            print("1.  \(c1P1.name!) (KO)")
        }else{
            print("1.  \(c1P1.name!) (\(c1P1.lifePoint) PV) ")
        }
        if c2P1.isALive == false {
            print("2.  \(c2P1.name!) (KO)")
        }else{
            print("2.  \(c2P1.name!) ( \(c2P1.lifePoint) PV) ")
        }
        if c3P1.isALive == false {
            print("3.  \(c3P1.name!) (KO)")
        }else{
            print("3.  \(c3P1.name!) (\(c3P1.lifePoint) PV)")
        }
        perso = readLine()
    }
    
        choice()
    
    if c1P1.isALive == false{
        if perso != nil {
            switch perso {
                case "1": // Ajouter une nouvelle activité
                   print("vous ne pouvez plus utiliser ce personnage pour attaquer")
                    choice()
                case "2": // Consulter la banque
                    p1 = 2
                case "3": // Consulter la grangeplayer2 = player1Chara1.name!
                    p1 = 3
                default:
                    print("Je ne comprends pas")
                    choice()
            }
        }
    }
    if c2P1.isALive == false{
        if perso != nil {
            switch perso {
                case "1": // Ajouter une nouvelle activité
                    p1 = 1
                case "2": // Consulter la banque
                    print("vous ne pouvez plus utiliser ce personnage pour attaquer")
                    choice()
                case "3": // Consulter la grangeplayer2 = player1Chara1.name!
                    p1 = 3
                default:
                    print("Je ne comprends pas")
                    choice()
            }
        }
    }
    if c3P1.isALive == false{
        if perso != nil {
            switch perso {
                case "1": // Ajouter une nouvelle activité
                    p1 = 1
                case "2": // Consulter la banque
                    p1 = 2
                case "3": // Consulter la grangeplayer2 = player1Chara1.name!
                    print("vous ne pouvez plus utiliser ce personnage pour attaquer")
                    choice()
                default:
                    print("Je ne comprends pas")
                    choice()
            }
        }
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
                choice()
        }
    }
    
    func choiceAttack(){
        print("\n Quel personnage voulez vous attaquer ?")
        if c1P2.isALive == false {
            print("1.  \(c1P2.name!) (KO)")
        }else{
            print("1.  \(c1P2.name!)(\(c1P2.lifePoint) PV)")
        }
        if c2P2.isALive == false {
            print("2.  \(c2P2.name!) (KO)")
        }else{
            print("2.  \(c2P2.name!) (\(c2P2.lifePoint) PV)")
        }
        if c3P2.isALive == false {
            print("3.  \(c3P2.name!) (KO)")
        }else{
            print("3.  \(c3P2.name!) ( \(c3P2.lifePoint) PV) ")
        }
        perso = readLine()
    }
    
    choiceAttack()
    
    if c1P2.isALive == false{
        if perso != nil {
            switch perso {
                case "1": // Ajouter une nouvelle activité
                    print("\nvous ne pouvez pas attaquer ce personnage, car celui ci est KO")
                    choiceAttack()
                case "2": // Consulter la banque
                    p2 = 2
                case "3": // Consulter la grangeplayer2 = player1Chara1.name!
                    p2 = 3
                default:
                    print("Je ne comprends pas")
                    choiceAttack()
            }
        }
    }
    if c2P2.isALive == false{
        if perso != nil {
            switch perso {
                case "1": // Ajouter une nouvelle activité
                    p2 = 1
                case "2": // Consulter la banque
                    print("\nvous ne pouvez pas attaquer ce personnage, car celui ci est KO")
                    choiceAttack()
                case "3": // Consulter la grangeplayer2 = player1Chara1.name!
                    p2 = 3
                default:
                    print("Je ne comprends pas")
                    choiceAttack()
            }
        }
    }
    if c3P2.isALive == false{
        if perso != nil {
            switch perso {
                case "1": // Ajouter une nouvelle activité
                    p2 = 1
                case "2": // Consulter la banque
                    p2 = 2
                case "3": // Consulter la grangeplayer2 = player1Chara1.name!
                    print("\nvous ne pouvez pas attaquer ce personnage, car celui ci est KO")
                    choiceAttack()
                default:
                    print("Je ne comprends pas")
                    choiceAttack()
            }
        }
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
                choiceAttack()
        }
    }
   
    
    
    let coffre = Int.random(in: 1..<10)
    
    
    if p1 == 1 && p2 == 4{
        if coffre  == 1 {
            
            armeRandom(character: c1P1)
        }
        combat(character: c1P1, character2: c1P2)
        
    }
    if p1 == 1 && p2 == 5{
        
        if coffre  == 1 {
            
            armeRandom(character: c1P1)
        }
        combat(character: c1P1, character2: c2P2)
    }
    
    if p1 == 1 && p2 == 6{
        
        if coffre  == 1 {
         
            armeRandom(character: c1P1)
        }
        combat(character: c1P1, character2: c3P2)
    }
    
    if p1 == 2 && p2 == 4{
        
        if coffre  == 1 {
          
            armeRandom(character: c2P1)
        }
        combat(character: c2P1, character2: c1P2)
    }
    
    if p1 == 2 && p2 == 5{
        
        if coffre  == 1 {
          
            armeRandom(character: c2P1)
        }
        combat(character: c2P1, character2: c2P2)
    }
    if p1 == 2 && p2 == 6{
        
        if coffre  == 1 {
         
            armeRandom(character: c2P1)
        }
        combat(character: c2P1, character2: c3P2)
    }
    if p1 == 3 && p2 == 4{
        
        if coffre  == 1 {
         
            armeRandom(character: c3P1)
        }
        combat(character: c3P1, character2: c1P2)
    }
    
    if p1 == 3 && p2 == 5{
        
        if coffre  == 1 {
           
            armeRandom(character: c3P1)
        }
        combat(character: c3P1, character2: c2P2)
    }
    
    if p1 == 3 && p2 == 6{
        
        if coffre  == 1 {
            
            armeRandom(character: c3P1)
        }
        combat(character: c3P1, character2: c3P2)
    }
    
}


func game() {
    print("Vous avez le droit de choisir 3 personnage"
            + " vous devez leur donner un nom unique chaqu'un"
            + " et luis choisir une arme")
    
    print("\n******************"
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
    teamChoice(character1: player1Chara1, character2: player1Chara2, character3: player1Chara3, team: team1)
    
    print("\n******************"
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
    teamChoice(character1: player2Chara1, character2: player2Chara2, character3: player2Chara3, team: team2)
    
    print   ("\n******************"
            + "\n La partie peu commencer"
            + "\n******************"
            + "\n")
    
    let numberP1 = Int.random(in: 0..<10)
    let numberP2 = Int.random(in: 0..<10)
    
    if numberP1 > numberP2 {
        
        while team1.teamPoint != 0 || team2.teamPoint != 0 {
            if team1.teamPoint == 0 {
                print("L'equipe 2 a Gagné")
                print("Team 2 : \(team2.teamPoint) point et  Team 1 : \(team1.teamPoint)  point en \(tour) tours ")
                victoire()
            }else{
            print("\nLe Joueur 1 commence : ")
            menuAttack(c1P1: player1Chara1, c2P1: player1Chara2, c3P1: player1Chara3, c1P2: player2Chara1, c2P2: player2Chara2, c3P2: player2Chara3)
                tour += 1
            }
            print("Team 1 : \(team1.teamPoint) Team 2 : \(team2.teamPoint) ")
            
            if team2.teamPoint == 0 {
                print("L'equipe 1 a Gagné")
                print("Team 1 : \(team1.teamPoint) point et Team 2 : \(team2.teamPoint) point en \(tour) tours")
                victoire()
            }else{
                print("\nLe Joueur 2  joue : ")
                menuAttack(c1P1: player2Chara1, c2P1: player2Chara2, c3P1: player2Chara3, c1P2: player1Chara1, c2P2: player1Chara2, c3P2: player1Chara3)
                tour += 1
            }
            
            print("\nTeam 1 : \(team1.teamPoint) Team 2 : \(team2.teamPoint) ")
            
        }
        
    }else{
        
        while team1.teamPoint != 0 || team2.teamPoint != 0 {
            if team2.teamPoint == 0 {
                print("\nL'equipe 1 a Gagné")
                print("Team 1 : \(team1.teamPoint) point et Team 2 : \(team2.teamPoint) point en \(tour) tours")
                victoire()
            }else{
                print("\nLe Joueur 2  joue : ")
                menuAttack(c1P1: player2Chara1, c2P1: player2Chara2, c3P1: player2Chara3, c1P2: player1Chara1, c2P2: player1Chara2, c3P2: player1Chara3)
                tour += 1
            }
            
            
            
            if team1.teamPoint == 0 {
                print("\nL'equipe 2 a Gagné")
                print("Team 2 : \(team2.teamPoint) point et  Team 1 : \(team1.teamPoint)  point en \(tour) tours")
                victoire()
            }else{
                print("\nLe Joueur 1 commence : ")
                menuAttack(c1P1: player1Chara1, c2P1: player1Chara2, c3P1: player1Chara3, c1P2: player2Chara1, c2P2: player2Chara2, c3P2: player2Chara3)
                tour += 1
            }
            
        }
    }
}
 

game()
    

