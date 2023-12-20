//
//  SysSummaryConc.swift
//  Calculator
//
//  Created by Kane Davidson on 2/2/21.
//

import SwiftUI

struct SysSummaryConcTT: View {
    @EnvironmentObject var upcChoice : sysChoices //Used for coat selections
    @EnvironmentObject var upc : options //Used for coat checkboxes
    @EnvironmentObject var colorant : Colorant //colorant selection
    
    var body: some View {
        if upc.isPrimeCoat == true && upc.isTopCoat == true && ((upcChoice.BCoatSelection != upcChoice.PCoatSelection) && (upcChoice.PCoatSelection != upcChoice.TCoatSelection)) && (upcChoice.BCoatSelection != upcChoice.TCoatSelection) { //Completely unique values
            BCoatSwitchTT()
            PCoatSwitchTT()
            TCoatSwitchTT()
        }
       else if upc.isPrimeCoat == true && upc.isTopCoat == true && (upcChoice.BCoatSelection == upcChoice.PCoatSelection) && (upcChoice.BCoatSelection != upcChoice.TCoatSelection) { // Base coat and prime coat are the same
            BCoatSwitchTT()
            TCoatSwitchTT()
        }
       else if upc.isPrimeCoat == true && upc.isTopCoat == true && (upcChoice.BCoatSelection == upcChoice.TCoatSelection) && (upcChoice.BCoatSelection != upcChoice.PCoatSelection) {  // Base coat and top coat are the same
            PCoatSwitchTT()
            TCoatSwitchTT()
        }
       else if upc.isPrimeCoat == true && upc.isTopCoat == true && (upcChoice.PCoatSelection == upcChoice.TCoatSelection) && (upcChoice.BCoatSelection != upcChoice.TCoatSelection) {  // Prime coat and top coat are the same
            BCoatSwitchTT()
            TCoatSwitchTT()
        }
       else if upc.isPrimeCoat == true && upc.isTopCoat == true && (upcChoice.BCoatSelection == upcChoice.PCoatSelection) && (upcChoice.BCoatSelection == upcChoice.TCoatSelection) { //All coats are the same
            BCoatSwitchTT()
        }
       else if upc.isPrimeCoat == false && upc.isTopCoat == false { //only base coat selected
            BCoatSwitchTT()
       }
       else if upc.isPrimeCoat == true && upcChoice.BCoatSelection != upcChoice.PCoatSelection { // prime coat w/o top coat, unique values
            BCoatSwitchTT()
            PCoatSwitchTT()
       }
       else if upc.isPrimeCoat == true && upcChoice.BCoatSelection == upcChoice.PCoatSelection { // prime coat w/o top coat, non-unique values
            BCoatSwitchTT()
       }
       else if upc.isPrimeCoat == false && upc.isTopCoat == true && (upcChoice.BCoatSelection != upcChoice.TCoatSelection) { // top coat w/o prime coat, unique values
            BCoatSwitchTT()
            TCoatSwitchTT()
       }
       else if upc.isPrimeCoat == false && upc.isTopCoat == true && (upcChoice.BCoatSelection == upcChoice.TCoatSelection) { // top coat w/o prime coat, non-unique values
            TCoatSwitchTT()
       }
        
    }
}

struct SysSummaryConcTT_Previews: PreviewProvider {
    static var previews: some View {
        SysSummaryConc()
    }
}
