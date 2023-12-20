//
//  ChipTSView.swift
//  Calculator
//
//  Created by Kane Davidson on 9/8/21.
//

import SwiftUI

struct IndustrialSandDBRCView: View {
    
    var body: some View {
        
        let chip = ChipOptions()
        let SandDBRC = ColorQuartzTSValues()
        let BroadcastSandDBRC = statsBroadcast(product: "Color Quartz", covRate: 0.25, MixRat: 50)
        let TSColorant_DBRC = stats(product: "Top Shelf® Epoxy Colorant:", covRate: 450, MixRat: 16)
        let sf = SquareFeet()
        
        
            ScrollView {
                VStack {
                    SFFormChip()
                    ThicknessSandDBTS()
                    SysOptionsSand()
                  //  UPC_Colorant_()
                  //    .padding()
                    CoatChoicesSandDBRC()
                }.navigationBarTitle("Industrial Sand DB RC, 3/16\"", displayMode: .inline)
            }
            .environmentObject(chip)
            .environmentObject(BroadcastSandDBRC)
            .environmentObject(TSColorant_DBRC)
            .environmentObject(sf)
            .environmentObject(SandDBRC)
        }
    }


struct IndustrialSandDBRCView_Previews: PreviewProvider {
    static var previews: some View {
        ChipTSView()
    }
}
