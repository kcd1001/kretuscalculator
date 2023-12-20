//
//  UPCSL.swift
//  Calculator
//
//  Created by Kane Davidson on 3/12/21.
//

import SwiftUI

struct UPCSL: View {
    
    var upc = options()
    var upcChoice = sysChoices()
    var UPCASL = stats(product: "Urethane Polymer Concrete Part A:", covRate: 50, MixRat: 8)
    var UPCBSL = stats(product: "Urethane Polymer Concrete Part B:", covRate: 50, MixRat: 8)
    var UPCCSL = stats(product: "Urethane Polymer Concrete Part C:", covRate: 50, MixRat: 25)
    var sf = SquareFeet()
    var colorant = Colorant()
    
    var body: some View {
        ScrollView {
            VStack {
                SF_Form()
                SysOptions()
                UPC_Colorant_()
                    .padding()
                Coat_ChoicesSL()
            }.navigationBarTitle("UPC SL (Self-Leveler), 1/8\"-1/4\"", displayMode: .inline)
        }
        .environmentObject(upc)
        .environmentObject(UPCASL)
        .environmentObject(UPCBSL)
        .environmentObject(UPCCSL)
        .environmentObject(sf)
        .environmentObject(colorant)
        .environmentObject(upcChoice)
    }
}

struct UPCSL_Previews: PreviewProvider {
    static var previews: some View {
        UPCSL()
    }
}
