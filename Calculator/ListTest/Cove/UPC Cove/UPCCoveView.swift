//
//  ChipTSView.swift
//  Calculator
//
//  Created by Kane Davidson on 9/8/21.
//

import SwiftUI

struct UPCCoveView: View {
    
    var bCoatCoveUPCA = stats2(product: "Top Shelf Epoxy Part A", covRate: 30, MixRat: 1)
    var bCoatCoveUPCB = stats2(product: "Top Shelf Epoxy Part A", covRate: 30, MixRat: 0.5)
    var bCoatCoveUPCColorant = stats2(product: "Top Shelf Epoxy Part A", covRate: 30, MixRat: 16)
    var bCoatCoveTexture = stats2(product: "Texture", covRate: 60, MixRat: 1)
    
    var body: some View {
        
//        let chip = ChipOptions()
        let EpoxyCove = EpoxyCoveSelections()
//        let Broadcast = statsBroadcast(product: "Color Chip", covRate: 0.1, MixRat: 55)
   //     var TSColorantC2 = stats(product: "Top Shelf® Epoxy Colorant:", covRate: 400, MixRat: 16)
        let sf = SquareFeet()
        
            ScrollView {
                VStack {
                    SFFormCSplash()
                    ThicknessUPCCove()

                    CoatChoicesUPCCove()
                }.navigationBarTitle("UPC Cove, 4-6\"", displayMode: .inline)
            }
            .environmentObject(bCoatCoveUPCA)
            .environmentObject(bCoatCoveUPCB)
            .environmentObject(bCoatCoveUPCColorant)
            .environmentObject(bCoatCoveTexture)
            .environmentObject(sf)
            .environmentObject(EpoxyCove)
        }
    }


struct UPCCoveView_Previews: PreviewProvider {
    static var previews: some View {
        ChipTSView()
    }
}
