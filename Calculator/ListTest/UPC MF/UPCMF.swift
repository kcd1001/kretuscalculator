//
//  UPCMF.swift
//  Calculator
//
//  Created by Kane Davidson on 3/12/21.
//

import SwiftUI

struct UPCMF: View {
    var upc = options()
    var upcChoice = sysChoices()
    var UPCAMF = stats(product: "Urethane Polymer Concrete Part A:", covRate: 60, MixRat: 8)
    var UPCBMF = stats(product: "Urethane Polymer Concrete Part B:", covRate: 60, MixRat: 8)
    var UPCCMF = stats(product: "Urethane Polymer Concrete Part C:", covRate: 60, MixRat: 40)
    var sf = SquareFeet()
    var colorant = Colorant()
    
    var body: some View {
        ScrollView {
            VStack {
                SF_Form()
                SysOptions()
                UPC_Colorant_()
                    .padding()
                Coat_ChoicesMF()
            }.navigationBarTitle("UPC MF (Medium-Fill, Self-leveler), 1/8-1/4 in.", displayMode: .inline)
        }
        .environmentObject(upc)
        .environmentObject(UPCAMF)
        .environmentObject(UPCBMF)
        .environmentObject(UPCCMF)
        .environmentObject(sf)
        .environmentObject(colorant)
        .environmentObject(upcChoice)
        .environmentObject(UPC_TC)
    }
}

struct UPCMF_Previews: PreviewProvider {
    static var previews: some View {
        UPCMF()
    }
}
