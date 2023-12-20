//
//  UPCTT.swift
//  Calculator
//
//  Created by Kane Davidson on 3/12/21.
//

import SwiftUI

struct UPCTT: View {
    
    var upc = options()
    var upcChoice = sysChoices()
    var UPCATT = stats(product: "Urethane Polymer Concrete Part A:", covRate: 24, MixRat: 6)
    var UPCBTT = stats(product: "Urethane Polymer Concrete Part B:", covRate: 24, MixRat: 6)
    var UPCCTT = stats(product: "Urethane Polymer Concrete Part C:", covRate: 24, MixRat: 42)
    var sf = SquareFeet()
    var colorant = Colorant()
    
    var body: some View {
        ScrollView {
            VStack {
                SF_Form()
                SysOptions()
                UPC_Colorant_()
                    .padding()
                Coat_ChoicesTT()
            }.navigationBarTitle("UPC TT (trowel applied), 1/4-4 in.", displayMode: .inline)
            
            .environmentObject(upc)
            .environmentObject(UPCATT)
            .environmentObject(UPCBTT)
            .environmentObject(UPCCTT)
            .environmentObject(sf)
            .environmentObject(colorant)
            .environmentObject(upcChoice)
        }
    }
}

struct UPCTT_Previews: PreviewProvider {
    static var previews: some View {
        UPCTT()
    }
}
