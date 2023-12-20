//
//  ChipTSView.swift
//  Calculator
//
//  Created by Kane Davidson on 9/8/21.
//

import SwiftUI

struct MetallicUVView: View {
    
    var bCoatMetallicUVTSA = stats2(product: "Top Shelf Epoxy Part A", covRate: 120, MixRat: 1)
    var bCoatMetallicUVTSB = stats2(product: "Top Shelf Epoxy Part A", covRate: 120, MixRat: 0.5)
    var bCoatMetallicUVPigment = stats2(product: "Top Shelf Epoxy Part A", covRate: 120, MixRat: 16)
    
    var body: some View {
        
//        let chip = ChipOptions()
        let tsMetallicUV = EpoxyCoveSelections()
//        let Broadcast = statsBroadcast(product: "Color Chip", covRate: 0.1, MixRat: 55)
   //     var TSColorantC2 = stats(product: "Top Shelf® Epoxy Colorant:", covRate: 400, MixRat: 16)
        let sf = SquareFeet()
        
            ScrollView {
                VStack {
                    SFFormCSplash()
                    ThicknessTSMetallic()

                    CoatChoicesTSMetallicUV()
                }.navigationBarTitle("Top Shelf® Metallic UV", displayMode: .inline)
            }
            .environmentObject(bCoatMetallicUVTSA)
            .environmentObject(bCoatMetallicUVTSB)
            .environmentObject(bCoatMetallicUVPigment)
            .environmentObject(sf)
            .environmentObject(tsMetallicUV)
        }
    }


struct MetallicUVView_Previews: PreviewProvider {
    static var previews: some View {
        ChipTSView()
    }
}
