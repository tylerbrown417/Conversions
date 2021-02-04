//
//  ContentView.swift
//  Conversions
//
//  Created by Tyler Brown on 1/24/21.
//

import SwiftUI

struct ContentView: View {
    
    @State private var inputType = 0
    @State private var outputType = 0
    @State private var inputNumber = ""
    
    let inputUnits = ["Celcius", "Fahrenheit", "Kelvin"]
    let outputUnits = ["Celcius", "Fahrenheit", "Kelvin"]
    
    
    var outputNumber: Double {
        guard Double(inputNumber) != nil else { return 0 }
        
    
        let cToF = ((((inputNumber as NSString).doubleValue) * (9/5)) + 32)
        let fToC = (((inputNumber as NSString).doubleValue) - 32) * (5/9)
        
        let cToK = (((inputNumber as NSString).doubleValue) + 273.15)
        let kToC = (((inputNumber as NSString).doubleValue) - 273.15)
        
        let fToK = ((((inputNumber as NSString).doubleValue) - 32) * (5/9) + 273.15)
        let kToF = ((((inputNumber as NSString).doubleValue) - 273.15) * (9/5) + 32)
        
        let valueToValue = ((inputNumber as NSString).doubleValue)
        
        
        
        
        if inputType == 0 && outputType == 1 {
            return cToF
        } else if inputType == 1 && outputType == 0 {
            return fToC
        }
        
        
        else if inputType == 0 && outputType == 2 {
            return cToK
        } else if inputType == 2 && outputType == 0 {
            return kToC
        }
        
        
        
        else if inputType == 1 && outputType == 2 {
            return fToK
        } else if inputType == 2 && outputType == 1 {
            return kToF
        }
        
        
        else if inputType == 0 && outputType == 0 || inputType == 1 && outputType == 1 || inputType == 2 && outputType == 2 {
            return valueToValue
        }
        
        
        
        return 0
    }
    
    
    func finalOutputType() -> String {
        if outputType == 0 {
            return ("C")
        }
        else if outputType == 1 {
            return ("F")
        }
        else if  outputType == 2 {
            return ("K")
        }
        
        return ""
    }
    
    
    
    
    
    var body: some View {
        NavigationView {
            Form {
                
                
                Section(header: Text("Input unit:")) {
                    Picker("", selection: $inputType){
                        ForEach(0 ..< inputUnits.count) {
                        Text("\(self.inputUnits[$0])")
                        
                        }
                    } .pickerStyle(SegmentedPickerStyle())
                }
                
                
                Section(header: Text("Output unit:")) {
                    Picker("", selection: $outputType) {
                    ForEach(0 ..< outputUnits.count) {
                        Text("\(self.outputUnits[$0])")
                        
                        }
                    } .pickerStyle(SegmentedPickerStyle())
                }
                    
                
                Section(header: Text("Provide an input value")) {
                    TextField("Input value", text: $inputNumber)
                        .keyboardType(.decimalPad)
                }
                
                Section(header: Text("Output value")) {
                    Text("\(outputNumber, specifier: "%.2f")° \(finalOutputType())")
                
                }
            }
            .navigationBarTitle("Temp Conversions")
        }
    }



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        }
    }
}
