//
//  BCoatGarage.swift
//  Calculator
//
//  Created by Kane Davidson on 5/18/21.
//

import SwiftUI
import Combine



struct PCoatTS: View {
    
 
    @EnvironmentObject var ChipTS : ColorChipValuesTS //Used for coat selections
    @EnvironmentObject var TSA_TS : stats //Used for system stats (mixRat,CovRate, etc)
    @EnvironmentObject var TSB_TS : stats //Used for system stats (mixRat,CovRate, etc)
    @EnvironmentObject var TSColorant_TS : stats //Used for system stats (mixRat,CovRate, etc)
    @EnvironmentObject var SolventCleaner : stats 
    @EnvironmentObject var sf : SquareFeet //Square feet
    @EnvironmentObject var Broadcast : statsBroadcast


    
    let typesA = ["A Resin - Beige", "A Resin - Black", "A Resin - Clear",
                  "A Resin - Dark Gray", "A Resin - Enchanted Green",
                  "A Resin - Handicap Blue", "A Resin - Latte",
                  "A Resin - Light Gray", "A Resin - Medium Gray",
                  "A Resin - Mocha", "A Resin - Safety Blue",
                  "A Resin - Safety Red", "A Resin - Safety Yellow",
                  "A Resin - Shadow Gray", "A Resin - Tan",
                  "A Resin - Tile Red", "A Resin - White",
                  "CR Resin - Clear", "LG Resin - Clear", "Commercial Resin"]
    
    let typesACodes = ["EX-KTSARBG-01", "EX-KTSARBL-01", "EX-KTSARCL-01",
                       "EX-KTSARDG-01", "EX-KTSAREG-01", "EX-KTSARHB-01",
                       "EX-KTSARLT-01", "EX-KTSARLG-01", "EX-KTSARMG-01",
                       "EX-KTSARMH-01", "EX-KTSARSB-01", "EX-KTSARSR-01",
                       "EX-KTSARSY-01", "EX-KTSARSG-01", "EX-KTSARTN-01",
                       "EX-KTSARTR-01", "EX-KTSARWH-01", "EX-KTSECRRC-01",
                       "Contact Distributor", ""]
    
    let typesB = ["AP", "EZ", "Fast", "MVR - EZ", "MVR - FC", "TH"]
    let typesBCodes = ["EX-KTSEAPB-EA", "EX-KTSEZB-EA", "EX-KTSEFB-EA", "EX-KTSEMVZB-EA", "EX-KTSEMVFB-EA", "EX-KTSETHB-EA"]
    
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
                Text("Coating Thickness: 3-5 mils")
                    .fontWeight(.heavy)
                Spacer()
                ChipTSPrimeCoatInfo()
            }
            .padding()
           Text("Top Shelf Epoxy® Part A:")
            .fontWeight(.bold)
            Picker(selection: $ChipTS.PCoatPtA,
                label: ZStack {
                    Text("\(typesA[ChipTS.PCoatPtA])")
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
             Picker(selection: $ChipTS.PCoatPtB,
                 label: ZStack {
                     Text("\(typesB[ChipTS.PCoatPtB])")
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
//             .onChange(of: ChipTS.PCoatPtB) { _ in
//                quant(product: TSB)
//             }
            Text("Top Shelf Epoxy® Colorant:")
             .fontWeight(.bold)
             Picker(selection: $ChipTS.PCoatTSColorant,
                 label: ZStack {
                     Text("\(TSColorantChoices[ChipTS.PCoatTSColorant])")
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
                if ChipTS.PCoatPtA == 4 {
                    HStack{
                        Text("\(typesACodes[ChipTS.PCoatPtA])")
                            .font(.caption)
                        Spacer()
                        Text("TSE Part A: Ench. Green, 1 gal")
                            .font(.caption)
                        Spacer()
                        Text("\(quant(product: TSA_TS))")
                            .font(.caption)
                    }
                }
                else {
                    HStack{
                        Text("\(typesACodes[ChipTS.PCoatPtA])")
                            .font(.caption)
                        Spacer()
                        Text("TSE Part A: \(typesA[ChipTS.PCoatPtA]), 1 gal")
                            .font(.caption)
                        Spacer()
                        Text("\(quant(product: TSA_TS))")
                            .font(.caption)
                    }
            }
                HStack{
                    Text("\(typesBCodes[ChipTS.PCoatPtB])")
                        .font(.caption)
                    Spacer()
                    Text("Top Shelf® Epoxy Part B: \(typesB[ChipTS.PCoatPtB]), 1/2 gal")
                        .font(.caption)
                    Spacer()
                    Text("\(quant(product: TSB_TS))")
                        .font(.caption)
                }
                HStack{ // Solvent Cleaner
                    Text("EX-KSLVCLN-EA")
                        .font(.caption)
                    Spacer()
                    Text("Solvent Cleaner, 32 oz")
                        .font(.caption)
                    Spacer()
                    Text("\(quant(product: TSA_TS))")
                        .font(.caption)
                }
                if ChipTS.PCoatTSColorant != 0 { //DISPLAYS 16 OZ INSTEAD OF 8 FOR CERTAIN LIGHTER COLORS
                    if ChipTS.PCoatTSColorant == 1 || ChipTS.PCoatTSColorant == 5 || ChipTS.PCoatTSColorant == 6 || ChipTS.PCoatTSColorant == 10 || ChipTS.PCoatTSColorant == 11 || ChipTS.PCoatTSColorant == 12 || ChipTS.PCoatTSColorant == 13 || ChipTS.PCoatTSColorant == 16 {
                    HStack {
                        Text("\(TSColorantCodes[ChipTS.PCoatTSColorant])")
                            .font(.caption)
                        Spacer()
                        Text("Top Shelf® Epoxy Colorant:  \(TSColorantChoices[ChipTS.PCoatTSColorant]), 16 oz")
                            .font(.caption)
                        Spacer()
                        Text("\(quant(product: TSColorant_TS))")
                            .font(.caption)
                    }
                }
                    else if ChipTS.PCoatTSColorant == 4 { //USED TO ABBREVIATE ENCHANTED GREEN TO FIT ON SCREEN
                        HStack {
                            Text("\(TSColorantCodes[ChipTS.PCoatTSColorant])")
                                .font(.caption)
                            Spacer()
                            Text("TSE Colorant:  Ench. Green, 8 oz")
                                .font(.caption)
                            Spacer()
                            Text("\(quant(product: TSColorant_TS))")
                                .font(.caption)
                        }
                    }
                    else {
                        HStack {
                            Text("\(TSColorantCodes[ChipTS.PCoatTSColorant])")
                                .font(.caption)
                            Spacer()
                            Text("Top Shelf® Epoxy Colorant:  \(TSColorantChoices[ChipTS.PCoatTSColorant]), 8 oz")
                                .font(.caption)
                            Spacer()
                            Text("\(quant(product: TSColorant_TS))")
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
                TextField("",value: $ChipTS.PCoatWaste, formatter: NumberFormatter())
                    .frame(width:30, height:25)
                    .background(Color(red:239.0/255.0, green: 243.0/255.0, blue: 244.0/250, opacity: 1.0))
                    .cornerRadius(5.0)
                Text("kit(s)")
            }
            .padding()
            HStack {
                Text("Total:")
                Spacer()
                Text("\(quant(product: TSA_TS) + ChipTS.PCoatWaste) kit(s)")
            }
            .padding()
        }
    }
}

struct PCoatTS_Previews: PreviewProvider {
    static var previews: some View {
        BCoatGarage()
    }
}
