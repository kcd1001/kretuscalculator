//
//  SysOptions.swift
//  ListTest
//
//  Created by Kane Davidson on 12/2/20.
//

import SwiftUI
import Combine



// COAT OPTION CHECKBOXES

struct SysOptionsChipSL: View {
    @EnvironmentObject var Chip : ChipOptions
    @EnvironmentObject var ChipSL : ColorChipValuesSL //Used for coat selections
    @EnvironmentObject var upcChoice : sysChoices
    @EnvironmentObject var sf : SquareFeet
    @EnvironmentObject var ChipSLUPCA : stats //Used for system stats (mixRat,CovRate, etc)
    @EnvironmentObject var ChipSLUPCB : stats //Used for system stats (mixRat,CovRate, etc)
    @EnvironmentObject var ChipSLUPCC : stats //Used for system stats (mixRat,CovRate, etc)
    @EnvironmentObject var ChipSLUPCColorant : stats //Used for system stats (mixRat,CovRate, etc)
    @EnvironmentObject var UPCColor : stats
        
        func quant(product : stats) -> Int {
            let quantity : Float = (sf.squareF / product.covRate) * product.MixRat
             let kit = Int(ceil(Float(quantity / product.MixRat)))
             return kit
            } // returns number of kits required
        
        
    func ChipPCoatQuantValues() {
            if Chip.isPrimeCoat == true {
            ChipSL.QuantPCoatPtA = quant(product: ChipSLUPCA)
            ChipSL.QuantPCoatPtB = quant(product: ChipSLUPCB)
            ChipSL.QuantPCoatPtC = quant(product: ChipSLUPCC)
            ChipSL.QuantPCoatColor = quant(product: ChipSLUPCColorant) //The amount of part A in prime coat
            }
            else {
                ChipSL.QuantPCoatPtA = 0
                ChipSL.QuantPCoatPtB = 0
                ChipSL.QuantPCoatPtC = 0
                ChipSL.QuantPCoatColor = 0
                ChipSL.QuantPCoatColor = 0 //The amount of part A in prime coat
            }
            
        }
        func ChipMVRQuantValues() {
            if Chip.isMVR == true {
            ChipSL.QuantMVRPtA = quant(product: ChipSLUPCA) //The amount of part A in prime coat
            ChipSL.QuantMVRPtB = quant(product: ChipSLUPCB) //The amount of part B in prime coat
            ChipSL.QuantMVRColorant = quant(product: ChipSLUPCColorant) //The amount of part C in prime coat
            }
            else {
                ChipSL.QuantMVRPtA = 0 //The amount of part A in prime coat
                ChipSL.QuantMVRPtB = 0 //The amount of part B in prime coat
                ChipSL.QuantMVRColorant = 0 //The amount of part C in prime coat
            }
        }
    var body: some View {
        VStack { // Coat Options
                Text("System Options")
                    .fontWeight(.heavy)
                HStack {
                        Toggle(isOn: $Chip.isPrimeCoat, label: {
                            Text("Add Optional Prime Coat")
                            PrimeCoatInfo()
                        })
                        .onChange(of: Chip.isPrimeCoat) { _ in
                                  ChipPCoatQuantValues()

                        }
                        .toggleStyle(CheckBoxToggleStyle())
                    }


        } .padding()
        .background(Color(red:239.0/255.0, green: 243.0/255.0, blue: 244.0/250, opacity: 1.0))
        .cornerRadius(25.0)
        }
}


struct SysOptionsChipSL_Previews: PreviewProvider {
    static let chip = options()
    
    static var previews: some View {
        SysOptions().environmentObject(chip)
    }
}

