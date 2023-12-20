//
//  SysSummaryConc.swift
//  Calculator
//
//  Created by Kane Davidson on 2/2/21.
//

import SwiftUI

struct SysSummaryConc: View {
    @EnvironmentObject var upcChoiceRC : sysChoices //Used for coat selections
    @EnvironmentObject var upc : options //Used for coat checkboxes
    @EnvironmentObject var colorant : Colorant //colorant selection
    
    var body: some View {
        if upc.isPrimeCoat == true && upc.isTopCoat == true && ((upcChoiceRC.BCoatSelection != upcChoiceRC.PCoatSelection) && (upcChoiceRC.PCoatSelection != upcChoiceRC.TCoatSelection)) && (upcChoiceRC.BCoatSelection != upcChoiceRC.TCoatSelection) { //Completely unique values
            BCoatSwitch()
            PCoatSwitch()
            TCoatSwitch()
        }
       else if upc.isPrimeCoat == true && upc.isTopCoat == true && (upcChoiceRC.BCoatSelection == upcChoiceRC.PCoatSelection) && (upcChoiceRC.BCoatSelection != upcChoiceRC.TCoatSelection) { // Base coat and prime coat are the same
            BCoatSwitch()
            TCoatSwitch()
        }
       else if upc.isPrimeCoat == true && upc.isTopCoat == true && (upcChoiceRC.BCoatSelection == upcChoiceRC.TCoatSelection) && (upcChoiceRC.BCoatSelection != upcChoiceRC.PCoatSelection) {  // Base coat and top coat are the same
            PCoatSwitch()
            TCoatSwitch()
        }
       else if upc.isPrimeCoat == true && upc.isTopCoat == true && (upcChoiceRC.PCoatSelection == upcChoiceRC.TCoatSelection) && (upcChoiceRC.BCoatSelection != upcChoiceRC.TCoatSelection) {  // Prime coat and top coat are the same
            BCoatSwitch()
            TCoatSwitch()
        }
       else if upc.isPrimeCoat == true && upc.isTopCoat == true && (upcChoiceRC.BCoatSelection == upcChoiceRC.PCoatSelection) && (upcChoiceRC.BCoatSelection == upcChoiceRC.TCoatSelection) { //All coats are the same
            BCoatSwitch()
        }
       else if upc.isPrimeCoat == false && upc.isTopCoat == false { //only base coat selected
            BCoatSwitch()
       }
       else if upc.isPrimeCoat == true && upcChoiceRC.BCoatSelection != upcChoiceRC.PCoatSelection { // prime coat w/o top coat, unique values
            BCoatSwitch()
            PCoatSwitch()
       }
       else if upc.isPrimeCoat == true && upcChoiceRC.BCoatSelection == upcChoiceRC.PCoatSelection { // prime coat w/o top coat, non-unique values
            BCoatSwitch()
       }
       else if upc.isPrimeCoat == false && upc.isTopCoat == true && (upcChoiceRC.BCoatSelection != upcChoiceRC.TCoatSelection) { // top coat w/o prime coat, unique values
            BCoatSwitch()
            TCoatSwitch() 
       }
       else if upc.isPrimeCoat == false && upc.isTopCoat == true && (upcChoiceRC.BCoatSelection == upcChoiceRC.TCoatSelection) { // top coat w/o prime coat, non-unique values
            TCoatSwitch()
       }
        
    }
}

struct SysSummaryConc_Previews: PreviewProvider {
    static var previews: some View {
        SysSummaryConc()
    }
}
