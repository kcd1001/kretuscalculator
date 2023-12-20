//
//  BCoatGarage.swift
//  Calculator
//
//  Created by Kane Davidson on 5/18/21.
//

import SwiftUI
import Combine



struct PCoatPA: View {
    
 
    @EnvironmentObject var ChipPA : ColorChipValuesPA //Used for coat selections
    @EnvironmentObject var PAPtA : stats //Used for system stats (mixRat,CovRate, etc)
    @EnvironmentObject var PAPtB : stats //Used for system stats (mixRat,CovRate, etc)
    @EnvironmentObject var PolyColorant_PA : stats //Used for system stats (mixRat,CovRate, etc)
    @EnvironmentObject var SolventCleaner : stats 
    @EnvironmentObject var sf : SquareFeet //Square feet
    @EnvironmentObject var Broadcast : statsBroadcast
    @State var PCoatPtACode = "EX-KPLY72AZ-01"
    @State var PCoatHardenerCode = "EX-KPLY72B-01"


    
    let typesA = ["Polyaspartic 72", "Polyaspartic 85", "Polyaspartic 92 Low Odor"]
    var PartAHardeners = ["EZ - Clear", "Fast - Clear"]
    
    var PtBCodes = ["EX-KPLY72B-01","EX-KPLY85B-01", "EX-KPLY92B-01", "EX-KPLYHSB-EA"]
    
    let Hardeners = ["AP", "EZ", "Fast", "MVR - EZ", "MVR - FC", "TH"]
    
    let PolyColorantChoices = ["No Color (pre-pigmented Part A)", "Beige", "Black", "Dark Gray", "Enchanted Green", "Handicap Blue", "Latte", "Light Gray", "Medium Gray", "Mocha", "Safety Blue", "Safety Red", "Safety Yellow", "Shadow Gray", "Tan", "Tile Red", "White",]
    
    let PolyColorantCodes = ["No Color (pre-pigmented Part A)", "EX-KPLYCLBG-EA", "EX-KPLYCLBL-EA", "EX-KPLYCLDG-EA", "EX-KPLYCLEG-EA", "EX-KPLYCLHB-EA", "EX-KPLYCLLT-EA", "EX-KPLYCLLG-EA", "EX-KPLYCLMG-EA", "EX-KPLYCLMC-EA", "EX-KPLYCLSB-EA", "EX-KPLYCLSR-EA", "EX-KPLYCLSY-EA", "EX-KPLYCLSG-EA", "EX-KPLYCLTN-EA", "EX-KPLYCLTR-EA", "EX-KPLYCLWH-01",]
    
    func quant(product : stats) -> Int {
        let quantity : Float = (sf.squareF / product.covRate) * product.MixRat
         let kit = Int(ceil(Float(quantity / product.MixRat)))
         return kit
        } // returns number of kits required
    
    func checkPCoatCodes() -> Void {
    
    if ChipPA.PCoatPtA == 0 && ChipPA.PCoatHardener == 0 {
        PCoatPtACode = "EX-KPLY72AZ-01"
        PCoatHardenerCode = "EX-KPLY72B-01"
    }
    else if ChipPA.PCoatPtA == 0 && ChipPA.PCoatHardener == 1 {
        PCoatPtACode = "EX-KPLY72AF-01"
        PCoatHardenerCode = "EX-KPLY72B-01"

    }
    else if ChipPA.PCoatPtA == 1 && ChipPA.PCoatHardener == 0 {
        PCoatPtACode = "EX-KPLY85AZ-01"
        PCoatHardenerCode = "EX-KPLY85B-01"
    }
    else if ChipPA.PCoatPtA == 1 && ChipPA.PCoatHardener == 1 {
        PCoatPtACode = "EX-KPLY85AF-01"
        PCoatHardenerCode = "EX-KPLY85B-01"

    }
    else if ChipPA.PCoatPtA == 2 && ChipPA.PCoatHardener == 0 {
        PCoatPtACode = "EX-KPLY92AZ-01"
        PCoatHardenerCode = "EX-KPLY92B-01"

    }
    else if ChipPA.PCoatPtA == 2 && ChipPA.PCoatHardener == 1 {
        PCoatPtACode = "EX-KPLY92AF-01"
        PCoatHardenerCode = "EX-KPLY92B-01"

    }
}

    
  
    
    var body: some View {
        VStack {
            HStack {
                Text("Coating Thickness: 2-3 mils")
                    .fontWeight(.heavy)
                Spacer()
                ChipPAPrimeCoatInfo()
            }
            .padding()
               Text("Polyaspartic:")
                .fontWeight(.bold)
            PCoatPicker()
                .onChange(of: ChipPA.PCoatPtA) { _ in
                            checkPCoatCodes()
                         }
                .onChange(of: ChipPA.PCoatHardener) { _ in
                            checkPCoatCodes()
                         }
            Text("Poly Colorant:")
             .fontWeight(.bold)
             Picker(selection: $ChipPA.PCoatPolyColorant,
                 label: ZStack {
                     Text("\(PolyColorantChoices[ChipPA.PCoatPolyColorant])")
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
                HStack{ // Part A
                    Text("\(PCoatPtACode)")
                        .font(.caption)
                    Spacer()
                    Text(" \(typesA[ChipPA.PCoatPtA]) - \(PartAHardeners[ChipPA.PCoatHardener]) 1 gl")
                        .font(.caption)
                    Spacer()
                    Text("\(quant(product: PAPtA))")
                        .font(.caption)
                }
                HStack{ // Hardener
                    Text("\(PCoatHardenerCode)")
                        .font(.caption)
                    Spacer()
                    Text(" \(typesA[ChipPA.PCoatPtA]) Part B, 1 gl")
                        .font(.caption)
                    Spacer()
                    Text("\(quant(product: PAPtA))")
                        .font(.caption)
                }
                HStack{ // Solvent Cleaner 
                    Text("EX-KSLVCLN-EA")
                        .font(.caption)
                    Spacer()
                    Text("Solvent Cleaner, 32 oz")
                        .font(.caption)
                    Spacer()
                    Text("\(quant(product: PAPtA))")
                        .font(.caption)
                }
                if ChipPA.PCoatPolyColorant != 0 {
                    if ChipPA.PCoatPolyColorant == 4 {
                        HStack{
                            Text("\(PolyColorantCodes[ChipPA.PCoatPolyColorant])")
                                .font(.caption)
                            Spacer()
                            Text("Poly Colorant: Ench. Green, 16 oz")
                                .font(.caption)
                            Spacer()
                            Text("\(quant(product: PAPtA))")
                                .font(.caption)
                        }
                    }
                    else {
                        HStack{
                            Text("\(PolyColorantCodes[ChipPA.PCoatPolyColorant])")
                                .font(.caption)
                            Spacer()
                            Text("Poly Colorant - \(PolyColorantChoices[ChipPA.PCoatPolyColorant]), 16 oz")
                                .font(.caption)
                            Spacer()
                            Text("\(quant(product: PAPtA))")
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
                Text("\(quant(product: PAPtA) + ChipPA.PCoatWaste) kit(s)")
            }
    }
            .padding()
        }
    }


struct PCoatPA_Previews: PreviewProvider {
    static var previews: some View {
        BCoatGarage()
    }
}
