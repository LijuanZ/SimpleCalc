//
//  main.swift
//  calculator
//
//  Created by iGuest on 10/8/15.
//  Copyright (c) 2015 Lijuan Zhang. All rights reserved.
//

import Foundation

func input() -> String {
    let keyboard = NSFileHandle.fileHandleWithStandardInput()
    let inputData = keyboard.availableData
    let result = NSString(data: inputData, encoding:NSUTF8StringEncoding) as! String
    return result.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
}

func getData(incoming:String) -> [String] {
    let arrData : [String]
    arrData = incoming.componentsSeparatedByString(" ")
    return arrData
}

func convertStrArrToDouble(inputArr:[String]) -> [Double] {
    let doubleArr = inputArr.map {
        ($0 as NSString).doubleValue
    }
    return doubleArr
}

func calcAvg(dataArr:[Double]) -> Double {
    var sum : Double = 0
    for var index = 0; index < dataArr.count; index++ {
        sum += dataArr[index]
    }
    return sum / Double(dataArr.count)
}

func calcFact(inputData:Double) -> Int {
    //let data : Double = inputData[0]
    var result = 1
    if inputData < 0 {
        print("Invalid input: factorial operation can not be apply to negative number.")
    }
    else {
        for var value = 1; value <= Int(inputData); value++ {
            result *= value
        }
    }
    return result
}

print("Enter number, operation, and number seperated by return.")
print("Or enter a sequence of number seperated by space and calc operation in the end (eg. 1 2 3 count):")
let firstInputStr = input()
let whitespace = NSCharacterSet.whitespaceCharacterSet()
let range = firstInputStr.rangeOfCharacterFromSet(whitespace)

// range will be nil if no whitespace is found
if let test = range {
    //Multi-operand operations
    let inputData : [String] = getData(firstInputStr)
    let length = inputData.count
    
    //Get operation
    let oper = inputData.last!
    
    //Get data
    let dataStrArr = Array(inputData[0..<length - 1])
    let dataDoubleArr = convertStrArrToDouble(dataStrArr)
    
    
    switch oper {
    case "count":
        print(length - 1)
    case "avg":
        print(calcAvg(dataDoubleArr))
    case "fact":
        if dataDoubleArr.count > 1 {
            print("Invalid input! Fact operation can only take one number")
        }
        else {
            print(calcFact(dataDoubleArr[0]))
        }
        
    default:
        print("Invalid input")
    }
}
else {
    //Simple calculation
    let inputLeft = (firstInputStr as NSString).doubleValue
    let oper = input()
    if oper == "fact" {
        print(calcFact(inputLeft))
    }
    else {
        let inputRight = (input() as NSString).doubleValue
        
        var result : Double = 0.0
        switch oper {
        case "+":
            result = inputLeft + inputRight
        case "-":
            result = inputLeft - inputRight
        case "*":
            result = inputLeft * inputRight
        case "/":
            result = inputLeft / inputRight
        case "%":
            result = inputLeft % inputRight
        default:
            print("Invalid input")
        }
        
        print(result)
    }
}


