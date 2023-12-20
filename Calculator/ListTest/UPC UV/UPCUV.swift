//
//  UPCUV.swift
//  Calculator
//
//  Created by Kane Davidson on 4/20/21.
//

import SwiftUI

struct UPCUV: View {
    
    var upc = options()
    var upcChoiceRC = sysChoices()
    var UPCA = stats(product: "Urethane Polymer Concrete Part A:", covRate: 190, MixRat: 6)
    var UPCB = stats(product: "Urethane Polymer Concrete Part B:", covRate: 190, MixRat: 6)
    var UPCC = stats(product: "Urethane Polymer Concrete Part C:", covRate: 190, MixRat: 6)
    var sf = SquareFeet()
    var colorant = Colorant()

    var body: some View {
        ScrollView {
            VStack {
                SF_Form()
                SysOptionsRC()
                UPC_Colorant_()
                    .padding()
                Coat_ChoicesUV()
            }
            
            .navigationBarTitle("UPC UV (UV-Resistance), 10-30 mils", displayMode: .inline)
        }
        .environmentObject(upc)
        .environmentObject(upcChoiceRC)
        .environmentObject(UPCA)
        .environmentObject(UPCB)
        .environmentObject(UPCC)
        .environmentObject(sf)
        .environmentObject(colorant)
        }
}

struct UPCUV_Previews: PreviewProvider {
    static var previews: some View {
        UPCUV()
    }
}
