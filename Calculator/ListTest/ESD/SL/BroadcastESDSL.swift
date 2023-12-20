//
//  BroadcastGarage.swift
//  Calculator
//
//  Created by Kane Davidson on 5/19/21.
//

import SwiftUI
import Combine



struct BroadcastESDSLView: View {
    
    @EnvironmentObject var ESDSL : ColorQuartzTSValues //Used for coat selections
    @EnvironmentObject var sf : SquareFeet //Square feet
//    var BroadcastQuartzTS = stats(product: "Color Chip:", covRate: 0.15, MixRat: 55)
    @EnvironmentObject var TSA_QuartzTS : stats //Used for system stats (mixRat,CovRate, etc)
    @EnvironmentObject var TSB_QuartzTS : stats //Used for system stats (mixRat,CovRate, etc)
    
    @EnvironmentObject var TSABC_ESDSL : stats
    @EnvironmentObject var TSBBC_ESDSL : stats
    @EnvironmentObject var TSColorantBC_ESDSL : stats

    @EnvironmentObject var TSColorant : stats //Used for system stats (mixRat,CovRate, etc)
    @EnvironmentObject var BroadcastESDSL : statsBroadcast
    
    @EnvironmentObject var ESDSL_TSAC3 : stats2
    @EnvironmentObject var ESDSL_TSBC3 : stats2
    @EnvironmentObject var ESDSL_TSColorantC3 : stats2
    
    func quantBroadcast(product : statsBroadcast) -> Int {
        let quantity : Float = (sf.squareF * product.covRate)
         let kit = Int(ceil(Float(quantity / product.MixRat)))
         return kit
        } // returns number of kits required for BroadcastQuartzTS

    var body: some View {
        VStack {

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
                    Text("Kretus® Approved #30/F-Grade Industrial Sand/Quartz")
                        .font(.caption)
                    Spacer()
                    Text("\(quantBroadcast(product: BroadcastESDSL))")
                        .font(.caption)
                }
        }
            .background(Color(red:239.0/255.0, green: 243.0/255.0, blue: 244.0/250, opacity: 1.0))
            .cornerRadius(5.0)
            .padding()
            HStack {
                Text("Add Waste Factor: ")
                Spacer()
                TextField("",value: $ESDSL.BroadcastWaste, formatter: NumberFormatter())
                    .frame(width:30, height:25)
                    .background(Color(red:239.0/255.0, green: 243.0/255.0, blue: 244.0/250, opacity: 1.0))
                    .cornerRadius(5.0)
                Text("box(es)")
            }
            .padding()
            HStack {
                Text("Total:")
                Spacer()
                Text("\(quantBroadcast(product: BroadcastESDSL) + ESDSL.BroadcastWaste) bag(s)")
            }
            .padding()
        }
    }


struct BroadcastESDSLView_Previews: PreviewProvider {
    static var previews: some View {
        BroadcastGarage()
    }
}
}
