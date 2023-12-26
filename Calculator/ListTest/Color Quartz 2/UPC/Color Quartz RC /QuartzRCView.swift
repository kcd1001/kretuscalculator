//
//  ChipTSView.swift
//  Calculator
//
//  Created by Kane Davidson on 9/8/21.
//

import SwiftUI

struct QuartzRCView: View {
    
    
    var body: some View {
        
        let SandRC = ColorQuartzTSValues() //Used for coat selections
        let chip = ChipOptions()
        let QuartzRC = ColorQuartzRCValues()
        let BroadcastQuartzRC = statsBroadcast(product: "Color Quartz", covRate: 1, MixRat: 50)
        let TSColorant_TS = stats(product: "Top Shelf® Epoxy Colorant:", covRate: 450, MixRat: 16)
        let sf = SquareFeet()
        
            ScrollView {
                VStack {
                    SFFormChip()
                    ThicknessQuartzTS()
                    SysOptionsColorQuartz()
                  //  UPC_Colorant_()
                  //    .padding()
                    CoatChoicesQuartzRC()
                }.navigationBarTitle("Color Quartz RC, 1/8\"", displayMode: .inline)
            }
            .environmentObject(chip)
            .environmentObject(BroadcastQuartzRC)
            .environmentObject(TSColorant_TS)
            .environmentObject(sf)
            .environmentObject(QuartzRC)
            .environmentObject(SandRC)
        }
    }


struct QuartzRCView_Previews: PreviewProvider {
    static var previews: some View {
        ChipTSView()
    }
}
