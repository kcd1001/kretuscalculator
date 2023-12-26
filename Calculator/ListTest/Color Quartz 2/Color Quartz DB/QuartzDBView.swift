//
//  ChipTSView.swift
//  Calculator
//
//  Created by Kane Davidson on 9/8/21.
//

import SwiftUI

struct QuartzDBView: View {
    
    var body: some View {
        
        let chip = ChipOptions()
        let QuartzDB = ColorQuartzDBValues()
        let QuartzTS = ColorQuartzTSValues()
        let BroadcastQuartzTS = statsBroadcast(product: "Color Quartz", covRate: 0.25, MixRat: 50)
        let TSColorant_DB = stats(product: "Top Shelf® Epoxy Colorant:", covRate: 450, MixRat: 16)
        let sf = SquareFeet()
        
            ScrollView {
                VStack {
                    SFFormChip()
                    ThicknessQuartzDB()
                    SysOptionsColorQuartz()
                  //  UPC_Colorant_()
                  //    .padding()
                    CoatChoicesQuartzDB()
                }.navigationBarTitle("Color Quartz DB, 3/16\"", displayMode: .inline)
            }
            .environmentObject(chip)
            .environmentObject(BroadcastQuartzTS)
            .environmentObject(TSColorant_DB)
            .environmentObject(sf)
            .environmentObject(QuartzDB)
            .environmentObject(QuartzTS)
        }
    }


struct QuartzDBView_Previews: PreviewProvider {
    static var previews: some View {
        ChipTSView()
    }
}
