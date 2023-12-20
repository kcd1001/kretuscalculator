//
//  UPCCoat.swift
//  ListTest
//
//  Created by Kane Davidson on 10/21/20.

import SwiftUI
import Combine

struct UPCRC: View {
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
                Coat_Choices()
            }
            
            .navigationBarTitle("UPC RC (roll coat), 10-30 mils", displayMode: .inline)
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

struct UPCRC_Previews: PreviewProvider {

    static var previews: some View {
        UPCRC()

    }
}
