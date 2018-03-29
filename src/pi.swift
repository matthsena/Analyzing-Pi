import Foundation  

// Declaração de variáveis e contantes globais
let author: String = "Matheus Alexandre de Sena"
var langText: String = "Select a language, type the respective number: \r\n1: PT - BR  \r\n2: EN - US" 
var invalidText: String = "Invalid value(s)!!"
var motivation: String = ""
var procedure: String = ""
var loopText: String = ""
var inputLength: String = ""
var inputRadius: String = ""

var langSelected: Int
var loopTimes: Int = 1
var length: Double = 0
var radius: Double = 0
var pi: Double = 0
var arrayPi: [Double] = []
var averagePi: Double = 0
var n: Double = 0
var stndDev: Double = 0

// Funtion to chose a language
func choseLang() -> Int {
    
    print(langText)
    let lang = readLine()

    if let langOption = Int(lang!) {
        
        if langOption == 1 || langOption == 2 {
            return langOption
        } else {
            return 0
        }              
    } else {
        return 0
    }
}

langSelected = choseLang()

while langSelected == 0 {

    print(invalidText)
    langSelected = choseLang()
}
// PT - BR
if langSelected == 1 { 

    motivation = "\nBem-vindo \nEsse programa foi criado por \(author) para estudar sobre o numero π"
    procedure = "\nProcedimento: \nMeça 'n' circunferência(s) 'n' vezes, pegue os valores" 
    + " do 'r' e 'c', então o programa analisar esses dados, obtendo a média"
    + " e do desvio padrão, π é igual a c/2r" 
    loopText = "\nDigite o número de vezes que a circunferência foi medida"
    invalidText = "Valor inválido !!"
    inputLength = "\nDigite o comprimento da circunferência(cm): "
    inputRadius = "\nDigite o valor do raio(cm): "
} 
// EN - US
else if langSelected == 2 {

    motivation = "\nWelcome \nThis software had been created by \(author) to study about the number π"
    procedure =  "\nProcedure: \nMeasure 'n' circles 'n' times, get the values of 'r' and 'l', so the"
    + " software will analise this datas, getting the average and standard deviation, π is equals c/2r"
    loopText = "\nType the number of times that the circle had been measured"
    inputLength = "\nType the length of circle(cm): "
    inputRadius = "\nType the value of radius(cm): "
}

func loops() -> Int{
    
    print(loopText)

    let loop = readLine()

    if let loopNum = Int(loop!){

        return loopNum
    } 
    else {
        return 0
    }
}

loopTimes = loops()

while loopTimes == 0 {
    print(invalidText)
    loopTimes = loops()
}

for _ in 1...loopTimes {

    func mathPi() -> Double {

        print(inputLength)
        let l = readLine()

        if let lDouble = Double(l!){
            if lDouble == 0 {
                return 0
            } else {
                length = lDouble
            }
        } 
        else {
            return 0
        }

        print(inputRadius)
        let r = readLine()

        if let rDouble = Double(r!){
            if rDouble == 0 {
                return 0
            } else {
                radius = rDouble
            }
        } 
        else {
            return 0
        }

        pi = length / (radius * 2)
        return pi
    }
    
    pi = mathPi()

    while pi == 0{
        print(invalidText)
        pi = mathPi()

    }

    averagePi += pi

    arrayPi.append(pi)
    print("Pi = \(pi)")
    
}



func stndDeviation(average: Double, num: Double, cont: Int) -> Double {
    
    let x: Int = cont - 1

    for i:Int in 0...x {
        stndDev = pow(arrayPi[i] - average, 2.0) + stndDev
        stndDev = sqrt(stndDev / num)
    }

    return stndDev
}


n = Double(loopTimes)
averagePi = averagePi / n

stndDev =  stndDeviation(average: averagePi, num: n, cont: loopTimes)

print("Media: \(averagePi)")

print("Desvio: \(stndDev)")


