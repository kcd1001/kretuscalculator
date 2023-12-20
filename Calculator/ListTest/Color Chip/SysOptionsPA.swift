//
//  SysOptions.swift
//  ListTest
//
//  Created by Kane Davidson on 12/2/20.
//

import SwiftUI
import Combine



// COAT OPTION CHECKBOXES


struct SysOptionsPA: View {
    @EnvironmentObject var Chip : ChipOptions
    @EnvironmentObject var ChipPA : ColorChipValuesPA //Used for coat selections
    @EnvironmentObject var upcChoice : sysChoices
    @EnvironmentObject var sf : SquareFeet
    @EnvironmentObject var TSColorant : stats //Used for system stats (mixRat,CovRate, etc)
    @EnvironmentObject var UPCColor : stats
    
    func quant(product : stats) -> Int {
        let quantity : Float = (sf.squareF / product.covRate) * product.MixRat
         let kit = Int(ceil(Float(quantity / product.MixRat)))
         return kit
        } // returns number of kits required
    
    func ChipPCoatQuantValues() {
        if Chip.isPrimeCoat == true {
            ChipPA.QuantPCoatPtA = quant(product: TSA) //The amount of part A in prime coat
            ChipPA.QuantPCoatPolyColorant = quant(product: TSColorant) //The amount of part C in prime coat
        }
        else {
            ChipPA.QuantPCoatPtA = 0 //The amount of part A in prime coat
            ChipPA.QuantPCoatPolyColorant = 0 //The amount of part C in prime coat
        }
        
    }
    
    func ChipMVRQuantValues() {
        if Chip.isMVR == true {
            ChipPA.QuantMVRPtA = quant(product: TSA) //The amount of part A in prime coat
            ChipPA.QuantMVRPtB = quant(product: TSB) //The amount of part B in prime coat
            ChipPA.QuantMVRColorant = quant(product: TSColorant) //The amount of part C in prime coat
        }
        else {
            ChipPA.QuantMVRPtA = 0 //The amount of part A in prime coat
            ChipPA.QuantMVRPtB = 0 //The amount of part B in prime coat
            ChipPA.QuantMVRColorant = 0 //The amount of part C in prime coat
        }
    }
    var body: some View {
        
        
        
        VStack { // Coat Options
                Text("System Options")
                    .fontWeight(.heavy)
            HStack {
                Toggle(isOn: $Chip.isPrimeCoat, label: {
                    Text("Add Optional Prime Coat")
                })
                    .onChange(of: Chip.isPrimeCoat) { _ in
                        ChipPCoatQuantValues()
                        
                    }
                    .toggleStyle(CheckBoxToggleStyle())
            }
            HStack {
                    Toggle(isOn: $Chip.isMVR, label: {
                        Text("Add Optional MVR Coat")
                    })
                    .onChange(of: Chip.isMVR) { _ in
                              ChipMVRQuantValues()

                    }
                    .toggleStyle(CheckBoxToggleStyle())
                }
        }
        .padding()
        .background(Color(red:239.0/255.0, green: 243.0/255.0, blue: 244.0/250, opacity: 1.0))
        .cornerRadius(25.0)
        
        }
    
}



struct SysOptionsPA_Previews: PreviewProvider {
    static let chip = options()
    
    static var previews: some View {
        SysOptions().environmentObject(chip)
    }
}

