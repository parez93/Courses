import Foundation

// 1. Classe
public class Person{
    var name: String
    var surname: String
    var secondName: String?
    
    public init(name: String, surname: String, secondName: String){
        self.name = name
        self.surname = surname
        self.secondName = secondName
    }
    
    func descrizione() {
        print("Lo studente \(name) \(surname) è iscritto al corso di laurea")
    }
    
}


// 2. Ereditarietà
public class Student: Person{
    let matricola: Int
    var corso: String
    
    init(nome: String, cognome: String, secondName: String, matricola: Int, corso: String) {
        self.corso = corso
        self.matricola = matricola
        super.init(name: nome, surname: cognome, secondName: secondName)
    }
    
    // Devo marcare con "convenience" il costruttore se voglio fare overload usando self (con super non serve)
    convenience init(nome: String, cognome: String) {
        self.init(nome: nome, cognome: cognome, secondName: "",matricola: 1, corso: "")
    }

    override func descrizione() {
        print("Lo studente \(name) \(surname) è iscritto al corso di laurea in \(corso) con matricola \(matricola)")
    }
    
    func descrizione(name: String) {
        print("Lo studente \(name) \(surname) è iscritto al corso di laurea in \(corso) con matricola \(matricola)")
    }
}
