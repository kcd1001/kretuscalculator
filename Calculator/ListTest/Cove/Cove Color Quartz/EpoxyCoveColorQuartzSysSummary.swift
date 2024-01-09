//
//  EpoxyCoveColorSysSummary.swift
//  Calculator
//
//  Created by Kane Davidson on 7/4/22.
//

import SwiftUI

struct EpoxyCoveColorQuartzSysSummary: View {
    
    @EnvironmentObject var CoveColorQuartz : EpoxyCoveSelections //Used for coat selections
    @EnvironmentObject var sf : SquareFeet //Square feet
    
    @EnvironmentObject var bCoatCoveQuartzTSA : stats2
    @EnvironmentObject var bCoatCoveQuartzTSB : stats2
    @EnvironmentObject var bCoatCoveQuartzTSColorant : stats2
    @EnvironmentObject var bCoatCoveQuartzTexture : stats2
    
    var Broadcast = statsBroadcast(product: "Color Quartz", covRate: 0.15, MixRat: 55)
    
    let typesB = ["AP", "EZ", "Fast", "TH"]
    let typesBCodes = ["EX-KTSEAPB-EA", "EX-KTSEZB-EA", "EX-KTSEFB-EA",  "EX-KTSETHB-EA"]
    
    let TSColorantChoices = ["","Beige", "Black", "Dark Gray", "Ench. Green", "Hand. Blue", "Latte", "Light Gray", "Medium Gray", "Mocha", "Safety Blue", "Safety Red", "Safety Yellow", "Shadow Gray", "Tan", "Tile Red", "White",]
    
    let TSColorantCodes = [ "EX-KTSECLBG-EA", "EX-KTSECLBL-EA", "EX-KTSECLDG-EA", "EX-KTSECLEG-EA", "EX-KTSECLHB-EA", "EX-KTSECLLT-EA", "EX-KTSECLLG-EA", "EX-KTSECLMG-EA", "EX-KTSECLMC-EA", "EX-KTSECLSB-EA", "EX-KTSECLSR-EA", "EX-KTSECLSY-EA", "EX-KTSECLSG-EA", "EX-KTSECLTN-EA", "EX-KTSECLTR-EA", "EX-KTSECLWH-01",]
    
    var QuartzSizes = ["1/4\"", "1/8\""]
    
    var QuartzChoices = ["Anaheim Gray", "Antler", "Avery", "Bow Tie", "Charcoal", "Coyote", "Domino", "Fog Gray", "Granite", "Gravel", "Keaton", "Lasorda Blue", "Lighthouse", "Monterey Spice", "Onyx Pearl", "Orbit", "Outback", "Pintail", "Saddle Tan", "Shorline", "Sienna", "Smoke", "Swan", "Terrier" , "Thistle", "Twilight"]
    
    let textureChoices = ["Aspen Green", "Autumn Red", "Black", "Blue", "Brown", "Buff", "Burgundy", "Cayman Green", "Chocolate Brown", "Clear", "Colbalt Blue", "Coral Rose", "Forest Green", "Glacier Blue", "Granite", "Gray", "Green", "Peach", "Plum", "Red", "Salt & Pepper", "Smoke", "Spice", "Suntan", "Tan", "Tobacco", "Tweed", "White", "Yellow", "Industrial Sand" ]
    
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
                Text("\(quant(product: coveQuartzTSA) + CoveColorQuartz.Coat1Waste)")
                    .font(.caption)
            }
            
            HStack{
                Text("\(typesBCodes[CoveColorQuartz.Coat1PtB])")
                    .font(.caption)
                Spacer()
                Text("Top Shelf® Epoxy Part B: \(typesB[CoveColorQuartz.Coat1PtB]), 1/2 gal")
                    .font(.caption)
                Spacer()
                Text("\(quant(product: coveTSB) + CoveColorQuartz.Coat1Waste)")
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
                Text("\(quant(product: bCoatCoveQuartzTSA) + CoveColorQuartz.Coat2Waste)")
                    .font(.caption)
            }
            
            HStack{
                Text("\(typesBCodes[CoveColorQuartz.Coat2PtB])")
                    .font(.caption)
                Spacer()
                Text("Top Shelf® Epoxy Part B: \(typesB[CoveColorQuartz.Coat2PtB]), 1/2 gal")
                    .font(.caption)
                Spacer()
                Text("\(quant(product: bCoatCoveQuartzTSB) + CoveColorQuartz.Coat2Waste)")
                    .font(.caption)
            }
            
            HStack {
                Text("Contact Distributor")
                    .font(.caption)
                Spacer()
                Text("Color Quartz - See Kretus color chart, F-Grade, 50#")
                    .font(.caption)
                Spacer()
                Text("\(quant(product: bCoatCoveQuartzTexture))")
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
                Text("\(quant(product: coveTSA) + CoveColorQuartz.Coat3Waste)")
                    .font(.caption)
            }
            
            HStack{
                Text("\(typesBCodes[CoveColorQuartz.Coat3PtB])")
                    .font(.caption)
                Spacer()
                Text("Top Shelf® Epoxy Part B: \(typesB[CoveColorQuartz.Coat3PtB]), 1/2 gal")
                    .font(.caption)
                Spacer()
                Text("\(quant(product: coveTSB) + CoveColorQuartz.Coat3Waste)")
                    .font(.caption)
            }

        }
        .background(Color(red:239.0/255.0, green: 243.0/255.0, blue: 244.0/250, opacity: 1.0))
        .cornerRadius(5.0)
        .padding()

        
    }
}

struct EpoxyCoveColorQuartzSysSummary_Previews: PreviewProvider {
    static var previews: some View {
        EpoxyCoveColorSysSummary()
    }
}
