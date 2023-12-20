//
//  ChipGarage.swift
//  Calculator
//
//  Created by Kane Davidson on 5/18/21.
//

import SwiftUI
import Combine

struct ChipGarageView: View {
    
//    CANT HAVE MULTIPLE ENV. OBJECTS OF SAME TYPE. TRY TO CREATE THEM IN SEPARATE VIEWS. TS PRODUCTS IN BCOATGARAGE, BROADCAST IN BROADCASTGARAGE VIEW ? 
    
    var chip = ChipOptions()
    var ChipGarage = ColorChipValues()
    var Broadcast = statsBroadcast(product: "Color Chip", covRate: 0.15, MixRat: 55)
    var TSColorant = stats(product: "Top Shelf® Epoxy Colorant:", covRate: 150, MixRat: 16)
    var sf = SquareFeet()
    
    
    var body: some View {
        ScrollView {
            VStack {
                SFFormChip()
                ThicknessGarage()
                SysOptionsChip()
              //  UPC_Colorant_()
              //    .padding()
                CoatChoicesGarage()
            }.navigationBarTitle("Color Chip Garage, 24 mils", displayMode: .inline)
        }
        .environmentObject(chip)
        .environmentObject(Broadcast)
        .environmentObject(TSColorant)
        .environmentObject(sf)
        .environmentObject(ChipGarage)
    }
}

struct ChipGarage_Previews: PreviewProvider {
    static var previews: some View {
        ChipGarageView()
    }
}
