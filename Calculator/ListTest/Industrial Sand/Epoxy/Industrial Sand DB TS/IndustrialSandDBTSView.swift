//
//  ChipTSView.swift
//  Calculator
//
//  Created by Kane Davidson on 9/8/21.
//

import SwiftUI

struct IndustrialSandDBTSView: View {
    
    var body: some View {
        
        let chip = ChipOptions()
        let SandDBTS = ColorQuartzTSValues()
        let BroadcastSandDBTS = statsBroadcast(product: "Color Quartz", covRate: 0.25, MixRat: 50)
        let TSColorant_DBTS = stats(product: "Top Shelf® Epoxy Colorant:", covRate: 450, MixRat: 16)
        let sf = SquareFeet()
        
        
            ScrollView {
                VStack {
                    SFFormChip()
                    ThicknessSandDBTS()
                    SysOptionsSand()
                  //  UPC_Colorant_()
                  //    .padding()
                    CoatChoicesSandDBTS()
                }.navigationBarTitle("Industrial Sand DB TS, 3/16\"", displayMode: .inline)
            }
            .environmentObject(chip)
            .environmentObject(BroadcastSandDBTS)
            .environmentObject(TSColorant_DBTS)
            .environmentObject(sf)
            .environmentObject(SandDBTS)
        }
    }


struct IndustrialSandDBTSView_Previews: PreviewProvider {
    static var previews: some View {
        ChipTSView()
    }
}
