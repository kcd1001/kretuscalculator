//
//  ChipTSView.swift
//  Calculator
//
//  Created by Kane Davidson on 9/8/21.
//

import SwiftUI

struct IndustrialSandTGView: View {
    
    var body: some View {
        
        let chip = ChipOptions()
        let SandTG = ColorQuartzTSValues()
        let BroadcastSandTG = statsBroadcast(product: "Color Quartz", covRate: 1, MixRat: 50)
        let TSColorant_TG = stats(product: "Top Shelf® Epoxy Colorant:", covRate: 450, MixRat: 16)
        let sf = SquareFeet()
        
        
            ScrollView {
                VStack {
                    SFFormChip()
                    ThicknessSandTG()
                    SysOptionsSand()
                  //  UPC_Colorant_()
                  //    .padding()
                    CoatChoicesSandTG()
                }.navigationBarTitle("Industrial Sand TG, 1/4\"-3/8\"", displayMode: .inline)
            }
            .environmentObject(chip)
            .environmentObject(BroadcastSandTG)
            .environmentObject(TSColorant_TG)
            .environmentObject(sf)
            .environmentObject(SandTG)
        }
    }


struct IndustrialSandTGView_Previews: PreviewProvider {
    static var previews: some View {
        ChipTSView()
    }
}
