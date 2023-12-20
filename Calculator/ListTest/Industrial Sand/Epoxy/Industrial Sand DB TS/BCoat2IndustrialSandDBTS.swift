//
//  BCoat2Garage.swift
//  Calculator
//
//  Created by Kane Davidson on 5/18/21.
//

import SwiftUI
import Combine


var TSABC2_SandDBTS = stats(product: "Top Shelf® Epoxy Part A:", covRate: 120, MixRat: 1)
var TSBBC2_SandDBTS = stats(product: "Top Shelf® Epoxy Part B:", covRate: 120, MixRat: 0.5)
var TSColorantBC2_SandDBTS = stats(product: "Top Shelf® Epoxy Colorant:", covRate: 120, MixRat: 16)

struct BCoat2IndustrialSandDBTS: View {
    
 
    @EnvironmentObject var SandDBTS : ColorQuartzTSValues //Used for coat selections
    @EnvironmentObject var TSABC2_SandTS : stats //Used for system stats (mixRat,CovRate, etc)
    @EnvironmentObject var TSBBC2_SandTS : stats //Used for system stats (mixRat,CovRate, etc)
    @EnvironmentObject var TSColorantBC2_SandTS : stats //Used for system stats (mixRat,CovRate, etc)
    @EnvironmentObject var sf : SquareFeet //Square feet
    @EnvironmentObject var BroadcastSandTS : statsBroadcast


    
    let typesA = ["A Resin - Beige", "A Resin - Black", "A Resin - Clear", "A Resin - Dark Gray",
                  "A Resin - Ench. Green", "A Resin - Handic. Blue", "A Resin - Latte", "A Resin - Light Gray",
                  "A Resin - Medium Gray", "A Resin - Mocha", "A Resin - Safety Blue", "A Resin - Safety Red",
                  "A Resin - Safety Yellow", "A Resin - Shadow Gray", "A Resin - Tan", "A Resin - Tile Red",
                  "A Resin - White", "CR Resin - Clear", "LG Resin - Clear", "Commercial Resin - Clear"]
    
    let typesACodes = ["EX-KTSARBG-01", "EX-KTSARBL-01", "EX-KTSARCL-01", "EX-KTSARDG-01",
                       "EX-KTSAREG-01", "EX-KTSARHB-01", "EX-KTSARLT-01",
                       "EX-KTSARLG-01", "EX-KTSARMG-01", "EX-KTSARMH-01",
                       "EX-KTSARSB-01", "EX-KTSARSR-01", "EX-KTSARSY-01",
                       "EX-KTSARSG-01", "EX-KTSARTN-01", "EX-KTSARTR-01",
                       "EX-KTSARWH-01", "EX-KTSECRRC-01","Contact Distributor",
                       "FG-TSECMRCLR-01G"]
    
    let typesB = ["AP", "EZ", "Fast", "MVR - EZ", "MVR - FC", "TH"]
    let typesBCodes = ["EX-KTSEAPB-EA", "EX-KTSEZB-EA", "EX-KTSEFB-EA", "EX-KTSEMVZB-EA", "EX-KTSEMVFB-EA", "EX-KTSETHB-EA"]
    
    let TSColorantChoices = ["No Color (pre-pigmented Part A)", "Beige", "Black", "Dark Gray", "Ench. Green", "Handic. Blue", "Latte", "Light Gray", "Medium Gray", "Mocha", "Safety Blue", "Safety Red", "Safety Yellow", "Shadow Gray", "Tan", "Tile Red", "White",]
    
    let TSColorantCodes = ["No Color (pre-pigmented Part A)", "EX-KTSECLBG-EA", "EX-KTSECLBL-EA", "EX-KTSECLDG-EA", "EX-KTSECLEG-EA", "EX-KTSECLHB-EA", "EX-KTSECLLT-EA", "EX-KTSECLLG-EA", "EX-KTSECLMG-EA", "EX-KTSECLMC-EA", "EX-KTSECLSB-EA", "EX-KTSECLSR-EA", "EX-KTSECLSY-EA", "EX-KTSECLSG-EA", "EX-KTSECLTN-EA", "EX-KTSECLTR-EA", "EX-KTSECLWH-01",]
    
    func quant(product : stats) -> Int {
        let quantity : Float = (sf.squareF / product.covRate) * product.MixRat
         let kit = Int(ceil(Float(quantity / product.MixRat)))
         return kit
        } // returns number of kits required
    
    var body: some View {
        VStack {
            HStack {
     //           QuartzTSBCoatInfo()
            } .padding()
           Text("Top Shelf Epoxy® Part A:")
            .fontWeight(.bold)
            Picker(selection: $SandDBTS.BCoat2PtA,
                label: ZStack {
                    Text("\(typesA[SandDBTS.BCoat2PtA])")
                        .opacity(1)
                    Rectangle()
                        .fill(Color.black)
                        .opacity(0.9)
                        .cornerRadius(5)
                        .frame(width: 225, height: 25)
                      //  .padding()
            }) {
                ForEach (0 ..< typesA.count, id: \.self) { index in
                    Text(self.typesA[index]).tag(index)
                }
            }
            .background(Color.gray.opacity(0.2))
            .cornerRadius(5)
//            .onChange(of: SandDBTS.BCoat2PtA) { _ in
//                CheckCoatChoices()
//            }
            Text("Top Shelf Epoxy® Part B:")
             .fontWeight(.bold)
             Picker(selection: $SandDBTS.BCoat2PtB,
                 label: ZStack {
                     Text("\(typesB[SandDBTS.BCoat2PtB])")
                         .opacity(1)
                     Rectangle()
                         .fill(Color.gray)
                         .opacity(0.2)
                         .cornerRadius(5)
                         .frame(width: 150, height: 25)
                      //   .padding()
             }) {
                ForEach (0 ..< typesB.count, id: \.self) { index in
                     Text(self.typesB[index]).tag(index)
                 }
             }
             .background(Color.gray.opacity(0.2))
             .cornerRadius(5)
//             .onChange(of: SandDBTS.BCoat2PtB) { _ in
//                 CheckCoatChoices()
//             }
            Text("Top Shelf Epoxy® Colorant:")
             .fontWeight(.bold)
             Picker(selection: $SandDBTS.BCoat2TSColorant,
                 label: ZStack {
                     Text("\(TSColorantChoices[SandDBTS.BCoat2TSColorant])")
                         .opacity(1)
                     Rectangle()
                         .fill(Color.gray)
                         .opacity(0.2)
                         .cornerRadius(5)
                         .frame(width: 300, height: 25)
             }) {
                ForEach (0 ..< TSColorantChoices.count, id: \.self) { index in
                     Text(self.TSColorantChoices[index]).tag(index)
                 }
             }
             .background(Color.gray.opacity(0.2))
             .cornerRadius(5)
//             .onChange(of: SandDBTS.BCoat2TSColorant) { _ in
//                 CheckCoatChoices()
//             }
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
                    HStack{
                        Text("\(typesACodes[SandDBTS.BCoat2PtA])")
                            .font(.caption)
                        Spacer()
                        Text("TSE Part A: \(typesA[SandDBTS.BCoat2PtA]), 1 gal")
                            .font(.caption)
                        Spacer()
                        Text("\(quant(product: TSABC2_SandDBTS))")
                            .font(.caption)
                    }
            
                HStack{
                    Text("\(typesBCodes[SandDBTS.BCoat2PtB])")
                        .font(.caption)
                    Spacer()
                    Text("Top Shelf® Epoxy Part B: \(typesB[SandDBTS.BCoat2PtB]), 1/2 gal")
                        .font(.caption)
                    Spacer()
                    Text("\(quant(product: TSBBC2_SandDBTS))")
                        .font(.caption)
                }
                if SandDBTS.BCoat2TSColorant != 0
                {
                        HStack {
                            Text("\(TSColorantCodes[SandDBTS.BCoat2TSColorant])")
                                .font(.caption)
                            Spacer()
                            Text("Top Shelf® Epoxy Colorant:  \(TSColorantChoices[SandDBTS.BCoat2TSColorant]), 16 oz")
                                .font(.caption)
                            Spacer()
                            Text("\(quant(product: TSColorantBC2_SandDBTS))")
                                .font(.caption)
                        }
                }
        }
            .background(Color(red:239.0/255.0, green: 243.0/255.0, blue: 244.0/250, opacity: 1.0))
            .cornerRadius(5.0)
            .padding()
            HStack {
                Text("Add Waste Factor: ")
                Spacer()
                TextField("",value: $SandDBTS.BCoat2Waste, formatter: NumberFormatter())
                    .frame(width:30, height:25)
                    .background(Color(red:239.0/255.0, green: 243.0/255.0, blue: 244.0/250, opacity: 1.0))
                    .cornerRadius(5.0)
                Text("kit(s)")
            }
            .padding()
            HStack {
                Text("Total:")
                Spacer()
                Text("\(quant(product: TSABC2_SandDBTS) + SandDBTS.BCoat2Waste) kit(s)")
            }
            .padding()
        }
    }
}

struct BCoat22IndustrialSandDBTS_Previews: PreviewProvider {
    static var previews: some View {
        BCoatGarage()
    }
}
