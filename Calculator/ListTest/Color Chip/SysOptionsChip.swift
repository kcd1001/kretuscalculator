//
//  SysOptions.swift
//  ListTest
//
//  Created by Kane Davidson on 12/2/20.
//

import SwiftUI
import Combine



// COAT OPTION CHECKBOXES

class ChipOptions: ObservableObject {
    
    @Published var isTopCoat2 : Bool = false
    @Published var isPrimeCoat = false
    @Published var isMVR = false
    @Published var ThicknessSelection : Int = 0
    @Published var isSolventCleaner : Bool = false 
//    @Published var isUVRes : Bool = false
//    @Published var isTexture : Bool = false
//    @Published var showingPicker : Bool = false
//    @Published var ThicknessSelection : Int = 0
//    @Published var totalThickness : Int = 0

}


struct SysOptionsChip: View {
    @EnvironmentObject var Chip : ChipOptions
    @EnvironmentObject var ChipGarage : ColorChipValues //Used for coat selections
    @EnvironmentObject var upcChoice : sysChoices
    @EnvironmentObject var sf : SquareFeet
    @EnvironmentObject var UPCA : stats //Used for system stats (mixRat,CovRate, etc)
    @EnvironmentObject var UPCB : stats //Used for system stats (mixRat,CovRate, etc)
    @EnvironmentObject var UPCC : stats //Used for system stats (mixRat,CovRate, etc)
    @EnvironmentObject var TSColorant : stats //Used for system stats (mixRat,CovRate, etc)
    @EnvironmentObject var UPCColor : stats
        
        func quant(product : stats) -> Int {
            let quantity : Float = (sf.squareF / product.covRate) * product.MixRat
             let kit = Int(ceil(Float(quantity / product.MixRat)))
             return kit
            } // returns number of kits required
        
        func ChipPCoatQuantValues() {
            if Chip.isPrimeCoat == true {
            ChipGarage.QuantPCoatPtA = quant(product: TSA) //The amount of part A in prime coat
            ChipGarage.QuantPCoatPtB = quant(product: TSB) //The amount of part B in prime coat
            ChipGarage.QuantPCoatColorant = quant(product: TSColorant) //The amount of part C in prime coat
            }
            else {
                ChipGarage.QuantPCoatPtA = 0 //The amount of part A in prime coat
                ChipGarage.QuantPCoatPtB = 0 //The amount of part B in prime coat
                ChipGarage.QuantPCoatColorant = 0 //The amount of part C in prime coat
            }
            
        }
        func ChipMVRQuantValues() {
            if Chip.isMVR == true {
            ChipGarage.QuantMVRPtA = quant(product: TSA) //The amount of part A in prime coat
            ChipGarage.QuantMVRPtB = quant(product: TSB) //The amount of part B in prime coat
            ChipGarage.QuantMVRColorant = quant(product: TSColorant) //The amount of part C in prime coat
            }
            else {
                ChipGarage.QuantMVRPtA = 0 //The amount of part A in prime coat
                ChipGarage.QuantMVRPtB = 0 //The amount of part B in prime coat
                ChipGarage.QuantMVRColorant = 0 //The amount of part C in prime coat
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
            HStack {
                    Toggle(isOn: $Chip.isMVR, label: {
                        Text("Add Optional MVR Coat")
                    })
                    .onChange(of: Chip.isMVR) { _ in
                              ChipMVRQuantValues()

                    }
                    .toggleStyle(CheckBoxToggleStyle())
                }

        } .padding()
        .background(Color(red:239.0/255.0, green: 243.0/255.0, blue: 244.0/250, opacity: 1.0))
        .cornerRadius(25.0)
        }
}


struct SysOptionsChip_Previews: PreviewProvider {
    static let chip = options()
    
    static var previews: some View {
        SysOptions().environmentObject(chip)
    }
}

