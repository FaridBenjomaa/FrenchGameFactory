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
axe.nameEn = "Axe"
axe.attackPoint = 100

var sword = Weapon()
sword.name = "Epée"
sword.nameEn = "Sword"
sword.attackPoint = 20

var shield = Weapon()
shield.name = "Bouclier"
shield.nameEn = "Shield"
shield.attackPoint = 10
shield.protectPoint = 30

var hand = Weapon()
hand.name = "Main"
hand.nameEn = "Hand"
hand.attackPoint = 5

var tour = 0 //pour compter le nombre de tour
var i = 1
var langue : String? // pour le choix de la langue
var gameIsOn = true

/* ************************************************************************
                                Fonction
 ************************************************************************** */

// Text du choix de langue
func choiceLanguage(){
    print("\nQuel langue voulez vous utiliser pour jouer ?")
    print("What language do you want to use to play?")
    print("1.  Francais - French ")
    print("2.  English -- Anglais")
    langue = readLine()
}

//Fonction qui permet de rejouer une partie ou d'arreter
func victoireFr(){
    i = 1
    
    print(" voulez vous faire une nouvelle partie ?  : yes -- no")
    if let choice = readLine(){
        switch choice.capitalized {
            case "Yes":
                //remise a zero des point et des equipes
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
               
                gamefr()
            case "No":
                gameIsOn = false
                gameOver()
            default:
                gameIsOn = false
                gameOver()
              
        }
    }
 
}

func victoireEn(){
    i = 1
    
    print(" Do you want start a new game ?  Yes no ")
    if let choice = readLine(){
        switch choice.capitalized {
            case "Yes":
                //remise a zero des point et des equipes
                team1 = Team()
                team1.teamName = "Team 1"
                
                team2 = Team()
                team1.teamName = "Team 2"
                
                player1Chara1 = Character()
                player1Chara2 = Character()
                player1Chara3 = Character()
                
                player2Chara1 = Character()
                player2Chara2 = Character()
                player2Chara3 = Character()
                
                tour = 0
                
                gamefr()
            case "No":
                gameIsOn = false
                gameOverEn()
            default:
                gameIsOn = false
                gameOverEn()
                
        }
    }
    
}

//attribution des equipes
func teamChoice(character1: Character, character2: Character, character3: Character, team: Team){
        character1.team = team
        character2.team = team
        character3.team = team
    
    team.teamPoint = character1.lifePoint + character2.lifePoint + character3.lifePoint
}

//choix des armes aléatoires
func armeRandomFr(character: Character){
    let numalea = Int.random(in: 1..<5)
    
    print("\nUn coffre apparait")
    switch numalea {
        case 1:
            character.weapon = axe
            print("\(character.name!) obtient la \(character.weapon.name) qui se trouve dans le coffre")
        case 2:
            character.weapon = sword
            print("\(character.name!) obtient l' \(character.weapon.name) qui se trouve dans le coffre")
        case 3:
            character.weapon = shield
            print("\(character.name!) obtient le \(character.weapon.name) qui se trouve dans le coffre")
        case 4:
            character.weapon = hand
            print("\(character.name!) obtient la \(character.weapon.name) qui se trouve dans le coffre")
        default:
            character.weapon = axe
    }
}

func armeRandomEn(character: Character){
    let numalea = Int.random(in: 1..<5)
    
    print("\nA chest appears")
    switch numalea {
        case 1:
            character.weapon = axe
            print("\(character.name!) gets the \(character.weapon.nameEn) in the chest")
        case 2:
            character.weapon = sword
            print("\(character.name!) gets the \(character.weapon.nameEn) in the chest")
        case 3:
            character.weapon = shield
            print("\(character.name!) gets the \(character.weapon.nameEn) in the chest")
        case 4:
            character.weapon = hand
            print("\(character.name!) gets the \(character.weapon.nameEn) in the chest")
        default:
            character.weapon = axe
    }
}
//Phrase du choix des noms des personnages
func menuPersonageFr(character: Character) {
    
    // permet de changer de 1 er 2eme et 3eme en fonction de l'ordre
    var numero = ""
    if i == 1
    {
        numero = String(i) + " er"
    }else{
        numero = String(i) + " eme"
    }
    
    print("\nQuels est le nom de votre \(numero) personnage : ")
    if let choice = readLine(){
        character.name = choice.capitalized
    
    }
    i += 1
}

func menuPersonageEn(character: Character) {
    
    // permet de changer de 1 er 2eme et 3eme en fonction de l'ordre
    var numero = ""
    if i == 1
    {
        numero = String(i) + "st"
    }else if i == 2{
        numero = String(i) + "nd"
    }else{
        numero = String(i) + "rd"
    }
    
    print("\nWhat is the name of your  \(numero) character : ")
    if let choice = readLine(){
        character.name = choice.capitalized
        
    }
    i += 1
}

//choix des armes des personnages
func armeChoiseFr(character: Character){
   
    var arme : String?
    
    func choice(){
        print("\nQuel arme voulez vous ?"
                + "\n1.  Une ache"
                + "\n2.  Une epée"
                + "\n3.  Un bouclier"
                + "\n4. main nue")
        arme = readLine()
    }
    choice()
    if  arme != nil {
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

func armeChoiseEn(character: Character){
    
    var arme : String?
    
    func choice(){
        print("\nWitch weapon do you want ?"
                + "\n1.  Axe"
                + "\n2.  Sword"
                + "\n3.  Shield"
                + "\n4.  Hand")
        arme = readLine()
    }
    choice()
    if  arme != nil {
        switch arme {
            case "1": // Ajouter une nouvelle activité
                character.weapon = axe
                print("\(character.name!) has a  \(character.weapon.name)")
            case "2": // Consulter la banque
                character.weapon = sword
                print("\(character.name!) has a  \(character.weapon.name)")
            case "3": // Consulter la grange
                character.weapon = shield
                print("\(character.name!) has a \(character.weapon.name)")
            case "4" :
                character.weapon = hand
                print("\(character.name!) has a  \(character.weapon.name)")
            default:
                print("Please make a choice between 1 and 4")
                choice()
        }
        
    }
}
//Changer de nom si le nom existe deja
func ChagerdeNomFr(character: Character) {
    print("\nCe nom existe deja merci d'en choisir un autre : ")
    if let choice = readLine(){
        character.name = choice.capitalized
    }
}

func ChagerdeNomEn(character: Character) {
    print("\nThis name already exists please choose another one : ")
    if let choice = readLine(){
        character.name = choice.capitalized
    }
}

//Combat decompte des point : le joueur perd des points de vie en fonction de l'arme
func combatFr(character : Character, character2: Character){
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

func combatEn(character : Character, character2: Character){
    character2.lifePoint -= character.weapon.attackPoint
    character2.team.teamPoint -= character.weapon.attackPoint
    if character2.lifePoint <= 0 {
        character2.lifePoint = 0
        character2.isALive = false
    }
    if character2.team.teamPoint <= 0 {
        character2.team.teamPoint = 0
    }
    print("\n\(character.name!) attack \(character2.name!) "
            + "\n \(character2.name!) lose \(character.weapon.attackPoint) healt point"
            + "\n there are \(character2.lifePoint) life point left to  \(character2.name!)")
    if character2.lifePoint <= 0 {
        print("\(character2.name!) is KO!")
        
    }
}
// choix de qui attaque qui
func menuAttackFr(c1P1:Character, c2P1: Character, c3P1: Character, c1P2:Character, c2P2: Character, c3P2: Character) {
    
    var p1 : Int = 0
    var p2 : Int = 0
    var perso : String?
    
    // choix du personnage qui attaque
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
    
    // si le personnage est KO il ne peut pas attaquer
    if c1P1.isALive == false{
        if perso != nil {
            switch perso {
                case "1":
                   print("vous ne pouvez plus utiliser ce personnage pour attaquer")
                    choice()
                case "2":
                    p1 = 2
                case "3":
                    p1 = 3
                default:
                    //si le choix n'est pas corresct le choix est reposé
                    print("Je ne comprends pas")
                    choice()
            }
        }
    }
    if c2P1.isALive == false{
        if perso != nil {
            switch perso {
                case "1":
                    p1 = 1
                case "2":
                    print("vous ne pouvez plus utiliser ce personnage pour attaquer")
                    choice()
                case "3":
                    p1 = 3
                default:
                    //si le choix n'est pas corresct le choix est reposé
                    print("Je ne comprends pas")
                    choice()
            }
        }
    }
    if c3P1.isALive == false{
        if perso != nil {
            switch perso {
                case "1":
                    p1 = 1
                case "2":
                    p1 = 2
                case "3":
                    print("vous ne pouvez plus utiliser ce personnage pour attaquer")
                    choice()
                default:
                    print("Je ne comprends pas")
                    choice()
            }
        }
    }
    
    //choix si aucun joueur n'est KO
    if perso != nil {
        switch perso {
            case "1":
                p1 = 1
            case "2":
                p1 = 2
            case "3":
                p1 = 3
            default:
                print("Je ne comprends pas")
                choice()
        }
    }
    
    // choix du personnage qui sera attaquer
    func choiceAttack(){
        print("\n Quel personnage voulez vous attaquer ?")
        if c1P2.isALive == false {
            print("1.  \(c1P2.name!) (KO)")//affiche KO lors celui-ci n'a plus de point de vie
        }else{
            print("1.  \(c1P2.name!)(\(c1P2.lifePoint) PV)")
        }
        if c2P2.isALive == false {
            print("2.  \(c2P2.name!) (KO)")//affiche KO lors celui-ci n'a plus de point de vie
        }else{
            print("2.  \(c2P2.name!) (\(c2P2.lifePoint) PV)")
        }
        if c3P2.isALive == false {
            print("3.  \(c3P2.name!) (KO)")//affiche KO lors celui-ci n'a plus de point de vie
        }else{
            print("3.  \(c3P2.name!) ( \(c3P2.lifePoint) PV) ")
        }
        perso = readLine()
    }
    
    choiceAttack()
    
    if c1P2.isALive == false{
        // verrification que perso est different de nil
        if perso != nil {
            switch perso {
                case "1":
                    // si le joueur choisi d'attaquer un personnage qui est deja KO, le choix sera representer
                    print("\nvous ne pouvez pas attaquer ce personnage, car celui ci est KO")
                    choiceAttack()
                case "2":
                    p2 = 2
                case "3":
                    p2 = 3
                default:
                    // si le personnage ne choisi pas une option valide, le choix sera representer
                    print("Je ne comprends pas")
                    choiceAttack()
            }
        }
    }
    if c2P2.isALive == false{
        // verrification que perso est different de nil
        if perso != nil {
            switch perso {
                case "1":
                    p2 = 1
                case "2":
                    // si le joueur choisi d'attaquer un personnage qui est deja KO, le choix sera representer
                    print("\nvous ne pouvez pas attaquer ce personnage, car celui ci est KO")
                    choiceAttack()
                case "3":
                    p2 = 3
                default:
                    // si le personnage ne choisi pas une option valide, le choix sera representer
                    print("Je ne comprends pas")
                    choiceAttack()
            }
        }
    }
    if c3P2.isALive == false{
        // verrification que perso est different de nil
        if perso != nil {
            switch perso {
                case "1":
                    p2 = 1
                case "2":
                    p2 = 2
                case "3":
                    // si le joueur choisi d'attaquer un personnage qui est deja KO, le choix sera representer
                    print("\nvous ne pouvez pas attaquer ce personnage, car celui ci est KO")
                    choiceAttack()
                default:
                    // si le personnage ne choisi pas une option valide, le choix sera representer
                    print("Je ne comprends pas")
                    choiceAttack()
            }
        }
    }
  
    
   // verrification que perso est different de nil
    if perso != nil {
        switch perso {
            case "1":
                p2 = 4
            case "2":
                p2 = 5
            case "3":
                p2 = 6
            default:
                print("Je ne comprends pas")
                choiceAttack()
        }
    }
   
    
    // jette les dé enter 1 est 10
    let coffre = Int.random(in: 1..<10)
    
    //si le joueur 1 choisi son 1er personnage et choisis d'attaquer le 1er personnage du joueur 2
    if p1 == 1 && p2 == 4{
        //si les dé sont egale a 1 le coffre apparait
        if coffre  == 1 {
            
            armeRandomFr(character: c1P1)
        }
        combatFr(character: c1P1, character2: c1P2)
        
    }
    //si le joueur 1 choisi son 1er personnage et choisis d'attaquer le 2eme personnage du joueur 2
    if p1 == 1 && p2 == 5{
        
        if coffre  == 1 {
            
            armeRandomFr(character: c1P1)
        }
        combatFr(character: c1P1, character2: c2P2)
    }
    //si le joueur 1 choisi son 1er personnage et choisis d'attaquer le 3eme personnage du joueur 2
    if p1 == 1 && p2 == 6{
        
        if coffre  == 1 {
         
            armeRandomFr(character: c1P1)
        }
        combatFr(character: c1P1, character2: c3P2)
    }
    //si le joueur 1 choisi son 2eme personnage et choisis d'attaquer le 1er personnage du joueur 2
    if p1 == 2 && p2 == 4{
        
        if coffre  == 1 {
          
            armeRandomFr(character: c2P1)
        }
        combatFr(character: c2P1, character2: c1P2)
    }
    //si le joueur 1 choisi son 2eme personnage et choisis d'attaquer le 2eme personnage du joueur 2
    if p1 == 2 && p2 == 5{
        
        if coffre  == 1 {
          
            armeRandomFr(character: c2P1)
        }
        combatFr(character: c2P1, character2: c2P2)
    }
    //si le joueur 1 choisi son 2eme personnage et choisis d'attaquer le 3eme personnage du joueur 2
    if p1 == 2 && p2 == 6{
        
        if coffre  == 1 {
         
            armeRandomFr(character: c2P1)
        }
        combatFr(character: c2P1, character2: c3P2)
    }
    //si le joueur 1 choisi son 3eme personnage et choisis d'attaquer le 1er personnage du joueur 2
    if p1 == 3 && p2 == 4{
        
        if coffre  == 1 {
         
            armeRandomFr(character: c3P1)
        }
        combatFr(character: c3P1, character2: c1P2)
    }
    //si le joueur 1 choisi son 3eme personnage et choisis d'attaquer le 2eme personnage du joueur 2
    if p1 == 3 && p2 == 5{
        
        if coffre  == 1 {
           
            armeRandomFr(character: c3P1)
        }
        combatFr(character: c3P1, character2: c2P2)
    }
    
    //si le joueur 1 choisi son 3eme personnage et choisis d'attaquer le 3eme personnage du joueur 2
    if p1 == 3 && p2 == 6{
        
        if coffre  == 1 {
            
            armeRandomFr(character: c3P1)
        }
        combatFr(character: c3P1, character2: c3P2)
    }
    
}

func menuAttackEn(c1P1:Character, c2P1: Character, c3P1: Character, c1P2:Character, c2P2: Character, c3P2: Character) {
    
    var p1 : Int = 0
    var p2 : Int = 0
    var perso : String?
    
    // choix du personnage qui attaque
    func choice(){
        print("\nWitch Charactere do you want ?  :")
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
    
    // si le personnage est KO il ne peut pas attaquer
    if c1P1.isALive == false{
        if perso != nil {
            switch perso {
                case "1":
                    print("you can no longer use this character to attack")
                    choice()
                case "2":
                    p1 = 2
                case "3":
                    p1 = 3
                default:
                    //si le choix n'est pas corresct le choix est reposé
                    print("I don't understand")
                    choice()
            }
        }
    }
    if c2P1.isALive == false{
        if perso != nil {
            switch perso {
                case "1":
                    p1 = 1
                case "2":
                    print("you can no longer use this character to attack")
                    choice()
                case "3":
                    p1 = 3
                default:
                    //si le choix n'est pas corresct le choix est reposé
                    print("I don't understand")
                    choice()
            }
        }
    }
    if c3P1.isALive == false{
        if perso != nil {
            switch perso {
                case "1":
                    p1 = 1
                case "2":
                    p1 = 2
                case "3":
                    print("you can no longer use this character to attack")
                    choice()
                default:
                    print("I don't understand")
                    choice()
            }
        }
    }
    
    //choix si aucun joueur n'est KO
    if perso != nil {
        switch perso {
            case "1":
                p1 = 1
            case "2":
                p1 = 2
            case "3":
                p1 = 3
            default:
                print("I don't understand")
                choice()
        }
    }
    
    // choix du personnage qui sera attaquer
    func choiceAttack(){
        print("\n Choose the character you want to attack?")
        if c1P2.isALive == false {
            print("1.  \(c1P2.name!) (KO)")//affiche KO lors celui-ci n'a plus de point de vie
        }else{
            print("1.  \(c1P2.name!)(\(c1P2.lifePoint) PV)")
        }
        if c2P2.isALive == false {
            print("2.  \(c2P2.name!) (KO)")//affiche KO lors celui-ci n'a plus de point de vie
        }else{
            print("2.  \(c2P2.name!) (\(c2P2.lifePoint) PV)")
        }
        if c3P2.isALive == false {
            print("3.  \(c3P2.name!) (KO)")//affiche KO lors celui-ci n'a plus de point de vie
        }else{
            print("3.  \(c3P2.name!) ( \(c3P2.lifePoint) PV) ")
        }
        perso = readLine()
    }
    
    choiceAttack()
    
    if c1P2.isALive == false{
        // verrification que perso est different de nil
        if perso != nil {
            switch perso {
                case "1":
                    // si le joueur choisi d'attaquer un personnage qui est deja KO, le choix sera representer
                    print("\nYou can’t attack this character, because he is KO")
                    choiceAttack()
                case "2":
                    p2 = 2
                case "3":
                    p2 = 3
                default:
                    // si le personnage ne choisi pas une option valide, le choix sera representer
                    print("I don't understand")
                    choiceAttack()
            }
        }
    }
    if c2P2.isALive == false{
        // verrification que perso est different de nil
        if perso != nil {
            switch perso {
                case "1":
                    p2 = 1
                case "2":
                    // si le joueur choisi d'attaquer un personnage qui est deja KO, le choix sera representer
                    print("\nYou can’t attack this character, because he is KO")
                    choiceAttack()
                case "3":
                    p2 = 3
                default:
                    // si le personnage ne choisi pas une option valide, le choix sera representer
                    print("I don't understand")
                    choiceAttack()
            }
        }
    }
    if c3P2.isALive == false{
        // verrification que perso est different de nil
        if perso != nil {
            switch perso {
                case "1":
                    p2 = 1
                case "2":
                    p2 = 2
                case "3":
                    // si le joueur choisi d'attaquer un personnage qui est deja KO, le choix sera representer
                    print("\nYou can’t attack this character, because he is KO")
                    choiceAttack()
                default:
                    // si le personnage ne choisi pas une option valide, le choix sera representer
                    print("I don't understand")
                    choiceAttack()
            }
        }
    }
    
    
    // verrification que perso est different de nil
    if perso != nil {
        switch perso {
            case "1":
                p2 = 4
            case "2":
                p2 = 5
            case "3":
                p2 = 6
            default:
                print("I don't understand")
                choiceAttack()
        }
    }
    
    
    // jette les dé enter 1 est 10
    let coffre = Int.random(in: 1..<10)
    
    //si le joueur 1 choisi son 1er personnage et choisis d'attaquer le 1er personnage du joueur 2
    if p1 == 1 && p2 == 4{
        //si les dé sont egale a 1 le coffre apparait
        if coffre  == 1 {
            
            armeRandomFr(character: c1P1)
        }
        combatEn(character: c1P1, character2: c1P2)
        
    }
    //si le joueur 1 choisi son 1er personnage et choisis d'attaquer le 2eme personnage du joueur 2
    if p1 == 1 && p2 == 5{
        
        if coffre  == 1 {
            
            armeRandomFr(character: c1P1)
        }
        combatEn(character: c1P1, character2: c2P2)
    }
    //si le joueur 1 choisi son 1er personnage et choisis d'attaquer le 3eme personnage du joueur 2
    if p1 == 1 && p2 == 6{
        
        if coffre  == 1 {
            
            armeRandomFr(character: c1P1)
        }
        combatEn(character: c1P1, character2: c3P2)
    }
    //si le joueur 1 choisi son 2eme personnage et choisis d'attaquer le 1er personnage du joueur 2
    if p1 == 2 && p2 == 4{
        
        if coffre  == 1 {
            
            armeRandomFr(character: c2P1)
        }
        combatEn(character: c2P1, character2: c1P2)
    }
    //si le joueur 1 choisi son 2eme personnage et choisis d'attaquer le 2eme personnage du joueur 2
    if p1 == 2 && p2 == 5{
        
        if coffre  == 1 {
            
            armeRandomFr(character: c2P1)
        }
        combatEn(character: c2P1, character2: c2P2)
    }
    //si le joueur 1 choisi son 2eme personnage et choisis d'attaquer le 3eme personnage du joueur 2
    if p1 == 2 && p2 == 6{
        
        if coffre  == 1 {
            
            armeRandomFr(character: c2P1)
        }
        combatEn(character: c2P1, character2: c3P2)
    }
    //si le joueur 1 choisi son 3eme personnage et choisis d'attaquer le 1er personnage du joueur 2
    if p1 == 3 && p2 == 4{
        
        if coffre  == 1 {
            
            armeRandomFr(character: c3P1)
        }
        combatEn(character: c3P1, character2: c1P2)
    }
    //si le joueur 1 choisi son 3eme personnage et choisis d'attaquer le 2eme personnage du joueur 2
    if p1 == 3 && p2 == 5{
        
        if coffre  == 1 {
            
            armeRandomFr(character: c3P1)
        }
        combatEn(character: c3P1, character2: c2P2)
    }
    
    //si le joueur 1 choisi son 3eme personnage et choisis d'attaquer le 3eme personnage du joueur 2
    if p1 == 3 && p2 == 6{
        
        if coffre  == 1 {
            
            armeRandomFr(character: c3P1)
        }
        combatEn(character: c3P1, character2: c3P2)
    }
    
}

func gamefr() {
    print("\n******************* Regle du Jeu ******************"
        +   "\nVous devez choisir 3 personnages et leur donner un nom"
            + "\nchaque nom doit etre unique, pour chaque personnage"
            + "\nvous devez lui attribuer une arme ")
    
    print("\n******************"
            + "Le Joeur 1 Choisis "
            + "******************")
    
    menuPersonageFr(character: player1Chara1)
    armeChoiseFr(character: player1Chara1)
    menuPersonageFr(character: player1Chara2)
    while player1Chara1.name == player1Chara2.name {
        ChagerdeNomFr(character: player1Chara2)
    }
    armeChoiseFr(character: player1Chara2)
    menuPersonageFr(character: player1Chara3)
    while (player1Chara1.name == player1Chara3.name) || (player1Chara2.name == player1Chara3.name)  {
        ChagerdeNomFr(character: player1Chara3)
    }
    armeChoiseFr(character: player1Chara3)
    teamChoice(character1: player1Chara1, character2: player1Chara2, character3: player1Chara3, team: team1)
    
    print("\n******************"
        + "Le Joeur 2 Choisis "
        + "******************")
    
    i = 1 //reinitialisation de i pour afficher le nombre dans le choix des personnages
    menuPersonageFr(character: player2Chara1)
    while (player2Chara1.name == player1Chara1.name) || (player2Chara1.name == player1Chara2.name) || (player2Chara1.name == player1Chara3.name)  {
        ChagerdeNomFr(character: player2Chara1)
    }
    armeChoiseFr(character: player2Chara1)
    menuPersonageFr(character: player2Chara2)
    while (player2Chara1.name == player2Chara2.name) || (player2Chara2.name == player1Chara1.name) || (player2Chara2.name == player1Chara2.name) || (player2Chara2.name == player1Chara3.name) {
        ChagerdeNomFr(character: player2Chara2)
    }
    armeChoiseFr(character: player2Chara2)
    menuPersonageFr(character: player2Chara3)
    while (player2Chara1.name == player2Chara3.name) || (player2Chara2.name == player2Chara3.name) || (player2Chara3.name == player1Chara1.name) || (player2Chara3.name == player1Chara2.name) || (player2Chara3.name == player1Chara3.name) {
        ChagerdeNomFr(character: player2Chara3)
    }
    armeChoiseFr(character: player2Chara3)
    teamChoice(character1: player2Chara1, character2: player2Chara2, character3: player2Chara3, team: team2)
    
    print   ("\n******************"
            + " La partie peu commencer "
            + "******************"
            + "\n")
    
    // lancement des dés pour Joueur 1 et Joueur 2
    let numberP1 = Int.random(in: 0..<10)
    let numberP2 = Int.random(in: 0..<10)
    
    //si le nombre du Joeur 1 est plus grand Le joeur 1 commence
    if numberP1 > numberP2 {
        
        while team1.teamPoint != 0 || team2.teamPoint != 0 {
            if team1.teamPoint == 0 {
                print("\nL'equipe 2 a Gagné")
                print("Team 2 : \(team2.teamPoint) point et  Team 1 : \(team1.teamPoint)  point en \(tour) tours ")
                victoireFr()
                break
            }else{
            print("\nLe Joueur 1 commence : ")
            menuAttackFr(c1P1: player1Chara1, c2P1: player1Chara2, c3P1: player1Chara3, c1P2: player2Chara1, c2P2: player2Chara2, c3P2: player2Chara3)
                //compte du nombre de tour
                tour += 1
            }
            print("Team 1 : \(team1.teamPoint) Team 2 : \(team2.teamPoint) ")
            
            if team2.teamPoint == 0 {
                print("\nL'equipe 1 a Gagné")
                print("Team 1 : \(team1.teamPoint) point et Team 2 : \(team2.teamPoint) point en \(tour) tours")
                victoireFr()
                break
            }else{
                print("\nLe Joueur 2  joue : ")
                menuAttackFr(c1P1: player2Chara1, c2P1: player2Chara2, c3P1: player2Chara3, c1P2: player1Chara1, c2P2: player1Chara2, c3P2: player1Chara3)
                //compte du nombre de tour
                tour += 1
            }
            
        }
        //sinon le joueur 2 commence
    }else{
        
        while team1.teamPoint != 0 || team2.teamPoint != 0 {
            if team2.teamPoint == 0 {
                print("\nL'equipe 1 a Gagné")
                print("Team 1 : \(team1.teamPoint) point et Team 2 : \(team2.teamPoint) point en \(tour) tours")
                victoireFr()
                break
            }else{
                print("\nLe Joueur 2  joue : ")
                menuAttackFr(c1P1: player2Chara1, c2P1: player2Chara2, c3P1: player2Chara3, c1P2: player1Chara1, c2P2: player1Chara2, c3P2: player1Chara3)
                //compte du nombre de tour
                tour += 1
            }
            
            
            
            if team1.teamPoint == 0 {
                print("\nL'equipe 2 a Gagné")
                print("Team 2 : \(team2.teamPoint) point et  Team 1 : \(team1.teamPoint)  point en \(tour) tours")
                victoireFr()
                break
            }else{
                print("\nLe Joueur 1 commence : ")
                menuAttackFr(c1P1: player1Chara1, c2P1: player1Chara2, c3P1: player1Chara3, c1P2: player2Chara1, c2P2: player2Chara2, c3P2: player2Chara3)
                //compte du nombre de tour
                tour += 1
            }
            
        }
    }
   
}
 
//Le jeu en anglais
func gameEn() {
    print("\n******************* Regle du Jeu ******************"
            +   "\nYou must choose 3 characters and give them a name"
            + "\n each name must be unique, for each character"
            + "\nyou must assign him a weapon")
    
    print("\n******************"
            + "\nPlayer 1 choose"
            + "\n******************")
    
    menuPersonageEn(character: player1Chara1)
    armeChoiseEn(character: player1Chara1)
    menuPersonageEn(character: player1Chara2)
    while player1Chara1.name == player1Chara2.name {
        ChagerdeNomEn(character: player1Chara2)
    }
    armeChoiseEn(character: player1Chara2)
    menuPersonageEn(character: player1Chara3)
    while (player1Chara1.name == player1Chara3.name) || (player1Chara2.name == player1Chara3.name)  {
        ChagerdeNomEn(character: player1Chara3)
    }
    armeChoiseEn(character: player1Chara3)
    teamChoice(character1: player1Chara1, character2: player1Chara2, character3: player1Chara3, team: team1)
    
    print("\n******************"
            + "\nPlayer 2 choose"
            + "\n******************")
    i = 1
    menuPersonageEn(character: player2Chara1)
    while (player2Chara1.name == player1Chara1.name) || (player2Chara1.name == player1Chara2.name) || (player2Chara1.name == player1Chara3.name)  {
        ChagerdeNomEn(character: player2Chara1)
    }
    armeChoiseEn(character: player2Chara1)
    menuPersonageEn(character: player2Chara2)
    while (player2Chara1.name == player2Chara2.name) || (player2Chara2.name == player1Chara1.name) || (player2Chara2.name == player1Chara2.name) || (player2Chara2.name == player1Chara3.name) {
        ChagerdeNomEn(character: player2Chara2)
    }
    armeChoiseEn(character: player2Chara2)
    menuPersonageEn(character: player2Chara3)
    while (player2Chara1.name == player2Chara3.name) || (player2Chara2.name == player2Chara3.name) || (player2Chara3.name == player1Chara1.name) || (player2Chara3.name == player1Chara2.name) || (player2Chara3.name == player1Chara3.name) {
        ChagerdeNomEn(character: player2Chara3)
    }
    armeChoiseEn(character: player2Chara3)
    teamChoice(character1: player2Chara1, character2: player2Chara2, character3: player2Chara3, team: team2)
    
    print   ("\n******************"
                + "\n Game Start"
                + "\n******************"
                + "\n")
    
    let numberP1 = Int.random(in: 0..<10)
    let numberP2 = Int.random(in: 0..<10)
    
    if numberP1 > numberP2 {
        
        while team1.teamPoint != 0 || team2.teamPoint != 0 {
            if team1.teamPoint == 0 {
                print("Team 2 win")
                print("Team 2 : \(team2.teamPoint) point and Team 1 : \(team1.teamPoint)  point in \(tour) rounds")
                victoireEn()
                break
            }else{
                print("\nPlayer 1 play : ")
                menuAttackEn(c1P1: player1Chara1, c2P1: player1Chara2, c3P1: player1Chara3, c1P2: player2Chara1, c2P2: player2Chara2, c3P2: player2Chara3)
                tour += 1
            }
            print("Team 1 : \(team1.teamPoint) Team 2 : \(team2.teamPoint) ")
            
            if team2.teamPoint == 0 {
                print("Team 1 win")
                print("Team 1 : \(team1.teamPoint) point and Team 2 : \(team2.teamPoint) point in  \(tour) rounds")
                victoireEn()
                break
            }else{
                print("\nPlayer 2  play : ")
                menuAttackEn(c1P1: player2Chara1, c2P1: player2Chara2, c3P1: player2Chara3, c1P2: player1Chara1, c2P2: player1Chara2, c3P2: player1Chara3)
                tour += 1
            }
            
            
            
        }
        
    }else{
        
        while team1.teamPoint != 0 || team2.teamPoint != 0 {
            if team2.teamPoint == 0 {
                print("\nTeam 1 win")
                print("Team 1 : \(team1.teamPoint) point and Team 2 : \(team2.teamPoint) point in \(tour) rounds")
                victoireEn()
                break
            }else{
                print("\nLe Joueur 2  joue : ")
                menuAttackEn(c1P1: player2Chara1, c2P1: player2Chara2, c3P1: player2Chara3, c1P2: player1Chara1, c2P2: player1Chara2, c3P2: player1Chara3)
                tour += 1
            }
            
            
            
            if team1.teamPoint == 0 {
                print("\nTeam 2 win")
                print("Team 2 : \(team2.teamPoint) point and  Team 1 : \(team1.teamPoint)  point in \(tour) rounds")
                victoireEn()
                break
            }else{
                print("\nPlayer 1 start: ")
                menuAttackEn(c1P1: player1Chara1, c2P1: player1Chara2, c3P1: player1Chara3, c1P2: player2Chara1, c2P2: player2Chara2, c3P2: player2Chara3)
                tour += 1
            }
            
        }
    }
}



//Menu qui permert de choisir la langue
func game(){
    if gameIsOn == true{
        choiceLanguage()
        
        while gameIsOn == true {
            if langue == "1" {
                gamefr()
            }else if langue == "2"{
                gameEn()
            }else{
                print("Merci de selctionner parmis les 2 propositions")
                print("Please select between the 2 proposals")
                choiceLanguage()
            }
        }
        
        
    }
    

}


func gameOver(){
   
    print(gameIsOn)
    print("Merci d'avoir jouer")

}
func gameOverEn(){
   
    print(gameIsOn)
    print("Thank You for playing")
   
}

game()


    


