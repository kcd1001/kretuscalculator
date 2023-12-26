//
//  ChipTSView.swift
//  Calculator
//
//  Created by Kane Davidson on 9/8/21.
//

import SwiftUI

struct QuartzTSView: View {
    
    var body: some View {
        

        
        let chip = ChipOptions()
        let QuartzTS = ColorQuartzTSValues()
        let BroadcastQuartzTS = statsBroadcast(product: "Color Quartz", covRate: 0.25, MixRat: 50)
        let TSColorant_TS = stats(product: "Top Shelf® Epoxy Colorant:", covRate: 450, MixRat: 16)
        let sf = SquareFeet()
        
            ScrollView {
                VStack {
                    SFFormChip()
                    ThicknessQuartzTS()
                    SysOptionsColorQuartz()
                  //  UPC_Colorant_()
                  //    .padding()
                    CoatChoicesQuartzTS()
                }.navigationBarTitle("Color Quartz TS, 1/8\"", displayMode: .inline)
            }
            .environmentObject(chip)
            .environmentObject(BroadcastQuartzTS)
            .environmentObject(TSColorant_TS)
            .environmentObject(sf)
            .environmentObject(QuartzTS)
        }
    }


struct QuartzTSView_Previews: PreviewProvider {
    static var previews: some View {
        ChipTSView()
    }
}
