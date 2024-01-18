//
//  SysOptions.swift
//  ListTest
//
//  Created by Kane Davidson on 12/2/20.
//

import SwiftUI
import Combine



// COAT OPTION CHECKBOXES


struct SysOptionsSelectPConductive: View {
    @EnvironmentObject var Chip : ChipOptions
    @EnvironmentObject var ChipPConductive : ColorChipValuesSelectPConductive //Used for coat selections
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
            ChipPConductive.QuantPCoatPtA = quant(product: TSA) //The amount of part A in prime coat
            ChipPConductive.QuantPCoatColorant = quant(product: TSColorant) //The amount of part C in prime coat
        }
        else {
            ChipPConductive.QuantPCoatPtA = 0 //The amount of part A in prime coat
            ChipPConductive.QuantPCoatColorant = 0 //The amount of part C in prime coat
        }
        
    }
    func ChipMVRQuantValues() {
        if Chip.isMVR == true {
        ChipPConductive.QuantMVRPtA = quant(product: TSA) //The amount of part A in prime coat
        ChipPConductive.QuantMVRPtB = quant(product: TSB) //The amount of part B in prime coat
        ChipPConductive.QuantMVRColorant = quant(product: TSColorant) //The amount of part C in prime coat
        }
        else {
            ChipPConductive.QuantMVRPtA = 0 //The amount of part A in prime coat
            ChipPConductive.QuantMVRPtB = 0 //The amount of part B in prime coat
            ChipPConductive.QuantMVRColorant = 0 //The amount of part C in prime coat
        }
    }
    var body: some View {
        
        
        
        VStack { // Coat Options
                Text("System Options")
                    .fontWeight(.heavy)
            
                Toggle(isOn: $Chip.isPrimeCoat, label: {
                    Text("Add Optional Prime Coat")
                })
                .onChange(of: Chip.isPrimeCoat) { _ in
                    ChipPCoatQuantValues()
                    
                }
                .toggleStyle(CheckBoxToggleStyle())
                    Toggle(isOn: $Chip.isMVR, label: {
                        Text("Add Optional MVR Coat")
                    })
                    .onChange(of: Chip.isMVR) { _ in
                              ChipMVRQuantValues()

                    }
                    .toggleStyle(CheckBoxToggleStyle())
                
        }
        .padding()
        .background(Color(red:239.0/255.0, green: 243.0/255.0, blue: 244.0/250, opacity: 1.0))
        .cornerRadius(25.0)
        
        }
    
}



struct SysOptionsSelectPConductive_Previews: PreviewProvider {
    static let chip = options()
    
    static var previews: some View {
        SysOptions().environmentObject(chip)
    }
}

