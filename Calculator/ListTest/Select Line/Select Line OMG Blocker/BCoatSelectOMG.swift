//
//  BCoatGarage.swift
//  Calculator
//
//  Created by Kane Davidson on 5/18/21.
//

import SwiftUI
import Combine



struct BCoatSelectOMG: View {
    
 
    @EnvironmentObject var ChipOMG : ColorChipValuesSelectOMG //Used for coat selections
    @EnvironmentObject var selectTSA_OMG : stats //Used for system stats (mixRat,CovRate, etc)
    @EnvironmentObject var selectTSB_OMG : stats //Used for system stats (mixRat,CovRate, etc)
    @EnvironmentObject var TSColorant_TS : stats //Used for system stats (mixRat,CovRate, etc)
    @EnvironmentObject var SolventCleaner : stats 
    @EnvironmentObject var sf : SquareFeet //Square feet
    @EnvironmentObject var Broadcast : statsBroadcast

    let kitTypes = ["EZ", "FC"]
    
    let kitCodes = ["KIT-10501MEZ03", "KIT-10501MFC03"]
    
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
                Text("Spread Rate: 100 sf/gal (300 sf/kit)")
                    .fontWeight(.heavy)
                Spacer()
//                ChipOMGSelectPCoatInfo()
            }
            .padding()
           Text("Choose speed:")
            .fontWeight(.bold)
            Picker(selection: $ChipOMG.BCoatPtA,
                label: ZStack {
                    Text("\(kitTypes[ChipOMG.BCoatPtA])")
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
//             Picker(selection: $ChipOMG.BCoatTSColorant,
//                 label: ZStack {
//                     Text("\(TSColorantChoices[ChipOMG.BCoatTSColorant])")
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
                        Text("\(kitCodes[ChipOMG.BCoatPtA])")
                            .font(.caption)
                        Spacer()
                    Text("Kretus Select OMG Blocker Kit - \(kitTypes[ChipOMG.BCoatPtA])")
                            .font(.caption)
                        Spacer()
                        Text("\(quant(product: selectTSA_OMG))")
                            .font(.caption)
                    }
            
//                if ChipOMG.BCoatTSColorant != 0 {
//                    HStack {
//                        Text("\(TSColorantCodes[ChipOMG.BCoatTSColorant])")
//                            .font(.caption)
//                        Spacer()
//                        Text("Top Shelf® Epoxy Colorant: \(TSColorantChoices[ChipOMG.BCoatTSColorant]), 16 oz")
//                            .font(.caption)
//                        Spacer()
//                        Text("\(quant(product: TSColorant_TS))")
//                            .font(.caption)
//                            }
//                
//                    if ChipOMG.BCoatTSColorant == 4 { //USED TO ABBREVIATE ENCHANTED GREEN TO FIT ON SCREEN
//                        HStack {
//                            Text("\(TSColorantCodes[ChipOMG.BCoatTSColorant])")
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
                TextField("",value: $ChipOMG.BCoatWaste, formatter: NumberFormatter())
                    .frame(width:30, height:25)
                    .background(Color(red:239.0/255.0, green: 243.0/255.0, blue: 244.0/250, opacity: 1.0))
                    .cornerRadius(5.0)
                Text("kit(s)")
            }
            .padding()
            HStack {
                Text("Total:")
                Spacer()
                Text("\(quant(product: selectTSA_OMG) + ChipOMG.BCoatWaste) kit(s)")
            }
            .padding()
        }
    }
}

struct BCoatSelectOMG_Previews: PreviewProvider {
    static var previews: some View {
        BCoatGarage()
    }
}
