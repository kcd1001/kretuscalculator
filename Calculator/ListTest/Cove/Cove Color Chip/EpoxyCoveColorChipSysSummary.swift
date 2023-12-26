//
//  EpoxyCoveColorSysSummary.swift
//  Calculator
//
//  Created by Kane Davidson on 7/4/22.
//

import SwiftUI

struct EpoxyCoveColorChipSysSummary: View {
    
    @EnvironmentObject var CoveColorChip : EpoxyCoveSelections //Used for coat selections
    @EnvironmentObject var sf : SquareFeet //Square feet
    
    @EnvironmentObject var bCoatCoveChipTSA : stats2
    @EnvironmentObject var bCoatCoveChipTSB : stats2
    @EnvironmentObject var bCoatCoveChipTSColorant : stats2
    @EnvironmentObject var bCoatCoveChipTexture : stats2
    
    var Broadcast = statsBroadcast(product: "Color Chip", covRate: 0.15, MixRat: 55)
    
    let typesB = ["AP", "EZ", "Fast", "TH"]
    let typesBCodes = ["EX-KTSEAPB-EA", "EX-KTSEZB-EA", "EX-KTSEFB-EA",  "EX-KTSETHB-EA"]
    
    let TSColorantChoices = ["Beige", "Black", "Dark Gray", "Ench. Green", "Hand. Blue", "Latte", "Light Gray", "Medium Gray", "Mocha", "Safety Blue", "Safety Red", "Safety Yellow", "Shadow Gray", "Tan", "Tile Red", "White",]
    
    let TSColorantCodes = [ "EX-KTSECLBG-EA", "EX-KTSECLBL-EA", "EX-KTSECLDG-EA", "EX-KTSECLEG-EA", "EX-KTSECLHB-EA", "EX-KTSECLLT-EA", "EX-KTSECLLG-EA", "EX-KTSECLMG-EA", "EX-KTSECLMC-EA", "EX-KTSECLSB-EA", "EX-KTSECLSR-EA", "EX-KTSECLSY-EA", "EX-KTSECLSG-EA", "EX-KTSECLTN-EA", "EX-KTSECLTR-EA", "EX-KTSECLWH-01",]
    
    var ChipSizes = ["1/4\"", "1/8\""]
    
    var ChipChoices = ["Anaheim Gray", "Antler", "Avery", "Bow Tie", "Charcoal", "Coyote", "Domino", "Fog Gray", "Granite", "Gravel", "Keaton", "Lasorda Blue", "Lighthouse", "Monterey Spice", "Onyx Pearl", "Orbit", "Outback", "Pintail", "Saddle Tan", "Shorline", "Sienna", "Smoke", "Swan", "Terrier" , "Thistle", "Twilight"]
    
    func quant(product : stats) -> Int {
        let quantity : Float = (sf.squareF / product.covRate) * product.MixRat
        let kit = Int(ceil(Float(quantity / product.MixRat)))
        return kit
    } // returns number of kits required
    
    func quantBroadcast(product : statsBroadcast) -> Int {
        let quantity : Float = (sf.squareF * product.covRate)
        let kit = Int(ceil(Float(quantity / product.MixRat)))
        return kit
    } // returns number of kits required for broadcast
    
    var body: some View {
        
        Text("Prime Coat")
            .bold()
        
        VStack
        {
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
            
            HStack{
                Text("EX-KTSECVRC-01")
                    .font(.caption)
                Spacer()
                Text("TSE Part A - Cove Resin - Clear, 1 gal")
                    .font(.caption)
                Spacer()
                Text("\(quant(product: coveChipTSA) + CoveColorChip.Coat1Waste)")
                    .font(.caption)
            }
            
            HStack{
                Text("\(typesBCodes[CoveColorChip.Coat1PtB])")
                    .font(.caption)
                Spacer()
                Text("Top Shelf® Epoxy Part B: \(typesB[CoveColorChip.Coat1PtB]), 1/2 gal")
                    .font(.caption)
                Spacer()
                Text("\(quant(product: coveTSB) + CoveColorChip.Coat1Waste)")
                    .font(.caption)
            }
            
            HStack {
                Text("\(TSColorantCodes[CoveColorChip.Coat1TSColorant])")
                    .font(.caption)
                Spacer()
                Text("Top Shelf® Epoxy Colorant:  \(TSColorantChoices[CoveColorChip.Coat1TSColorant]), 16 oz")
                    .font(.caption)
                Spacer()
                Text("\(quant(product: coveTSColorant) + CoveColorChip.Coat1Waste)")
                    .font(.caption)
            }
        }
        .background(Color(red:239.0/255.0, green: 243.0/255.0, blue: 244.0/250, opacity: 1.0))
        .cornerRadius(5.0)
        .padding()
        
        Text("Body Coat")
            .bold()
        VStack
        {
            HStack{
                Text("EX-KTSECVRC-01")
                    .font(.caption)
                Spacer()
                Text("TSE Part A - Cove Resin - Clear, 1 gal")
                    .font(.caption)
                Spacer()
                Text("\(quant(product: bCoatCoveChipTSA) + CoveColorChip.Coat2Waste)")
                    .font(.caption)
            }
            
            HStack{
                Text("\(typesBCodes[CoveColorChip.Coat2PtB])")
                    .font(.caption)
                Spacer()
                Text("Top Shelf® Epoxy Part B: \(typesB[CoveColorChip.Coat2PtB]), 1/2 gal")
                    .font(.caption)
                Spacer()
                Text("\(quant(product: bCoatCoveChipTSB) + CoveColorChip.Coat2Waste)")
                    .font(.caption)
            }
            
            HStack {
                Text("\(TSColorantCodes[CoveColorChip.Coat2TSColorant])")
                    .font(.caption)
                Spacer()
                Text("Top Shelf® Epoxy Colorant:  \(TSColorantChoices[CoveColorChip.Coat2TSColorant]), 16 oz")
                    .font(.caption)
                Spacer()
                Text("\(quant(product: bCoatCoveChipTSColorant) + CoveColorChip.Coat2Waste)")
                    .font(.caption)
            }
            HStack {
                Text("Contact Distributor")
                    .font(.caption)
                Spacer()
                Text("Texture - Color Quartz Clear, F-Grade, 50#")
                    .font(.caption)
                Spacer()
                Text("\(quant(product: bCoatCoveChipTexture) + CoveColorChip.Coat2Waste)")
                    .font(.caption)
            }
        }
        .background(Color(red:239.0/255.0, green: 243.0/255.0, blue: 244.0/250, opacity: 1.0))
        .cornerRadius(5.0)
        .padding()
        
        Text("Cap Coat")
            .bold()
        VStack
        {
            HStack{
                Text("EX-KTSECVRC-01")
                    .font(.caption)
                Spacer()
                Text("TSE Part A - Cove Resin - Clear, 1 gal")
                    .font(.caption)
                Spacer()
                Text("\(quant(product: coveTSA) + CoveColorChip.Coat3Waste)")
                    .font(.caption)
            }
            
            HStack{
                Text("\(typesBCodes[CoveColorChip.Coat3PtB])")
                    .font(.caption)
                Spacer()
                Text("Top Shelf® Epoxy Part B: \(typesB[CoveColorChip.Coat3PtB]), 1/2 gal")
                    .font(.caption)
                Spacer()
                Text("\(quant(product: coveTSB) + CoveColorChip.Coat3Waste)")
                    .font(.caption)
            }
            if CoveColorChip.Coat3TSColorant != 0
            {
            HStack {
                Text("\(TSColorantCodes[CoveColorChip.Coat3TSColorant])")
                    .font(.caption)
                Spacer()
                Text("Top Shelf® Epoxy Colorant:  \(TSColorantChoices[CoveColorChip.Coat3TSColorant]), 16 oz")
                    .font(.caption)
                Spacer()
                Text("\(quant(product: coveTSColorant) + CoveColorChip.Coat3Waste)")
                    .font(.caption)
            }
            }
        }
        .background(Color(red:239.0/255.0, green: 243.0/255.0, blue: 244.0/250, opacity: 1.0))
        .cornerRadius(5.0)
        .padding()
        Text("Broadcast")
        VStack
        {
            HStack {
                Text("Contact Distributor")
                    .font(.caption)
                Spacer()
                Text("See Kretus color chart, 55#")
                    .font(.caption)
                Spacer()
                Text("\(quantBroadcast(product: Broadcast) + CoveColorChip.BroadcastWaste)")
                    .font(.caption)
            }
        }
        .background(Color(red:239.0/255.0, green: 243.0/255.0, blue: 244.0/250, opacity: 1.0))
        .cornerRadius(5.0)
        .padding()
        
    }
}

struct EpoxyCoveColorChipSysSummary_Previews: PreviewProvider {
    static var previews: some View {
        EpoxyCoveColorSysSummary()
    }
}
