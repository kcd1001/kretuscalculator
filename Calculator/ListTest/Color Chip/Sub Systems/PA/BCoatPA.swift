//
//  BCoatGarage.swift
//  Calculator
//
//  Created by Kane Davidson on 5/18/21.
//

import SwiftUI
import Combine



var PAPtABC = stats(product: "Top Shelf® Epoxy Part A:", covRate: 260, MixRat: 1)
var PAPtBBC = stats(product: "Top Shelf® Epoxy Part B:", covRate: 260, MixRat: 0.5)
var PAPolyColorantBC = stats(product: "Top Shelf® Epoxy Colorant:", covRate: 260, MixRat: 16)

struct BCoatPA: View {
    
 
    @EnvironmentObject var ChipPA : ColorChipValuesPA //Used for coat selections
    @EnvironmentObject var PAPtABC : stats //Used for system stats (mixRat,CovRate, etc)
    @EnvironmentObject var PAPtBBC : stats //Used for system stats (mixRat,CovRate, etc)
    @EnvironmentObject var PAPolyColorantBC : stats //Used for system stats (mixRat,CovRate, etc)
    @EnvironmentObject var SolventCleaner : stats 
    @EnvironmentObject var sf : SquareFeet //Square feet
    @EnvironmentObject var Broadcast : statsBroadcast
    @State var PCoatPtACode = "EX-KPLY72AZ-01"
    @State var PCoatHardenerCode = "EX-KPLY72B-01"


    
    let typesA = ["Polyaspartic 72", "Polyaspartic 85", "Polyaspartic 92 Low Odor"]
    var PartAHardeners = ["EZ - Clear", "Fast - Clear"]
    
    var PtBCodes = ["EX-KPLY72B-01","EX-KPLY85B-01", "EX-KPLY92B-01", "EX-KPLYHSB-EA"]
    
    let typesACodes = ["EX-KTSARBG-01", "EX-KTSARBL-01", "EX-KTSARCL-01", "EX-KTSARDG-01", "EX-KTSAREG-01", "EX-KTSARHB-01", "EX-KTSARLT-01",                           "EX-KTSARLG-01", "EX-KTSARMG-01", "EX-KTSARMH-01", "EX-KTSARSB-01", "EX-KTSARSR-01", "EX-KTSARSY-01", "EX-KTSARSG-01",                            "EX-KTSARTN-01", "EX-KTSARTR-01", "EX-KTSARWH-01", "EX-KTSECRRC-01",
                       "Contact Distributor"]
    
    let Hardeners = ["AP", "EZ", "Fast", "MVR - EZ", "MVR - FC", "TH"]
    let HardenerCodes = ["EX-KTSEAPB-EA", "EX-KTSEZB-EA", "EX-KTSEFB-EA", "EX-KTSEMVZB-EA", "EX-KTSEMVFB-EA", "EX-KTSETHB-EA"]
    
    let PolyColorantChoices = ["No Color (pre-pigmented Part A)", "Beige", "Black", "Dark Gray", "Enchanted Green", "Handicap Blue", "Latte", "Light Gray", "Medium Gray", "Mocha", "Safety Blue", "Safety Red", "Safety Yellow", "Shadow Gray", "Tan", "Tile Red", "White",]
    
    let PolyColorantCodes = ["No Color (pre-pigmented Part A)", "EX-KPLYCLBG-EA", "EX-KPLYCLBL-EA", "EX-KPLYCLDG-EA", "EX-KPLYCLEG-EA", "EX-KPLYCLHB-EA", "EX-KPLYCLLT-EA", "EX-KPLYCLLG-EA", "EX-KPLYCLMG-EA", "EX-KPLYCLMC-EA", "EX-KPLYCLSB-EA", "EX-KPLYCLSR-EA", "EX-KPLYCLSY-EA", "EX-KPLYCLSG-EA", "EX-KPLYCLTN-EA", "EX-KPLYCLTR-EA", "EX-KPLYCLWH-01"]
    
    func quant(product : stats) -> Int {
        let quantity : Float = (sf.squareF / product.covRate) * product.MixRat
         let kit = Int(ceil(Float(quantity / product.MixRat)))
         return kit
        } // returns number of kits required
    
    func checkBCoatCodes() -> Void {
    
    if ChipPA.BCoatPtA == 0 && ChipPA.BCoatHardener == 0 {
        PCoatPtACode = "EX-KPLY72AZ-01"
        PCoatHardenerCode = "EX-KPLY72B-01"
    }
    else if ChipPA.BCoatPtA == 0 && ChipPA.BCoatHardener == 1 {
        PCoatPtACode = "EX-KPLY72AF-01"
        PCoatHardenerCode = "EX-KPLY72B-01"

    }
    else if ChipPA.BCoatPtA == 1 && ChipPA.BCoatHardener == 0 {
        PCoatPtACode = "EX-KPLY85AZ-01"
        PCoatHardenerCode = "EX-KPLY85B-01"
    }
    else if ChipPA.BCoatPtA == 1 && ChipPA.BCoatHardener == 1 {
        PCoatPtACode = "EX-KPLY85AF-01"
        PCoatHardenerCode = "EX-KPLY85B-01"

    }
    else if ChipPA.BCoatPtA == 2 && ChipPA.BCoatHardener == 0 {
        PCoatPtACode = "EX-KPLY92AZ-01"
        PCoatHardenerCode = "EX-KPLY92B-01"

    }
    else if ChipPA.BCoatPtA == 2 && ChipPA.BCoatHardener == 1 {
        PCoatPtACode = "EX-KPLY92AF-01"
        PCoatHardenerCode = "EX-KPLY92B-01"

    }
}

    
  
    
    var body: some View {
        VStack {
            HStack {
                
            Text("Coating Thickness: 8-12 mils")
                .fontWeight(.heavy)
            Spacer()
            ChipPAInfo()
        } .padding()
               Text("Polyaspartic:")
                .fontWeight(.bold)
            BCoatPicker()
                .onChange(of: ChipPA.BCoatPtA) { _ in
                            checkBCoatCodes()
                         }
                .onChange(of: ChipPA.BCoatHardener) { _ in
                            checkBCoatCodes()
                         }
            Text("Poly Colorant:")
             .fontWeight(.bold)
             Picker(selection: $ChipPA.BCoatPolyColorant,
                 label: ZStack {
                     Text("\(PolyColorantChoices[ChipPA.BCoatPolyColorant])")
                         .opacity(1)
                     Rectangle()
                         .fill(Color.gray)
                         .opacity(0.2)
                         .cornerRadius(5)
                         .frame(width: 300, height: 25)
             }) {
                ForEach (0 ..< PolyColorantChoices.count, id: \.self) { index in
                     Text(self.PolyColorantChoices[index]).tag(index)
                 }
             } .pickerStyle(MenuPickerStyle())

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
                HStack{ // Part A
                    Text("\(PCoatPtACode)")
                        .font(.caption)
                    Spacer()
                    Text(" \(typesA[ChipPA.BCoatPtA]) - \(PartAHardeners[ChipPA.BCoatHardener]) 1 gal")
                        .font(.caption)
                    Spacer()
                    Text("\(quant(product: PAPtABC))")
                        .font(.caption)
                }
                HStack{ // Hardener
                    Text("\(PCoatHardenerCode)")
                        .font(.caption)
                    Spacer()
                    Text(" \(typesA[ChipPA.BCoatPtA]) Part B, 1 gal")
                        .font(.caption)
                    Spacer()
                    Text("\(quant(product: PAPtABC))")
                        .font(.caption)
                }
                if ChipPA.BCoatPolyColorant != 0 {
                    if ChipPA.BCoatPolyColorant == 4 {
                        HStack{
                            Text("\(PolyColorantCodes[ChipPA.BCoatPolyColorant])")
                                .font(.caption)
                            Spacer()
                            Text("Poly Colorant: Ench. Green, 1 gal")
                                .font(.caption)
                            Spacer()
                            Text("\(quant(product: PAPtABC))")
                                .font(.caption)
                        }
                    }
                    else {
                        HStack{
                            Text("\(PolyColorantCodes[ChipPA.BCoatPolyColorant])")
                                .font(.caption)
                            Spacer()
                            Text("Poly Colorant - \(PolyColorantChoices[ChipPA.BCoatPolyColorant]), 16 oz")
                                .font(.caption)
                            Spacer()
                            Text("\(quant(product: PAPtABC))")
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
                TextField("",value: $ChipPA.PCoatWaste, formatter: NumberFormatter())
                    .frame(width:30, height:25)
                    .background(Color(red:239.0/255.0, green: 243.0/255.0, blue: 244.0/250, opacity: 1.0))
                    .cornerRadius(5.0)
                Text("kit(s)")
            }
            .padding()
            HStack {
                Text("Total:")
                Spacer()
                Text("\(quant(product: PAPtABC) + ChipPA.PCoatWaste) kit(s)")
            }
    }
            .padding()
        }
    }


struct BCoatPA_Previews: PreviewProvider {
    static var previews: some View {
        BCoatGarage()
    }
}
