//
//  ChipTSView.swift
//  Calculator
//
//  Created by Kane Davidson on 9/8/21.
//

import SwiftUI

struct IndustrialSandSGView: View {
    
    var body: some View {
        
        let chip = ChipOptions()
        let SandSG = ColorQuartzTSValues()
        let BroadcastSandSG = statsBroadcast(product: "Color Quartz", covRate: 1, MixRat: 50)
        let TSColorant_SG = stats(product: "Top Shelf® Epoxy Colorant:", covRate: 450, MixRat: 16)
        let sf = SquareFeet()
        
        
            ScrollView {
                VStack {
                    SFFormChip()
                    ThicknessSandSG()
                    SysOptionsSand()
                  //  UPC_Colorant_()
                  //    .padding()
                    CoatChoicesSandSG()
                }.navigationBarTitle("Industrial Sand SG, 3/16\"-1/4\"", displayMode: .inline)
            }
            .environmentObject(chip)
            .environmentObject(BroadcastSandSG)
            .environmentObject(TSColorant_SG)
            .environmentObject(sf)
            .environmentObject(SandSG)
        }
    }


struct IndustrialSandSGView_Previews: PreviewProvider {
    static var previews: some View {
        ChipTSView()
    }
}
