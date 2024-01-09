//
//  ChipTSView.swift
//  Calculator
//
//  Created by Kane Davidson on 9/8/21.
//

import SwiftUI

struct QuartzTTView: View {
    
    var body: some View {
        
        let SandRC = ColorQuartzTSValues() //Used for coat selections
        let chip = ChipOptions()
        let QuartzTT = ColorQuartzRCValues()
        let BroadcastQuartzTT = statsBroadcast(product: "Color Quartz", covRate: 1, MixRat: 50)
//        let TSColorant_TS = stats(product: "Top Shelf® Epoxy Colorant:", covRate: 450, MixRat: 16)
        let sf = SquareFeet()
        
        
            ScrollView {
                VStack {
                    SFFormChip()
                    ThicknessQuartzTT()
                    SysOptionsColorQuartz()
                  //  UPC_Colorant_()
                  //    .padding()
                    CoatChoicesQuartzTT()
                }.navigationBarTitle("Color Quartz TT, 1/4\" - 3/8\"", displayMode: .inline)
            }
            .environmentObject(chip)
            .environmentObject(BroadcastQuartzTT)
//            .environmentObject(TSColorant_TS)
            .environmentObject(sf)
            .environmentObject(QuartzTT)
            .environmentObject(SandRC)
        }
    }


struct QuartzTTView_Previews: PreviewProvider {
    static var previews: some View {
        ChipTSView()
    }
}
