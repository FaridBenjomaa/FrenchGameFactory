//
//  main.swift
//  P3_01_Xcode
//
//  Created by Farid Benjomaa on 09/02/2021.
//

import Foundation

// parie
var party = Party()
party.langue = "Fr"
party.nbPlayer = 0


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

// Personnage controller par l'ordianteur
var ordiChara1 = Character()
var ordiChara2 = Character()
var ordiChara3 = Character()

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
var gameSolo = true

/* ************************************************************************
                                Fonction
 ************************************************************************** */

// Fonction pour choisir le nom des personnages de l'ordinataeur aleatoirement.
func chooseNameAlea(character : Character){
    let computerName : Array = ["Cloud", "Boris", "Mikael", "Lola", "Lilida"]
    let computerLastName : Array = ["Micro", "Red", "Sun", "Chevalier", "Box"]
    
    let indexAlea = Int.random(in: 0..<5)
    let indexAlea2 = Int.random(in: 0..<5)
    
    character.name = "\(computerName[indexAlea]) \(computerLastName[indexAlea2])"
}
chooseNameAlea(character: ordiChara1)
chooseNameAlea(character: ordiChara2)
chooseNameAlea(character: ordiChara3)

// choix du  nombre de joueur en francais et anglais
func nombreDeJoueur(){
    var nbjoueur : String?
    
    if party.langue == "Fr"{
        print("Combien de jouer")
        print("1 - 1 jouer")
        print("2 - 2 joueur")
    }else{
        print("how many players")
        print("1 - 1 Player")
        print("2 - 2 Players")
    }
    nbjoueur = readLine()
    
    if nbjoueur != nil {
        switch nbjoueur {
            case "1":
                party.nbPlayer = 1
                gameSolo = true
                
            case "2":
                party.nbPlayer = 2
                gameSolo = false
                
            default:
                if party.langue == "Fr"{
                    print("Merci de Choisir entre 1 ou 2 ")
                }else{
                    print("Please Choose between 1 or 2")
                }
                nombreDeJoueur()
        }
    }
    game()
}

// Text du choix de langue
func choiceLanguage(){
    print("\nQuel langue voulez vous utiliser pour jouer ?")
    print("What language do you want to use to play?")
    print("1.  Francais - French ")
    print("2.  English -- Anglais")
    langue = readLine()
    
    while gameIsOn == true {
        if langue == "1" {
            party.langue = "Fr"
          nombreDeJoueur()
        }else if langue == "2"{
            party.langue = "En"
            nombreDeJoueur()
        }else{
            print("Merci de selctionner parmis les 2 propositions")
            print("Please select between the 2 proposals")
            choiceLanguage()
        }
    }
}

//Fonction qui permet de rejouer une partie ou d'arreter
func win(){
    i = 1
    
    if party.langue == "Fr"{
        print(" voulez vous faire une nouvelle partie ?  : Oui ou Non")
    }else{
        print(" Do you want start a new game ?  Yes or No ")
    }

    if let choice = readLine(){
        switch choice.capitalized {
            case "Yes", "Oui":
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
                
                
                ordiChara1 = Character()
                ordiChara2 = Character()
                ordiChara3 = Character()
                ordiChara1.name = "Chevalier Ecko"
                ordiChara2.name = "Boris le Chasseur"
                ordiChara3.name = "Mickael Chipster"
                
                tour = 0
                party.nbPlayer = 2
                
                nombreDeJoueur()
            case "No", "Non":
                gameIsOn = false
                gameOver()
            default:
                gameIsOn = false
                gameOver()
                
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

//choix des armes aléatoires en francais et anglais
func randomWeapon(character: Character){
    let numalea = Int.random(in: 1..<5)
   
    if party.langue == "Fr"{
        print("\nUn coffre apparait")
    }else{
        print("\nA chest appears")
    }
   
    switch numalea {
        case 1:
            character.weapon = axe
            if party.langue == "Fr"{
                print("\(character.name!) obtient la \(character.weapon.name) qui se trouve dans le coffre")
            }else{
                print("\(character.name!) gets the \(character.weapon.nameEn) in the chest")
            }
            
        case 2:
            character.weapon = sword
            if party.langue == "Fr"{
                print("\(character.name!) obtient l' \(character.weapon.name) qui se trouve dans le coffre")
            }else{
                print("\(character.name!) gets the \(character.weapon.nameEn) in the chest")
            }
            
        case 3:
            character.weapon = shield
            if party.langue == "Fr"{
                print("\(character.name!) obtient le \(character.weapon.name) qui se trouve dans le coffre")
            }else{
                print("\(character.name!) gets the \(character.weapon.nameEn) in the chest")
            }
           
        case 4:
            character.weapon = hand
            if party.langue == "Fr"{
                print("\(character.name!) obtient la \(character.weapon.name) qui se trouve dans le coffre")
            }else{
                print("\(character.name!) gets the \(character.weapon.nameEn) in the chest")
            }
            
        default:
            character.weapon = axe
    }
}

//Phrase du choix des noms des personnages en francais et anglais
func characterMenu(character: Character) {
    if party.langue == "Fr" {
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
    }else{
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
    }
    i += 1
}
func computerMenu(character: Character) {
    if party.langue == "Fr"{
        // permet de changer de 1 er 2eme et 3eme en fonction de l'ordre
        var numero = ""
        if i == 1
        {
            numero = String(i) + " er"
        }else{
            numero = String(i) + " eme"
        }
        
        print("\n le \(numero) personnage  de l'ordi est \(character.name!): ")
    }else{
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
        
        print("\nThe \(numero) character is \(character.name!): ")
    }
    
    i += 1
}

//choix des armes des personnages
func armeChoice(character: Character){
    
    var arme : String?
    
    func choice(){
        if party.langue == "Fr"{
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
        arme = readLine()
    }
    choice()
    if  arme != nil {
        switch arme {
            case "1": // Ajouter une nouvelle activité
                character.weapon = axe
                if party.langue == "Fr"{
                    print("\(character.name!) posede une \(character.weapon.name)")
                }else{
                    print("\(character.name!) has a  \(character.weapon.name)")
                }
                
            case "2": // Consulter la banque
                character.weapon = sword
                if party.langue == "Fr"{
                    print("\(character.name!) posede une \(character.weapon.name)")
                }else{
                    print("\(character.name!) has a  \(character.weapon.nameEn)")
                }
                
            case "3": // Consulter la grange
                character.weapon = shield
                if party.langue == "Fr"{
                    print("\(character.name!) posede un \(character.weapon.name)")
                }else{
                    print("\(character.name!) has a \(character.weapon.nameEn)")
                }
               
            case "4" :
                character.weapon = hand
                if party.langue == "Fr"{
                    print("\(character.name!) posede un \(character.weapon.name)")
                }else{
                    print("\(character.name!) has a  \(character.weapon.nameEn)")
                }
                
            default:
                if party.langue == "Fr"{
                    print("Merci de faire un choix entre 1 et 4")
                    choice()
                }else{
                    print("Please make a choice between 1 and 4")
                    choice()
                }
                
        }
        
    }
}

func weaponChoiceAlea(character: Character){
    
    let arme = Int.random(in: 0..<5)
    
    func choice(){
        if party.langue == "Fr"{
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
            character.weapon = axe
            if party.langue == "Fr"{
                print("\(character.name!) posede une \(character.weapon.name)")
            }else{
                print("\(character.name!) has a  \(character.weapon.name)")
            }
            
        case 2: // Consulter la banque
            character.weapon = sword
            if party.langue == "Fr"{
                print("\(character.name!) posede une \(character.weapon.name)")
            }else{
                print("\(character.name!) has a  \(character.weapon.name)")
            }
        case 3: // Consulter la grange
            character.weapon = shield
            if party.langue == "Fr"{
                print("\(character.name!) posede une \(character.weapon.name)")
            }else{
                print("\(character.name!) has a  \(character.weapon.name)")
            }
        case 4 :
            character.weapon = hand
            if party.langue == "Fr"{
                print("\(character.name!) posede une \(character.weapon.name)")
            }else{
                print("\(character.name!) has a  \(character.weapon.name)")
            }
        default:
            if party.langue == "Fr"{
                print("Merci de faire un choix entre 1 et 4")
                choice()
            }else{
                print("Please make a choice between 1 and 4")
                choice()
            }
            
            
    }
    
    
}

//Changer de nom si le nom existe deja
func ChangeName(character: Character) {
    if party.langue == "Fr"{
        print("\nCe nom existe deja merci d'en choisir un autre : ")
    }else{
        print("\nThis name already exists please choose another one : ")
    }
    if let choice = readLine(){
        character.name = choice.capitalized
    }
}

func figth(character : Character, character2: Character){
    character2.lifePoint -= character.weapon.attackPoint
    character2.team.teamPoint -= character.weapon.attackPoint
    if character2.lifePoint <= 0 {
        character2.lifePoint = 0
        character2.isALive = false
    }
    if character2.team.teamPoint <= 0 {
        character2.team.teamPoint = 0
    }
    
    if party.langue == "Fr"{
        print("\n\(character.name!) attaque \(character2.name!) "
                + "\n \(character2.name!) perd \(character.weapon.attackPoint) point de vie"
                + "\n il reste \(character2.lifePoint) point de vie à \(character2.name!)")
    }else{
        print("\n\(character.name!) attack \(character2.name!) "
                + "\n \(character2.name!) lose \(character.weapon.attackPoint) healt point"
                + "\n there are \(character2.lifePoint) life point left to  \(character2.name!)")
    }
   
    if character2.lifePoint <= 0 {
        if party.langue == "Fr"
        {
            print("\(character2.name!) est KO!")
        }else{
            print("\(character2.name!) is KO!")

        }
       
        
    }
}

func attackMenu(c1P1:Character, c2P1: Character, c3P1: Character, c1P2:Character, c2P2: Character, c3P2: Character) {
    
    var p1 : Int = 0
    var p2 : Int = 0
    var perso : String?
    
    // choix du personnage qui attaque
    func choice(){
        if party.langue == "Fr"{
            print("\nQuel personnage voulez vous choisir ?:")
        }else{
            print("\nWitch Charactere do you want ?  :")
        }
        
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
                    if party.langue == "Fr"{
                        print("vous ne pouvez plus utiliser ce personnage pour attaquer")
                    }else{
                        print("you can no longer use this character to attack")
                    }
                    
                    choice()
                case "2":
                    p1 = 2
                case "3":
                    p1 = 3
                default:
                    //si le choix n'est pas corresct le choix est reposé
                    if party.langue == "Fr"{
                        print("Je ne comprends pas")
                    }else{
                        print("I don't understand")
                    }
                    
                    
                    
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
                    if party.langue == "Fr"{
                        print("vous ne pouvez plus utiliser ce personnage pour attaquer")
                    }else{
                        print("you can no longer use this character to attack")
                    }
                    choice()
                case "3":
                    p1 = 3
                default:
                    //si le choix n'est pas corresct le choix est reposé
                    if party.langue == "Fr"{
                        print("Je ne comprends pas")
                    }else{
                        print("I don't understand")
                    }
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
                    if party.langue == "Fr"{
                        print("vous ne pouvez plus utiliser ce personnage pour attaquer")
                    }else{
                        print("you can no longer use this character to attack")
                    }
                    choice()
                default:
                    if party.langue == "Fr"{
                        print("Je ne comprends pas")
                    }else{
                        print("I don't understand")
                    }
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
                if party.langue == "Fr"{
                    print("Je ne comprends pas")
                }else{
                    print("I don't understand")
                }
                choice()
        }
    }
    
    // choix du personnage qui sera attaquer
    func choiceAttack(){
        if party.langue == "Fr"{
            print("\n Quel personnage voulez vous attaquer ?")
        }else{
            print("\n Choose the character you want to attack?")
        }
        
        
        if c1P2.isALive == false {
            
            print("1.  \(c1P2.name!) (KO)")//
            
            //affiche KO lors celui-ci n'a plus de point de vie
        }else{
            
            print("1.  \(c1P2.name!)(\(c1P2.lifePoint) PV)")
            
        }
        if c2P2.isALive == false {
            
            print("2.  \(c2P2.name!) (KO)")//
            
            //affiche KO lors celui-ci n'a plus de point de vie
        }else{
            
            
            
            print("2.  \(c2P2.name!)(\(c2P2.lifePoint) PV)")
            
        }
        if c3P2.isALive == false {
            
            print("3.  \(c3P2.name!) (KO)")//
            
            //affiche KO lors celui-ci n'a plus de point de vie
        }else{
            
            
            print("3.  \(c3P2.name!)(\(c3P2.lifePoint) PV)")
            
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
                    if party.langue == "Fr"{
                        print("\nvous ne pouvez pas attaquer ce personnage, car celui ci est KO")
                    }else{
                        print("\nYou can’t attack this character, because he is KO")
                    }
                   
                    
                    choiceAttack()
                case "2":
                    p2 = 2
                case "3":
                    p2 = 3
                default:
                    // si le personnage ne choisi pas une option valide, le choix sera representer
                    if party.langue == "Fr"{
                        print("Je ne comprends pas")
                    }else{
                        print("I don't understand")
                    }
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
                    if party.langue == "Fr"{
                        print("\nvous ne pouvez pas attaquer ce personnage, car celui ci est KO")
                    }else{
                        print("\nYou can’t attack this character, because he is KO")
                    }
                    choiceAttack()
                case "3":
                    p2 = 3
                default:
                    // si le personnage ne choisi pas une option valide, le choix sera representer
                    if party.langue == "Fr"{
                        print("Je ne comprends pas")
                    }else{
                        print("I don't understand")
                    }
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
                    if party.langue == "Fr"{
                        print("\nvous ne pouvez pas attaquer ce personnage, car celui ci est KO")
                    }else{
                        print("\nYou can’t attack this character, because he is KO")
                    }
                    choiceAttack()
                default:
                    // si le personnage ne choisi pas une option valide, le choix sera representer
                    if party.langue == "Fr"{
                        print("Je ne comprends pas")
                    }else{
                        print("I don't understand")
                    }
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
                if party.langue == "Fr"{
                    print("Je ne comprends pas")
                }else{
                    print("I don't understand")
                }
                choiceAttack()
        }
    }
    
    
    // jette les dé enter 1 est 10
    let coffre = Int.random(in: 1..<10)
    
    //si le joueur 1 choisi son 1er personnage et choisis d'attaquer le 1er personnage du joueur 2
    if p1 == 1 && p2 == 4{
        //si les dé sont egale a 1 le coffre apparait
        if coffre  == 1 {
            
            randomWeapon(character: c1P1)
        }
        figth(character: c1P1, character2: c1P2)
        
    }
    //si le joueur 1 choisi son 1er personnage et choisis d'attaquer le 2eme personnage du joueur 2
    if p1 == 1 && p2 == 5{
        
        if coffre  == 1 {
            
            randomWeapon(character: c1P1)
        }
        figth(character: c1P1, character2: c2P2)
    }
    //si le joueur 1 choisi son 1er personnage et choisis d'attaquer le 3eme personnage du joueur 2
    if p1 == 1 && p2 == 6{
        
        if coffre  == 1 {
            
            randomWeapon(character: c1P1)
        }
        figth(character: c1P1, character2: c3P2)
    }
    //si le joueur 1 choisi son 2eme personnage et choisis d'attaquer le 1er personnage du joueur 2
    if p1 == 2 && p2 == 4{
        
        if coffre  == 1 {
            
            randomWeapon(character: c2P1)
        }
        figth(character: c2P1, character2: c1P2)
    }
    //si le joueur 1 choisi son 2eme personnage et choisis d'attaquer le 2eme personnage du joueur 2
    if p1 == 2 && p2 == 5{
        
        if coffre  == 1 {
            
            randomWeapon(character: c2P1)
        }
        figth(character: c2P1, character2: c2P2)
    }
    //si le joueur 1 choisi son 2eme personnage et choisis d'attaquer le 3eme personnage du joueur 2
    if p1 == 2 && p2 == 6{
        
        if coffre  == 1 {
            
            randomWeapon(character: c2P1)
        }
        figth(character: c2P1, character2: c3P2)
    }
    //si le joueur 1 choisi son 3eme personnage et choisis d'attaquer le 1er personnage du joueur 2
    if p1 == 3 && p2 == 4{
        
        if coffre  == 1 {
            
            randomWeapon(character: c3P1)
        }
        figth(character: c3P1, character2: c1P2)
    }
    //si le joueur 1 choisi son 3eme personnage et choisis d'attaquer le 2eme personnage du joueur 2
    if p1 == 3 && p2 == 5{
        
        if coffre  == 1 {
            
            randomWeapon(character: c3P1)
        }
        figth(character: c3P1, character2: c2P2)
    }
    
    //si le joueur 1 choisi son 3eme personnage et choisis d'attaquer le 3eme personnage du joueur 2
    if p1 == 3 && p2 == 6{
        
        if coffre  == 1 {
            
            randomWeapon(character: c3P1)
        }
        figth(character: c3P1, character2: c3P2)
    }
    
}

func computerAttackMenu(c1P1:Character, c2P1: Character, c3P1: Character, c1P2:Character, c2P2: Character, c3P2: Character) {
    
    var p1 : Int = 0
    var p2 : Int = 0
    var nombreDeMort = 0
    var nombreDeMortOrdi = 0
    var numberOrdi = Int.random(in: 1..<4)
    
    // choix du personnage qui attaque
    func choice(){
        if party.langue == "Fr"{
            print("\nQuel personnage voulez vous choisir ?:")
        }else{
            print("\nWitch Charactere do you want ?  :")
        }
        
        if c1P1.isALive == false {
            print("1.  \(c1P1.name!) (KO)")
            nombreDeMort += 1
            // ajoute 1 au nombre de mort
        }else{
            print("1.  \(c1P1.name!) (\(c1P1.lifePoint) PV) ")
        }
        if c2P1.isALive == false {
            print("2.  \(c2P1.name!) (KO)")
            nombreDeMort += 2
            // ajoute 2 au nombre de mort
        }else{
            print("2.  \(c2P1.name!) ( \(c2P1.lifePoint) PV) ")
        }
        if c3P1.isALive == false {
            print("3.  \(c3P1.name!) (KO)")
            nombreDeMort += 3
            // ajoute 3 au nombre de mort
        }else{
            print("3.  \(c3P1.name!) (\(c3P1.lifePoint) PV)")
        }
        
    }
    
    choice()
    

    
    // case 1 2 ou 3 en fonction du nombre de mort calculer
    switch nombreDeMort {
        case 1:
            numberOrdi = Int.random(in: 2..<4)
            switch numberOrdi {
                case 2:
                    p1 = 2
                case 3:
                    p1 = 3
                default:
                    p1 = 2
            }
        case 2:
            numberOrdi = Int.random(in: 2..<4)
            switch numberOrdi {
                case 2:
                    p1 = 1
                case 3:
                    p1 = 3
                default:
                    p1 = 1
            }
        case 3:
            p1 = 3
        case 4:
            p1 = 2
        case 5:
            p1 = 1
        default:
            //choix si aucun joueur n'est KO
            numberOrdi = Int.random(in: 1..<4)
            switch numberOrdi {
                case 1:
                    p1 = 1
                case 2:
                    p1 = 2
                case 3:
                    p1 = 3
                default:
                    p1 = 1
            }
    }
    
    
    // choix du personnage qui sera attaquer
    func choiceAttack(){
        if party.langue == "Fr"{
            print("\n Quel personnage voulez vous attaquer ?")
        }else{
            print("\n Choose the character you want to attack?")
        }
        
        if c1P2.isALive == false {
            print("1.  \(c1P2.name!) (KO)")//affiche KO lors celui-ci n'a plus de point de vie
            nombreDeMortOrdi += 1
        }else{
            print("1.  \(c1P2.name!)(\(c1P2.lifePoint) PV)")
        }
        if c2P2.isALive == false {
            print("2.  \(c2P2.name!) (KO)")//affiche KO lors celui-ci n'a plus de point de vie
            nombreDeMortOrdi += 2
        }else{
            print("2.  \(c2P2.name!) (\(c2P2.lifePoint) PV)")
        }
        if c3P2.isALive == false {
            print("3.  \(c3P2.name!) (KO)")//affiche KO lors celui-ci n'a plus de point de vie
            nombreDeMortOrdi += 3
        }else{
            print("3.  \(c3P2.name!) ( \(c3P2.lifePoint) PV) ")
        }
        
    }
    
    choiceAttack()
    
    numberOrdi = Int.random(in: 1..<4)
    
    switch nombreDeMortOrdi {
        case 1:
            numberOrdi = Int.random(in: 2..<4)
            switch numberOrdi {
                case 2:
                    p2 = 5
                case 3:
                    p2 = 6
                default:
                    p2 = 5
            }
        case 2:
            numberOrdi = Int.random(in: 2..<4)
            switch numberOrdi {
                case 2:
                    p2 = 4
                case 3:
                    p2 = 6
                default:
                    p2 = 4
            }
        case 3:
            p2 = 6
        case 4:
            p2 = 5
        case 5:
            p2 = 4
        default:
            numberOrdi = Int.random(in: 1..<4)
            switch numberOrdi {
                case 1:
                    p2 = 4
                case 2:
                    p2 = 5
                case 3:
                    p2 = 6
                default:
                    p2 = 4
            }
            
    }
    
    
    
    // jette les dé enter 1 est 10
    let coffre = Int.random(in: 1..<10)
    
    //si le joueur 1 choisi son 1er personnage et choisis d'attaquer le 1er personnage du joueur 2
    if p1 == 1 && p2 == 4{
        //si les dé sont egale a 1 le coffre apparait
        if coffre  == 1 {
            
            randomWeapon(character: c1P1)
        }
        figth(character: c1P1, character2: c1P2)
        
    }
    //si le joueur 1 choisi son 1er personnage et choisis d'attaquer le 2eme personnage du joueur 2
    if p1 == 1 && p2 == 5{
        
        if coffre  == 1 {
            
            randomWeapon(character: c1P1)
        }
        figth(character: c1P1, character2: c2P2)
    }
    //si le joueur 1 choisi son 1er personnage et choisis d'attaquer le 3eme personnage du joueur 2
    if p1 == 1 && p2 == 6{
        
        if coffre  == 1 {
            
            randomWeapon(character: c1P1)
        }
        figth(character: c1P1, character2: c3P2)
    }
    //si le joueur 1 choisi son 2eme personnage et choisis d'attaquer le 1er personnage du joueur 2
    if p1 == 2 && p2 == 4{
        
        if coffre  == 1 {
            
            randomWeapon(character: c2P1)
        }
        figth(character: c2P1, character2: c1P2)
    }
    //si le joueur 1 choisi son 2eme personnage et choisis d'attaquer le 2eme personnage du joueur 2
    if p1 == 2 && p2 == 5{
        
        if coffre  == 1 {
            
            randomWeapon(character: c2P1)
        }
        figth(character: c2P1, character2: c2P2)
    }
    //si le joueur 1 choisi son 2eme personnage et choisis d'attaquer le 3eme personnage du joueur 2
    if p1 == 2 && p2 == 6{
        
        if coffre  == 1 {
            
            randomWeapon(character: c2P1)
        }
        figth(character: c2P1, character2: c3P2)
    }
    //si le joueur 1 choisi son 3eme personnage et choisis d'attaquer le 1er personnage du joueur 2
    if p1 == 3 && p2 == 4{
        
        if coffre  == 1 {
            
            randomWeapon(character: c3P1)
        }
        figth(character: c3P1, character2: c1P2)
    }
    //si le joueur 1 choisi son 3eme personnage et choisis d'attaquer le 2eme personnage du joueur 2
    if p1 == 3 && p2 == 5{
        
        if coffre  == 1 {
            
            randomWeapon(character: c3P1)
        }
        figth(character: c3P1, character2: c2P2)
    }
    
    //si le joueur 1 choisi son 3eme personnage et choisis d'attaquer le 3eme personnage du joueur 2
    if p1 == 3 && p2 == 6{
        
        if coffre  == 1 {
            
            randomWeapon(character: c3P1)
        }
        figth(character: c3P1, character2: c3P2)
    }
    
}


func game(){
    if gameIsOn == true{
        if party.langue == "Fr"{
            print("\n******************* Regle du Jeu ******************"
                    +   "\nVous devez choisir 3 personnages et leur donner un nom"
                    + "\nchaque nom doit etre unique, pour chaque personnage"
                    + "\nvous devez lui attribuer une arme ")
            
            print("\n******************"
                    + "Le Joeur 1 Choisis "
                    + "******************")
        }else{
            print("\n******************* Regle du Jeu ******************"
                    +   "\nYou must choose 3 characters and give them a name"
                    + "\n each name must be unique, for each character"
                    + "\nyou must assign him a weapon")
            
            print("\n******************"
                    + "\nPlayer 1 choose"
                    + "\n******************")
        }
            
            characterMenu(character: player1Chara1)
            armeChoice(character: player1Chara1)
            characterMenu(character: player1Chara2)
            while player1Chara1.name == player1Chara2.name {
                ChangeName(character: player1Chara2)
            }
            armeChoice(character: player1Chara2)
            characterMenu(character: player1Chara3)
            while (player1Chara1.name == player1Chara3.name) || (player1Chara2.name == player1Chara3.name)  {
                ChangeName(character: player1Chara3)
            }
            armeChoice(character: player1Chara3)
            teamChoice(character1: player1Chara1, character2: player1Chara2, character3: player1Chara3, team: team1)
            
        
        
        
        if party.nbPlayer == 2{
            if party.langue == "Fr"{
                print("\n******************"
                        + "Le Joeur 2 Choisis "
                        + "******************")
            }else{
                print("\n******************"
                        + "\nPlayer 2 choose"
                        + "\n******************")
            }
            
            
            i = 1 //reinitialisation de i pour afficher le nombre dans le choix des personnages
            characterMenu(character: player2Chara1)
            while (player2Chara1.name == player1Chara1.name) || (player2Chara1.name == player1Chara2.name) || (player2Chara1.name == player1Chara3.name)  {
                ChangeName(character: player2Chara1)
            }
            armeChoice(character: player2Chara1)
            characterMenu(character: player2Chara2)
            while (player2Chara1.name == player2Chara2.name) || (player2Chara2.name == player1Chara1.name) || (player2Chara2.name == player1Chara2.name) || (player2Chara2.name == player1Chara3.name) {
                ChangeName(character: player2Chara2)
            }
            armeChoice(character: player2Chara2)
            characterMenu(character: player2Chara3)
            while (player2Chara1.name == player2Chara3.name) || (player2Chara2.name == player2Chara3.name) || (player2Chara3.name == player1Chara1.name) || (player2Chara3.name == player1Chara2.name) || (player2Chara3.name == player1Chara3.name) {
                ChangeName(character: player2Chara3)
            }
            armeChoice(character: player2Chara3)
            teamChoice(character1: player2Chara1, character2: player2Chara2, character3: player2Chara3, team: team2)
        }else{
            
            if party.langue == "Fr"{
                print("\n******************"
                        + "L'ordianteur Choisis "
                        + "******************")
            }else{
                print("\n******************"
                        + "\nComputer choose"
                        + "\n******************")
            }
            
            i = 1 //reinitialisation de i pour afficher le nombre dans le choix des personnages
            computerMenu(character: ordiChara1)
            weaponChoiceAlea(character: ordiChara1)
            
            computerMenu(character: ordiChara2)
            weaponChoiceAlea(character: ordiChara2)
            
            computerMenu(character: ordiChara3)
            weaponChoiceAlea(character: ordiChara3)
            
            teamChoice(character1: ordiChara1, character2: ordiChara2, character3: ordiChara3, team: team2)
        }
        
        
            
        if party.langue == "Fr"{
            print   ("\n******************"
                        + " La partie peu commencer "
                        + "******************"
                        + "\n")
        }else{
            print   ("\n******************"
                        + "\n Game Start"
                        + "\n******************"
                        + "\n")
        }
            
            
            // lancement des dés pour Joueur 1 et Joueur 2
            let numberP1 = Int.random(in: 0..<10)
            let numberP2 = Int.random(in: 0..<10)
            
            //si le nombre du Joeur 1 est plus grand Le joeur 1 commence
        if party.nbPlayer == 2 {
            if numberP1 > numberP2 {
          
                while team1.teamPoint != 0 || team2.teamPoint != 0 {
                    if team1.teamPoint == 0 {
                        if party.langue == "Fr"{
                            print("\nL'equipe 2 a Gagné")
                            print("Team 2 : \(team2.teamPoint) point et  Team 1 : \(team1.teamPoint)  point en \(tour) tours ")
                        }else{
                            print("Team 2 win")
                            print("Team 2 : \(team2.teamPoint) point and Team 1 : \(team1.teamPoint)  point in \(tour) rounds")
                        }
                        win()
                        break
                    }else{
                        if party.langue == "Fr"{
                            print("\nLe Joueur 1 commence : ")
                            
                        }else{
                            print("\nPlayer 1 play : ")
                        }
                        
                        
                        
                        attackMenu(c1P1: player1Chara1, c2P1: player1Chara2, c3P1: player1Chara3, c1P2: player2Chara1, c2P2: player2Chara2, c3P2: player2Chara3)
                        //compte du nombre de tour
                        tour += 1
                    }
                    print("Team 1 : \(team1.teamPoint) Team 2 : \(team2.teamPoint) ")
                    
                    if team2.teamPoint == 0 {
                        if party.langue == "Fr"{
                            print("\nL'equipe 1 a Gagné")
                            print("Team 1 : \(team2.teamPoint) point et  Team 2 : \(team1.teamPoint)  point en \(tour) tours ")
                        }else{
                            print("Team 1 win")
                            print("Team 1 : \(team2.teamPoint) point and Team 2 : \(team1.teamPoint)  point in \(tour) rounds")
                        }
                        win()
                        break
                    }else{
                        if party.langue == "Fr"{
                            print("\nLe Joueur 2 commence : ")
                            
                        }else{
                            print("\nPlayer 2 play : ")
                        }
                        
                        attackMenu(c1P1: player2Chara1, c2P1: player2Chara2, c3P1: player2Chara3, c1P2: player1Chara1, c2P2: player1Chara2, c3P2: player1Chara3)
                        //compte du nombre de tour
                        tour += 1
                    }
                    
                }
                //sinon le joueur 2 commence
            }else{
                
                while team1.teamPoint != 0 || team2.teamPoint != 0 {
                    if team2.teamPoint == 0 {
                        if party.langue == "Fr"{
                            print("\nL'equipe 1 a Gagné")
                            print("Team 1 : \(team2.teamPoint) point et  Team 2 : \(team1.teamPoint)  point en \(tour) tours ")
                        }else{
                            print("Team 1 win")
                            print("Team 1 : \(team2.teamPoint) point and Team 2 : \(team1.teamPoint)  point in \(tour) rounds")
                        }
                        win()
                        break
                    }else{
                        if party.langue == "Fr"{
                            print("\nLe Joueur 2 commence : ")
                            
                        }else{
                            print("\nPlayer 2 play : ")
                        }
                        attackMenu(c1P1: player2Chara1, c2P1: player2Chara2, c3P1: player2Chara3, c1P2: player1Chara1, c2P2: player1Chara2, c3P2: player1Chara3)
                        //compte du nombre de tour
                        tour += 1
                    }
                    
                    
                    
                    if team1.teamPoint == 0 {
                        if party.langue == "Fr"{
                            print("\nL'equipe 2 a Gagné")
                            print("Team 2 : \(team2.teamPoint) point et  Team 1 : \(team1.teamPoint)  point en \(tour) tours ")
                        }else{
                            print("Team 2 win")
                            print("Team 2 : \(team2.teamPoint) point and Team 1 : \(team1.teamPoint)  point in \(tour) rounds")
                        }
                        win()
                        break
                    }else{
                        if party.langue == "Fr"{
                            print("\nLe Joueur 1 commence : ")
                            
                        }else{
                            print("\nPlayer 1 play : ")
                        }
                        
                        attackMenu(c1P1: player1Chara1, c2P1: player1Chara2, c3P1: player1Chara3, c1P2: player2Chara1, c2P2: player2Chara2, c3P2: player2Chara3)
                        //compte du nombre de tour
                        tour += 1
                    }
                    
                }
            }
        }
        else{
            if numberP1 > numberP2 {
                
                while team1.teamPoint != 0 || team2.teamPoint != 0 {
                    if team1.teamPoint == 0 {
                        if party.langue == "Fr"{
                            print("\nL'equipe 2 a Gagné")
                            print("Team 2 : \(team2.teamPoint) point et  Team 1 : \(team1.teamPoint)  point en \(tour) tours ")
                        }else{
                            print("Team 2 win")
                            print("Team 2 : \(team2.teamPoint) point and Team 1 : \(team1.teamPoint)  point in \(tour) rounds")
                        }
                        win()
                        break
                    }else{
                        if party.langue == "Fr"{
                            print("\nLe Joueur 1 commence : ")
                            
                        }else{
                            print("\nPlayer 1 play : ")
                        }
                        
                        attackMenu(c1P1: player1Chara1, c2P1: player1Chara2, c3P1: player1Chara3, c1P2: ordiChara1, c2P2: ordiChara2, c3P2: ordiChara3)
                        //compte du nombre de tour
                        tour += 1
                    }
                    print("Team 1 : \(team1.teamPoint) Team 2 : \(team2.teamPoint) ")
                    
                    if team2.teamPoint == 0 {
                        if party.langue == "Fr"{
                            print("\nL'equipe 1 a Gagné")
                            print("Team 1 : \(team1.teamPoint) point et  Team 2 : \(team2.teamPoint)  point en \(tour) tours ")
                        }else{
                            print("Team 1 win")
                            print("Team 1 : \(team1.teamPoint) point and Team 2 : \(team2.teamPoint)  point in \(tour) rounds")
                        }
                        win()
                        break
                    }else{
                        if party.langue == "Fr"{
                            print("\nLe L'odrinateur Joue : ")
                            
                        }else{
                            print("\nComputer play : ")
                        }
                        
                        computerAttackMenu(c1P1: ordiChara1, c2P1: ordiChara2, c3P1: ordiChara3, c1P2: player1Chara1, c2P2: player1Chara2, c3P2: player1Chara3)
                        //compte du nombre de tour
                        tour += 1
                    }
                    
                }
                //sinon le joueur 2 commence
            }else{
                
                while team1.teamPoint != 0 || team2.teamPoint != 0 {
                    if team2.teamPoint == 0 {
                        if party.langue == "Fr"{
                            print("\nL'equipe 1 a Gagné")
                            print("Team 1 : \(team1.teamPoint) point et  Team 2 : \(team2.teamPoint)  point en \(tour) tours ")
                        }else{
                            print("Team 1 win")
                            print("Team 1 : \(team1.teamPoint) point and Team 2 : \(team2.teamPoint)  point in \(tour) rounds")
                        }
                        win()
                        break
                    }else{
                        if party.langue == "Fr"{
                            print("\nLe Joueur 1 joue : ")
                            
                        }else{
                            print("\nPlayer 1 play : ")
                        }
                        
                        computerAttackMenu(c1P1: ordiChara1, c2P1: ordiChara2, c3P1: ordiChara3, c1P2: player1Chara1, c2P2: player1Chara2, c3P2: player1Chara3)
                        //compte du nombre de tour
                        tour += 1
                    }
                    
                    
                    
                    if team1.teamPoint == 0 {
                        if party.langue == "Fr"{
                            print("\nL'ordi a gagné")
                            print("Team 2 : \(team2.teamPoint) point et  Team 1 : \(team1.teamPoint)  point en \(tour) tours")
                        }else{
                            print("Computer win")
                            print("Team 2 : \(team2.teamPoint) point and Team 1 : \(team1.teamPoint)  point in \(tour) rounds")
                        }
                        
                        win()
                        break
                    }else{
                        if party.langue == "Fr"{
                            print("\nLe Joueur 1 joue : ")
                            
                        }else{
                            print("\nPlayer 1 play : ")
                        }
                        attackMenu(c1P1: player1Chara1, c2P1: player1Chara2, c3P1: player1Chara3, c1P2: ordiChara1, c2P2: ordiChara2, c3P2: ordiChara3)
                        //compte du nombre de tour
                        tour += 1
                    }
                    
                }
            }
        }
            
        }
        
   
        
        
    
    

}


func gameOver(){
   
    print(gameIsOn)
    if party.langue == "Fr"{
        print("Merci d'avoir jouer")
    }else{
        print("Thank You for playing")
    }


}


choiceLanguage()


    


