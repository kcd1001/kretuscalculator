//
//  SysOptions.swift
//  ListTest
//
//  Created by Kane Davidson on 12/2/20.
//

import SwiftUI
import Combine



// COAT OPTION CHECKBOXES


struct SysOptionsESD: View {
    @EnvironmentObject var Chip : ChipOptions
    @EnvironmentObject var ChipTS : ColorChipValuesTS //Used for coat selections
    @EnvironmentObject var upcChoice : sysChoices
    @EnvironmentObject var sf : SquareFeet
    @EnvironmentObject var TSColorant : stats //Used for system stats (mixRat,CovRate, etc)
    @EnvironmentObject var UPCColor : stats
    
    func quant(product : stats) -> Int {
        let quantity : Float = (sf.squareF / product.covRate) * product.MixRat
         let kit = Int(ceil(Float(quantity / product.MixRat)))
         return kit
        } // returns number of kits required
    

    var body: some View {
        
        
        
        VStack { // Coat Options
                Text("System Options")
                    .fontWeight(.heavy)
            
                Toggle(isOn: $Chip.isPrimeCoat, label: {
                    Text("Add Optional Prime Coat")
                })

                .toggleStyle(CheckBoxToggleStyle())
            
//                Toggle(isOn: $Chip.isMVR, label: {
//                        Text("Add Optional MVR Coat")
//                })
//                    .toggleStyle(CheckBoxToggleStyle())
                
        }
                       
        .padding()
        .background(Color(red:239.0/255.0, green: 243.0/255.0, blue: 244.0/250, opacity: 1.0))
        .cornerRadius(25.0)
        
        }
    
}



struct SysOptionsESD_Previews: PreviewProvider {
    static let chip = options()
    
    static var previews: some View {
        SysOptions().environmentObject(chip)
    }
}

