//
//  ChipTSView.swift
//  Calculator
//
//  Created by Kane Davidson on 9/8/21.
//

import SwiftUI

struct IndustrialSandSLView: View {
    
    var body: some View {
        
        let chip = ChipOptions()
        let SandSL = ColorQuartzTSValues()
        let BroadcastSandSL = statsBroadcast(product: "Color Quartz", covRate: 1, MixRat: 50)
        let TSColorant_SL = stats(product: "Top Shelf® Epoxy Colorant:", covRate: 450, MixRat: 16)
        let sf = SquareFeet()
        
        
            ScrollView {
                VStack {
                    SFFormChip()
                    ThicknessSandSL()
                    SysOptionsSand()
                  //  UPC_Colorant_()
                  //    .padding()
                    CoatChoicesSandSL()
                }.navigationBarTitle("Industrial Sand SL, 3/16\"-1/4\"", displayMode: .inline)
            }
            .environmentObject(chip)
            .environmentObject(BroadcastSandSL)
            .environmentObject(TSColorant_SL)
            .environmentObject(sf)
            .environmentObject(SandSL)
        }
    }


struct IndustrialSandSLView_Previews: PreviewProvider {
    static var previews: some View {
        ChipTSView()
    }
}
