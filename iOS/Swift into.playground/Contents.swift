import UIKit;


var str = "Hello, playground"

for x in 0..<10 {
    x*x
}


// 1. Variabili, costanti e tipi di dati fondamentali
var nome: String = "Antonio"
var nome2 = "Antonio"
let url = "google.it" //costante

var currentValue: Int = 35
var temperature: Float = 24.5
let pi: Double = 3.14159
var unCarattere: Character = "a"
var isValid: Bool = true

let base = 3                             // tipo inferito: Int
let altezza = 5.2                        // tipo inferito: Double
//var area = base * altezza                // errore, non valido perchè base e altezza hanno un tipo diverso
var area = Double(base) * altezza        // corretto, operandi dello stesso tipo ed il risultato &grave; un Double
// conversione da Double a Int
let altezzaApprossimata = Int(altezza)   // troncato a 5

var piInt = 3
var virgola = ","
var decimaliPi = 14
var pigreco = "\(piInt)\(virgola)\(decimaliPi)"

// 2. Optional
var year: Int?
year = 5
print(year)  // stampa Optional(5) perchè swift wrappa gli Optional

print(year!) // forza unwrapping --> 5

if let yearValue = year { // Il compilatore verifica che year sia diverso da nil, ed in caso positivo ne fa l'unwrap ponendolo nella costante locale yearValue.
    print("il valore è \(yearValue)")
} else {
    print("variabile a nil")
}

var year2: Int! // unwrap implicito --> si mette ! sul tipoe in questo modo ho gia il valore senza fare unwrapping

var aValue: Int? = 5
print(aValue)
let finalValue = aValue ?? 0 // operatore di nil coalescing --> se non inizializzato restituisce 0
print(finalValue)


// 3. Collezioni: Array e Dizionari
var strumentiMusicali = ["Pianoforte", "Chitarra", "Clarinetto"]
strumentiMusicali[0]
strumentiMusicali[1] = "Basso"
strumentiMusicali.append("Arpa")    // aggiunta di un singolo elemento
strumentiMusicali += ["Sax"]        // aggiunta di un array con singolo elemento
// concatenazione di array
var percussioni = ["Tamburo", "Gran cassa", "Piatti"]
strumentiMusicali = strumentiMusicali + percussioni
strumentiMusicali[0...3]     // restituisce un array con i primi 4 elementi
strumentiMusicali[1..<3]     // restituisce un array con il secondo e terzo elemento
strumentiMusicali.insert("Oboe", at: 1)
strumentiMusicali.count         // restituisce il numero di elementi di un array
// rimozione del 4 elemento
strumentiMusicali.remove(at: 3)
var temperatureMinime: [Double]
var temperatureMassime: Array<Double>
var ottoni = [String]() // array vuoto
var archi = Array<String>() // array vuoto
var b: [Int] = []

var auto = ["marca": "bmw", "modello": "X3", "colore": "blu", "posti": "5"]
var nuovoDiz = Dictionary<String, Int>()
var nuovoDiz2 = [Int : String]()
var nuovoDiz3: [Int : String] = [:]
auto["marca"]
print(auto["marca"]) // restituisce un Optional
print(auto["marca"]!)
// Aggiungere/aggiornare una chiave-valore
auto["anno_di_acquisto"] = "2014"
auto.updateValue("Antonio", forKey: "anno_di_acquisto")
// rimuovere
auto.removeValue(forKey: "anno_di_acquisto")
auto.removeValue(forKey: "chiave che non esiste")
// numero di coppie nel dizionario
auto.count
// estrazione delle chiavi e dei valori separatament
let chiavi = Array(auto.keys)
let valori = Array(auto.values)


// 4. Cicli
for i in 1...10 {
    print(i)
}

let auto2 = ["marca": "Audi",
        "modello": "Q3",
        "colore": "alpine white",
        "concessionario": "Audi Zentrum"]
for (chiave, valore) in auto2 {
    print("\(chiave) : \(valore)")
}


// 5. Funzioni
func saluta(nome: String) {
    print("Buongiorno, " + nome + "!")
}
saluta(nome: "Antonio") // devo usare l'etichetta "nome"

func saluta(_ messaggio: String, ripetizioni: Int) { // usa _ se non voglio l'etichetta
    for i in 0...ripetizioni {
        print(messaggio)
    }
}
saluta("Good Morning", ripetizioni: 5)

// funzione che ritorna un intero
func somma(_ a: Int, _ b: Int) -> Int {
    return a + b
}
var result = somma(3, 5)    // result sarà di tipo Int

// valori di default
func saluta(messaggio: String = "Buongiorno", nome: String) {
    print("\(messaggio), \(nome)")
}

// Assegnare funzioni
var operazioneMatematica: (Int, Int) -> Int?
/*definisce una variabile che avrà come valore una funzione che prende in input due interi e restituisce opzionalmente un intero. Se consideriamo la seguente funzione:
 */
func divisione(primoOp: Int, secondoOp: Int) -> Int? {
    if secondoOp == 0 { return nil }
    return primoOp / secondoOp
}
divisione(primoOp: 5, secondoOp: 2)                      // restituisce 2
operazioneMatematica = divisione
operazioneMatematica(5, 2)

/*
Normalmente, i valori passati come argomenti di una funzione non possono essere modificati all'interno del corpo della stessa, perchè sono delle costanti. Tuttavia, è possibile marcare un parametro con la parola riservata inout, in modo poter modificare il valore di un parametro e rendere le modifiche persistenti al termine dell'esecuzione della funzione.
*/
func swap(_ a: inout Int, _ b: inout Int) {
    let temp = a
    a = b
    b = temp
}
var firstValue = 5
var secondValue = 18
swap(&firstValue, &secondValue) // mettere & per indicare che il valore viene modificato dalla funzione
print(firstValue) // è 18

// 6. Tuple
let serverResponse: (Int, String) = (400, "Not found")
print(serverResponse.0)
print(serverResponse.1)


let serverResponse2 = (statusCode: 400, errorMessage: "Not Found")
print(serverResponse2.statusCode)
print(serverResponse2.errorMessage)

let (statusCode, errorMessage) = (400, "Not Found") // decomposizione di una tupla
if statusCode != 0 {
    print("Error: \(errorMessage)")
}

// 7. Classi
//var person = Person(name: "Federico", surname: "Parezzan")
