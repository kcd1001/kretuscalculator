//
//  SysSummary.swift
//  Calculator
//
//  Created by Kane Davidson on 1/22/21.
//



import SwiftUI

struct SysSummaryPA: View {
    
    
    @EnvironmentObject var ChipPA: ColorChipValuesPA //Used for coat selections
    @EnvironmentObject var Chip : ChipOptions //Used for checkbox options
    @EnvironmentObject var sf : SquareFeet //Square feet
    @EnvironmentObject var Broadcast : statsBroadcast
    
    var ChipSizes = ["1/4\"", "1/8\""]
    
    var ChipChoices = ["Anaheim Gray", "Antler", "Avery", "Bow Tie", "Charcoal", "Coyote", "Domino", "Fog Gray", "Granite", "Gravel", "Keaton", "Lasorda Blue", "Lighthouse", "Monterey Spice", "Onyx Pearl", "Orbit", "Outback", "Pintail", "Saddle Tan", "Shorline", "Sienna", "Smoke", "Swan", "Terrier" , "Thistle", "Twilight"]
    

    
    func quantBroadcast(product : statsBroadcast) -> Int {
        let quantity : Float = (sf.squareF * product.covRate)
         let kit = Int(ceil(Float(quantity / product.MixRat)))
         return kit
        } // returns number of kits required for broadcast
   
    var body: some View {
        VStack {
            SysSummaryPCBCPA()
            VStack {
            Text("Broadcast")
                .bold()
            HStack {
/*
                Text("PRODUCT CODE")
                    .underline()
                    .font(.caption)
                Spacer()
*/
                Text("PRODUCT")
                    .underline()
                    .font(.caption)
                Spacer()
                Text("QUANTITY")
                    .underline()
                    .font(.caption)
            }
            HStack { // Broadcast
/*
                Text("Contact Distributor")
                    .font(.caption)
                Spacer()
 */
                Text("Color Chip \(ChipSizes[ChipPA.BroadcastSizeSelection]) - see Kretus Color Chart, 55#")
                    .font(.caption)
                Spacer()
                Text("\(quantBroadcast(product: Broadcast))")
                    .font(.caption)
            }
            } .padding()
            Spacer()
            //END OF BROADCAST PRODUCTS
        //   SysSummaryTC()
    }
        .background(Color(red:239.0/255.0, green: 243.0/255.0, blue: 244.0/250, opacity: 1.0))
        .cornerRadius(5.0)
        .padding()
        
}

struct SysSummaryTS_Previews: PreviewProvider {
    static var previews: some View {
        SysSummary()
    }
}
}
