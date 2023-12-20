//
//  SandPCoatDBTSSum.swift
//  Calculator
//
//  Created by Kane Davidson on 11/3/22.
//

import SwiftUI

struct SandBroadcast1DBTSSum: View {
    
    @EnvironmentObject var SandDBTS : ColorQuartzTSValues //Used for coat selections
    @EnvironmentObject var sf : SquareFeet //Square feet
    var BroadcastSandDBTS = statsBroadcast(product: "Color Quartz", covRate: 0.25, MixRat: 50)

    
    var ChipSizes = ["20 Mesh", "30 Mesh", "60 Mesh"]
    
    func quantBroadcast(product : statsBroadcast) -> Int {
        let quantity : Float = (sf.squareF * product.covRate)
        let kit = Int(ceil(Float(quantity / product.MixRat)))
        return kit
    } // returns number of kits required for BroadcastQuartzTS
    
    
    var body: some View {
        Text("Broadcast 1")
            .bold()
        VStack { // Start of coat summary
            HStack {
                Text("PRODUCT CODE")
                    .underline()
                    .font(.caption)
                Spacer()
                Text("PRODUCT")
                    .underline()
                    .font(.caption)
                Spacer()
                Text("QUANTITY")
                    .underline()
                    .font(.caption)
            }
            HStack {
                Text("Contact Distributor")
                    .font(.caption)
                Spacer()
                Text("Kretus® Approved \(ChipSizes[SandDBTS.BroadcastSizeSelection]) Industrial Sand")
                    .font(.caption)
                Spacer()
                Text("\(quantBroadcast(product: BroadcastSandDBTS) + SandDBTS.BroadcastWaste)")
                    .font(.caption)
            }
        }
        .background(Color(red:239.0/255.0, green: 243.0/255.0, blue: 244.0/250, opacity: 1.0))
        .cornerRadius(5.0)
        .padding()
    }
}

struct SandBroadcast1DBTSSum_Previews: PreviewProvider {
    static var previews: some View {
        SandBCoatDBTSSum()
    }
}
