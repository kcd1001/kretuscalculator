//
//  BCoatGarage.swift
//  Calculator
//
//  Created by Kane Davidson on 5/18/21.
//

import SwiftUI
import Combine



struct PCoatSelectCoveResin: View {
    
 
    @EnvironmentObject var ChipCoveResin : ColorChipValuesSelectCoveResin //Used for coat selections
    @EnvironmentObject var selectTSA_CoveResin : stats //Used for system stats (mixRat,CovRate, etc)
    @EnvironmentObject var selectTSB_CoveResin : stats //Used for system stats (mixRat,CovRate, etc)
    @EnvironmentObject var TSColorant_TS : stats //Used for system stats (mixRat,CovRate, etc)
    @EnvironmentObject var SolventCleaner : stats 
    @EnvironmentObject var sf : SquareFeet //Square feet
    @EnvironmentObject var Broadcast : statsBroadcast

    let kitTypes = ["Clear - TH"]
    
    let kitCodes = ["KIT-10103TH01"]
    
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
                Text("Coating Thickness: TBD")
                    .fontWeight(.heavy)
                Spacer()
                ChipCoveResinSelectPCoatInfo()
            }
            .padding()
           Text("Choose speed:")
            .fontWeight(.bold)
            Picker(selection: $ChipCoveResin.PCoatPtA,
                label: ZStack {
                    Text("\(kitTypes[ChipCoveResin.PCoatPtA])")
                        .opacity(1)
                    Rectangle()
                        .fill(Color.gray)
                        .opacity(0.2)
                        .cornerRadius(5)
                        .frame(width: 225, height: 25)
                      //  .padding()
            }) {
                ForEach (0 ..< kitTypes.count, id: \.self) { index in
                    Text(self.kitTypes[index]).tag(index)
                }
            }
            .background(Color.gray.opacity(0.2))
            .cornerRadius(5)

//            Text("Top Shelf Epoxy® Colorant:")
//             .fontWeight(.bold)
//             Picker(selection: $ChipCoveResin.PCoatTSColorant,
//                 label: ZStack {
//                     Text("\(TSColorantChoices[ChipCoveResin.PCoatTSColorant])")
//                         .opacity(1)
//                     Rectangle()
//                         .fill(Color.gray)
//                         .opacity(0.2)
//                         .cornerRadius(5)
//                         .frame(width: 300, height: 25)
//             }) {
//                ForEach (0 ..< TSColorantChoices.count, id: \.self) { index in
//                     Text(self.TSColorantChoices[index]).tag(index)
//                 }
//             }
//             .background(Color.gray.opacity(0.2))
//             .cornerRadius(5)

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
                        Text("\(kitCodes[ChipCoveResin.PCoatPtA])")
                            .font(.caption)
                        Spacer()
                    Text("Kretus Select Cove Resin Kit - \(kitTypes[ChipCoveResin.PCoatPtA])")
                            .font(.caption)
                        Spacer()
                        Text("\(quant(product: selectTSA_CoveResin))")
                            .font(.caption)
                    }
            
//                if ChipCoveResin.PCoatTSColorant != 0 {
//                    HStack {
//                        Text("\(TSColorantCodes[ChipCoveResin.PCoatTSColorant])")
//                            .font(.caption)
//                        Spacer()
//                        Text("Top Shelf® Epoxy Colorant: \(TSColorantChoices[ChipCoveResin.PCoatTSColorant]), 16 oz")
//                            .font(.caption)
//                        Spacer()
//                        Text("\(quant(product: TSColorant_TS))")
//                            .font(.caption)
//                            }
//                
//                    if ChipCoveResin.PCoatTSColorant == 4 { //USED TO ABBREVIATE ENCHANTED GREEN TO FIT ON SCREEN
//                        HStack {
//                            Text("\(TSColorantCodes[ChipCoveResin.PCoatTSColorant])")
//                                .font(.caption)
//                            Spacer()
//                            Text("TSE Colorant:  Ench. Green, 16 oz")
//                                .font(.caption)
//                            Spacer()
//                            Text("\(quant(product: TSColorant_TS))")
//                                .font(.caption)
//                                }
//                                                    }
//                                                }
        }
            .background(Color(red:239.0/255.0, green: 243.0/255.0, blue: 244.0/250, opacity: 1.0))
            .cornerRadius(5.0)
            .padding()
            HStack {
                Text("Add Waste Factor: ")
                Spacer()
                TextField("",value: $ChipCoveResin.PCoatWaste, formatter: NumberFormatter())
                    .frame(width:30, height:25)
                    .background(Color(red:239.0/255.0, green: 243.0/255.0, blue: 244.0/250, opacity: 1.0))
                    .cornerRadius(5.0)
                Text("kit(s)")
            }
            .padding()
            HStack {
                Text("Total:")
                Spacer()
                Text("\(quant(product: selectTSA_CoveResin) + ChipCoveResin.PCoatWaste) kit(s)")
            }
            .padding()
        }
    }
}

struct PCoatSelectCoveResin_Previews: PreviewProvider {
    static var previews: some View {
        BCoatGarage()
    }
}
