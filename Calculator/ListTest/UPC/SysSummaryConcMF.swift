//
//  SysSummaryConc.swift
//  Calculator
//
//  Created by Kane Davidson on 2/2/21.
//

import SwiftUI

struct SysSummaryConcMF: View {
    @EnvironmentObject var upcChoice : sysChoices //Used for coat selections
    @EnvironmentObject var upc : options //Used for coat checkboxes
    @EnvironmentObject var colorant : Colorant //colorant selection
    
    var body: some View {
        if upc.isPrimeCoat == true && upc.isTopCoat == true && ((upcChoice.PCoatSelection != upcChoice.TCoatSelection)) { //Completely unique values
            BCoatSwitchMF()
            PCoatSwitchMF()
            TCoatSwitchMF()
        }

       else if upc.isPrimeCoat == true && upc.isTopCoat == true && (upcChoice.PCoatSelection == upcChoice.TCoatSelection) && (upcChoice.BCoatSelection != upcChoice.TCoatSelection) {  // Prime coat and top coat are the same
            BCoatSwitchMF()
            TCoatSwitchMF()
        }
       else if upc.isPrimeCoat == true && upc.isTopCoat == true && (upcChoice.BCoatSelection == upcChoice.PCoatSelection) && (upcChoice.BCoatSelection == upcChoice.TCoatSelection) { //All coats are the same
            BCoatSwitchMF()
            TCoatSwitchMF()
        }
       else if upc.isPrimeCoat == false && upc.isTopCoat == false { //only base coat selected
            BCoatSwitchMF()
       }
       else if upc.isPrimeCoat == true && upcChoice.BCoatSelection != upcChoice.PCoatSelection { // prime coat w/o top coat, unique values
            BCoatSwitchMF()
            PCoatSwitchMF()
       }
       else if upc.isPrimeCoat == true && upcChoice.BCoatSelection == upcChoice.PCoatSelection { // prime coat w/o top coat, non-unique values
            BCoatSwitchMF()
            PCoatSwitchMF()
       }
       else if upc.isPrimeCoat == false && upc.isTopCoat == true && (upcChoice.BCoatSelection != upcChoice.TCoatSelection) { // top coat w/o prime coat, unique values
            BCoatSwitchMF()
            TCoatSwitchMF()
       }
       else if upc.isPrimeCoat == false && upc.isTopCoat == true && (upcChoice.BCoatSelection == upcChoice.TCoatSelection) { // top coat w/o prime coat, non-unique values
            BCoatSwitchMF()
            TCoatSwitchMF()
       }
        
    }
}

struct SysSummaryConcMF_Previews: PreviewProvider {
    static var previews: some View {
        SysSummaryConc()
    }
}
