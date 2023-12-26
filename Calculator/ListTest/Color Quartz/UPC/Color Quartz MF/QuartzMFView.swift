//
//  ChipTSView.swift
//  Calculator
//
//  Created by Kane Davidson on 9/8/21.
//

import SwiftUI

struct QuartzMFView: View {
    
    var body: some View {
        
        let SandRC = ColorQuartzTSValues() //Used for coat selections
        let chip = ChipOptions()
        let QuartzMF = ColorQuartzRCValues()
        let BroadcastQuartzMF = statsBroadcast(product: "Color Quartz", covRate: 1, MixRat: 50)
//        let TSColorant_TS = stats(product: "Top Shelf® Epoxy Colorant:", covRate: 450, MixRat: 16)
        let sf = SquareFeet()
        
        
            ScrollView {
                VStack {
                    SFFormChip()
                    ThicknessQuartzMF()
                    SysOptionsColorQuartz()
                  //  UPC_Colorant_()
                  //    .padding()
                    CoatChoicesQuartzMF()
                }.navigationBarTitle("Color Quartz SL, 3/16\" - 1/4\"", displayMode: .inline)
            }
            .environmentObject(chip)
            .environmentObject(BroadcastQuartzMF)
//            .environmentObject(TSColorant_TS)
            .environmentObject(sf)
            .environmentObject(QuartzMF)
            .environmentObject(SandRC)
        }
    }


struct QuartzMFView_Previews: PreviewProvider {
    static var previews: some View {
        ChipTSView()
    }
}
