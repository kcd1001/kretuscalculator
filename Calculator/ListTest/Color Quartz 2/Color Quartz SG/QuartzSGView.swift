//
//  ChipTSView.swift
//  Calculator
//
//  Created by Kane Davidson on 9/8/21.
//

import SwiftUI

struct QuartzSGView: View {
    

    
    var body: some View {
        
        let chip = ChipOptions()
        let QuartzSG = ColorQuartzSGValues()
        let QuartzTS = ColorQuartzTSValues()
        let BroadcastQuartzSG = statsBroadcast(product: "Color Quartz", covRate: 1, MixRat: 50)
        let TSColorant_SG = stats(product: "Top Shelf® Epoxy Colorant:", covRate: 450, MixRat: 16)
        let sf = SquareFeet()
        
            ScrollView {
                VStack {
                    SFFormChip()
                    ThicknessQuartzSG()
                    SysOptionsColorQuartz()
                  //  UPC_Colorant_()
                  //    .padding()
                    CoatChoicesQuartzSG()
                }.navigationBarTitle("Color Quartz SG, 3/16\"-1/4\"", displayMode: .inline)
            }
            .environmentObject(chip)
            .environmentObject(BroadcastQuartzSG)
            .environmentObject(TSColorant_SG)
            .environmentObject(sf)
            .environmentObject(QuartzSG)
            .environmentObject(QuartzTS)
        }
    }


struct QuartzSGView_Previews: PreviewProvider {
    static var previews: some View {
        ChipTSView()
    }
}
