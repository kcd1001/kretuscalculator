//
//  BCoatGarage.swift
//  Calculator
//
//  Created by Kane Davidson on 5/18/21.
//

import SwiftUI
import Combine



struct MVRCoatPA: View {
    @EnvironmentObject var ChipPA : ColorChipValuesPA //Used for coat selections
    @EnvironmentObject var TSA_TS : stats //Used for system stats (mixRat,CovRate, etc)
    @EnvironmentObject var TSB_TS : stats //Used for system stats (mixRat,CovRate, etc)
    @EnvironmentObject var TSColorant : stats //Used for system stats (mixRat,CovRate, etc)
    @EnvironmentObject var sf : SquareFeet //Square feet
    @EnvironmentObject var Broadcast : statsBroadcast
    
    var TSMvr = stats(product: "Epoxy MVR", covRate: 150, MixRat: 1)
 


    
    let typesA = ["A Resin - Beige", "A Resin - Black", "A Resin - Clear", "A Resin - Dark Gray", "A Resin - Enchanted Green", "A Resin - Handicap Blue",           "A Resin - Latte", "A Resin - Light Gray", "A Resin - Medium Gray", "A Resin - Mocha", "A Resin - Safety Blue", "A Resin - Safety Red",           "A Resin - Safety Yellow", "A Resin - Shadow Gray", "A Resin - Tan", "A Resin - Tile Red", "A Resin - White", "CR Resin - Clear",
                  "LG Resin - Clear"]
    
    let typesACodes = ["EX-KTSARBG-01", "EX-KTSARBL-01", "EX-KTSARCL-01", "EX-KTSARDG-01", "EX-KTSAREG-01", "EX-KTSARHB-01", "EX-KTSARLT-01",                           "EX-KTSARLG-01", "EX-KTSARMG-01", "EX-KTSARMH-01", "EX-KTSARSB-01", "EX-KTSARSR-01", "EX-KTSARSY-01", "EX-KTSARSG-01",                            "EX-KTSARTN-01", "EX-KTSARTR-01", "EX-KTSARWH-01", "EX-KTSECRRC-01",
                       "Contact Distributor"]
    
    let typesB = ["MVR - EZ", "MVR - FC"]
    let typesBCodes = ["EX-KTSEMVZB-EA", "EX-KTSEMVFB-EA", "EX-KTSEAPB-EA", "EX-KTSEZB-EA", "EX-KTSEFB-EA", "EX-KTSETHB-EA"]
    
    let TSColorantChoices = ["No Color (pre-pigmented Part A)", "Beige", "Black", "Dark Gray", "Enchanted Green", "Handicap Blue", "Latte", "Light Gray", "Medium Gray", "Mocha", "Safety Blue", "Safety Red", "Safety Yellow", "Shadow Gray", "Tan", "Tile Red", "White",]
    
    let TSColorantCodes = ["No Color (pre-pigmented Part A)", "EX-KTSECLBG-EA", "EX-KTSECLBL-EA", "EX-KTSECLDG-EA", "EX-KTSECLEG-EA", "EX-KTSECLHB-EA", "EX-KTSECLLT-EA", "EX-KTSECLLG-EA", "EX-KTSECLMG-EA", "EX-KTSECLMC-EA", "EX-KTSECLSB-EA", "EX-KTSECLSR-EA", "EX-KTSECLSY-EA", "EX-KTSECLSG-EA", "EX-KTSECLTN-EA", "EX-KTSECLTR-EA", "EX-KTSECLWH-01",]
    
    func quant(product : stats) -> Int {
        let quantity : Float = (sf.squareF / product.covRate) * product.MixRat
         let kit = Int(ceil(Float(quantity / product.MixRat)))
         return kit
        } // returns number of kits required
    
  
    
    var body: some View {
        VStack {
            HStack {
                Text("Coating Thickness: 16 mils")
                    .fontWeight(.heavy)
                Spacer()
                ChipMVRCoatInfo()
            }
            .padding()
            Text("Top Shelf Epoxy® Part A:")
            .fontWeight(.bold)
            Picker(selection: $ChipPA.MVRPtA,
                label: ZStack {
                    Text("\(typesA[ChipPA.MVRPtA])")
                        .opacity(1)
                    Rectangle()
                        .fill(Color.gray)
                        .opacity(0.2)
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

            Text("Top Shelf Epoxy® Part B:")
             .fontWeight(.bold)
             Picker(selection: $ChipPA.MVRPtB,
                 label: ZStack {
                     Text("\(typesB[ChipPA.MVRPtB])")
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

            Text("Top Shelf Epoxy® Colorant:")
             .fontWeight(.bold)
             Picker(selection: $ChipPA.MVRTSColorant,
                 label: ZStack {
                     Text("\(TSColorantChoices[ChipPA.MVRTSColorant])")
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
//             .onChange(of: ChipPA.PCoatTSColorant) { _ in
//                quant(product: TSColorant)
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
                if ChipPA.MVRPtA == 4 {
                    HStack{
                        Text("\(typesACodes[ChipPA.MVRPtA])")
                            .font(.caption)
                        Spacer()
                        Text("TSE Part A: Ench. Green, 1 gal")
                            .font(.caption)
                        Spacer()
                        Text("\(quant(product: TSMvr))")
                            .font(.caption)
                    }
                }
                else {
                    HStack{
                        Text("\(typesACodes[ChipPA.MVRPtA])")
                            .font(.caption)
                        Spacer()
                        Text("TSE Part A: \(typesA[ChipPA.MVRPtA]), 1 gal")
                            .font(.caption)
                        Spacer()
                        Text("\(quant(product: TSMvr))")
                            .font(.caption)
                    }
            }
                HStack{
                    Text("\(typesBCodes[ChipPA.MVRPtB])")
                        .font(.caption)
                    Spacer()
                    Text("Top Shelf® Epoxy Part B: \(typesB[ChipPA.MVRPtB]), 1/2 gal")
                        .font(.caption)
                    Spacer()
                    Text("\(quant(product: TSMvr))")
                        .font(.caption)
                }
                if ChipPA.MVRTSColorant != 0 {
                     if ChipPA.MVRTSColorant == 4 {
                        HStack {
                            Text("\(TSColorantCodes[ChipPA.MVRTSColorant])")
                                .font(.caption)
                            Spacer()
                            Text("TSE Colorant:  Ench. Green, 16 oz")
                                .font(.caption)
                            Spacer()
                            Text("\(quant(product: TSMvr))")
                                .font(.caption)
                        }
                    }
                    else if ChipPA.MVRTSColorant == 5 {
                        HStack {
                            Text("\(TSColorantCodes[ChipPA.MVRTSColorant])")
                                .font(.caption)
                            Spacer()
                            Text("TSE Colorant:  H. Blue, 16 oz")
                                .font(.caption)
                            Spacer()
                            Text("\(quant(product: TSMvr))")
                                .font(.caption)
                        }
                    }
                    else if ChipPA.MVRTSColorant == 8 {
                        HStack {
                            Text("\(TSColorantCodes[ChipPA.MVRTSColorant])")
                                .font(.caption)
                            Spacer()
                            Text("TSE Colorant:  Med. Gray, 16 oz")
                                .font(.caption)
                            Spacer()
                            Text("\(quant(product: TSMvr))")
                                .font(.caption)
                        }
                    }
                    else {
                        HStack {
                            Text("\(TSColorantCodes[ChipPA.MVRTSColorant])")
                                .font(.caption)
                            Spacer()
                            Text("Top Shelf® Epoxy Colorant:  \(TSColorantChoices[ChipPA.MVRTSColorant]), 16 oz")
                                .font(.caption)
                            Spacer()
                            Text("\(quant(product: TSMvr))")
                                .font(.caption)
                        }
                    }
            }
        }
            .background(Color(red:239.0/255.0, green: 243.0/255.0, blue: 244.0/250, opacity: 1.0))
            .cornerRadius(5.0)
            .padding()
            HStack {
                Text("Add Waste Factor: ")
                Spacer()
                TextField("",value: $ChipPA.MVRWaste, formatter: NumberFormatter())
                    .frame(width:30, height:25)
                    .background(Color(red:239.0/255.0, green: 243.0/255.0, blue: 244.0/250, opacity: 1.0))
                    .cornerRadius(5.0)
                Text("kit(s)")
            }
            .padding()
            HStack {
                Text("Total:")
                Spacer()
                Text("\(quant(product: TSMvr) + ChipPA.MVRWaste) kit(s)")
            }
            .padding()
        }
    }
}

struct MVRCoatPA_Previews: PreviewProvider {
    static var previews: some View {
        BCoatGarage()
    }
}
