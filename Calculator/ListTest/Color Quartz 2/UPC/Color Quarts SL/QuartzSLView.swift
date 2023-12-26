//
//  ChipTSView.swift
//  Calculator
//
//  Created by Kane Davidson on 9/8/21.
//

import SwiftUI

struct QuartzSLView: View {
    
    var body: some View {
        
        let SandRC = ColorQuartzTSValues() //Used for coat selections
        let chip = ChipOptions()
        let QuartzSL = ColorQuartzRCValues()
        let BroadcastQuartzSL = statsBroadcast(product: "Color Quartz", covRate: 1, MixRat: 50)
//        let TSColorant_TS = stats(product: "Top Shelf® Epoxy Colorant:", covRate: 450, MixRat: 16)
        let sf = SquareFeet()
        
        
            ScrollView {
                VStack {
                    SFFormChip()
                    ThicknessQuartzSL()
                    SysOptionsColorQuartz()
                  //  UPC_Colorant_()
                  //    .padding()
                    CoatChoicesQuartzSL()
                }.navigationBarTitle("Color Quartz SL, 3/16\" - 1/4\"", displayMode: .inline)
            }
            .environmentObject(chip)
            .environmentObject(BroadcastQuartzSL)
//            .environmentObject(TSColorant_TS)
            .environmentObject(sf)
            .environmentObject(QuartzSL)
            .environmentObject(SandRC)
        }
    }


struct QuartzSLView_Previews: PreviewProvider {
    static var previews: some View {
        ChipTSView()
    }
}
