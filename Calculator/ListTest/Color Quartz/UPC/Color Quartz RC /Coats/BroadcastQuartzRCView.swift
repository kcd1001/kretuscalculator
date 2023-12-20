//
//  BroadcastGarage.swift
//  Calculator
//
//  Created by Kane Davidson on 5/19/21.
//

import SwiftUI
import Combine



struct BroadcastQuartzRCView: View {
    
    @EnvironmentObject var QuartzRC : ColorQuartzRCValues //Used for coat selections
    @EnvironmentObject var sf : SquareFeet //Square feet
//    var BroadcastQuartzRC = stats(product: "Color Chip:", covRate: 0.15, MixRat: 55)
    @EnvironmentObject var TSA_QuartzRC : stats //Used for system stats (mixRat,CovRate, etc)
    @EnvironmentObject var TSB_QuartzRC : stats //Used for system stats (mixRat,CovRate, etc)
    @EnvironmentObject var TSColorant : stats //Used for system stats (mixRat,CovRate, etc)
    @EnvironmentObject var BroadcastQuartzRC : statsBroadcast
    
    @EnvironmentObject var QuartzRC_TSAC3 : stats2
    @EnvironmentObject var QuartzRC_TSBC3 : stats2
    @EnvironmentObject var QuartzRC_TSColorantC3 : stats2

    

    
    var ChipSizes = [" Q-Grade", "F-Grade", "XF-Grade"]
    
    let textureChoices = ["Aspen Green", "Autumn Red", "Black", "Blue", "Brown", "Buff", "Burgundy", "Cayman Green", "Chocolate Brown", "Clear", "Colbalt Blue", "Coral Rose", "Forest Green", "Glacier Blue", "Granite", "Gray", "Green", "Peach", "Plum", "Red", "Salt & Pepper", "Smoke", "Spice", "Suntan", "Tan", "Tobacco", "Tweed", "White", "Yellow", "Industrial Sand" ]
    
    func quantBroadcast(product : statsBroadcast) -> Int {
        let quantity : Float = (sf.squareF * product.covRate)
         let kit = Int(ceil(Float(quantity / product.MixRat)))
         return kit
        } // returns number of kits required for BroadcastQuartzRC
    
    func quant(product : stats) -> Int {
        let quantity : Float = (sf.squareF / product.covRate) * product.MixRat
        let kit = Int(ceil(Float(quantity / product.MixRat)))
        return kit
    } // returns number of kits required
    
//    func checkChipSize() {
//        if QuartzRC.BroadcastSizeSelection == 0 {
//            BroadcastQuartzRC.covRate = 0.25
//        }
//
//        else if QuartzRC.BroadcastSizeSelection == 1 {
//            BroadcastQuartzRC.covRate = 0.50
//        }
//        else if QuartzRC.BroadcastSizeSelection == 2 {
//            BroadcastQuartzRC.covRate = 0.75
//        }
//    }
    
    func updateCovRate() -> Void
    {
        // TSE cov rate
        if QuartzRC.Coat3ProductType == 0
        {
            if QuartzRC.BroadcastSizeSelection == 0
            {
                QuartzRC_TSAC3.covRate = 75
                QuartzRC_TSBC3.covRate = 75
                QuartzRC_TSColorantC3.covRate = 75
            }
            
            else if QuartzRC.BroadcastSizeSelection == 1
            {
                QuartzRC_TSAC3.covRate = 115
                QuartzRC_TSBC3.covRate = 115
                QuartzRC_TSColorantC3.covRate = 115
            }
            else if QuartzRC.BroadcastSizeSelection == 2
            {
                QuartzRC_TSAC3.covRate = 150
                QuartzRC_TSBC3.covRate = 150
                QuartzRC_TSColorantC3.covRate = 150
            }
        }
        // PolyA is chosen in cap coat
        else if QuartzRC.Coat3ProductType == 1
        {
            if QuartzRC.BroadcastSizeSelection == 0
            {
                QuartzRC_TSAC3.covRate = 75
                QuartzRC_TSBC3.covRate = 75
                QuartzRC_TSColorantC3.covRate = 75
            }
            
            else if QuartzRC.BroadcastSizeSelection == 1
            {
                QuartzRC_TSAC3.covRate = 150
                QuartzRC_TSBC3.covRate = 150
                QuartzRC_TSColorantC3.covRate = 150
            }
            else if QuartzRC.BroadcastSizeSelection == 2
            {
                QuartzRC_TSAC3.covRate = 200
                QuartzRC_TSBC3.covRate = 200
                QuartzRC_TSColorantC3.covRate = 200
            }
        }
        // PolyU in cap coat
        else if QuartzRC.Coat3ProductType == 2
        {
            if QuartzRC.BroadcastSizeSelection == 0
            {
                QuartzRC_TSAC3.covRate = 75
                QuartzRC_TSBC3.covRate = 75
                QuartzRC_TSColorantC3.covRate = 75
            }
            
            else if QuartzRC.BroadcastSizeSelection == 1
            {
                QuartzRC_TSAC3.covRate = 115
                QuartzRC_TSBC3.covRate = 115
                QuartzRC_TSColorantC3.covRate = 115
            }
            else if QuartzRC.BroadcastSizeSelection == 2
            {
                QuartzRC_TSAC3.covRate = 150
                QuartzRC_TSBC3.covRate = 150
                QuartzRC_TSColorantC3.covRate = 150
            }
        }
        
        if QuartzRC.Coat4ProductType == 0
        {
            if QuartzRC.BroadcastSizeSelection == 0
            {
                QuartzRC_TSAC4.covRate = 210
                QuartzRC_TSBC4.covRate = 210
                QuartzRC_TSColorantC4.covRate = 210
                
            }
            
            else if QuartzRC.BroadcastSizeSelection == 1
            {
                QuartzRC_TSAC4.covRate = 285
                QuartzRC_TSBC4.covRate = 285
                QuartzRC_TSColorantC4.covRate = 285
                
            }
            else if QuartzRC.BroadcastSizeSelection == 2
            {
                QuartzRC_TSAC4.covRate = 420
                QuartzRC_TSBC4.covRate = 420
                QuartzRC_TSColorantC4.covRate = 420
                
            }
        }

    }

    var body: some View {
        VStack {
            HStack {
            Text("Color Chip:")
             .fontWeight(.bold)
             Picker(selection: $QuartzRC.BroadcastSizeSelection, //used for size of chips
                 label: ZStack {
                     Text("\(ChipSizes[QuartzRC.BroadcastSizeSelection])")
                         .opacity(1)
                     Rectangle()
                         .fill(Color.gray)
                         .opacity(0.2)
                         .cornerRadius(5)
                         .frame(width: 50, height: 25)
                       //  .padding()
             }) {
                ForEach (0 ..< ChipSizes.count, id: \.self) { index in
                    Text(self.ChipSizes[index]).tag(index)
                }
             }
             .background(Color.gray.opacity(0.2))
             .cornerRadius(5)
             .onChange(of: QuartzRC.BroadcastSizeSelection) { _ in
 //                checkChipSize()
                 let temp = QuartzRC.BroadcastSizeSelection
                 QuartzRC.BroadcastSizeSelection = 0
                 QuartzRC.BroadcastSizeSelection = temp
                 updateCovRate()
             }
             .onChange(of: QuartzRC.Coat3ProductType) { _ in
//                 checkChipSize()
                 let temp = QuartzRC.BroadcastSizeSelection
                 QuartzRC.BroadcastSizeSelection = 0
                 QuartzRC.BroadcastSizeSelection = temp
                 updateCovRate()
             }
             .onChange(of: QuartzRC.Coat4ProductType) { _ in
//                 checkChipSize()
                 let temp = QuartzRC.BroadcastSizeSelection
                 QuartzRC.BroadcastSizeSelection = 0
                 QuartzRC.BroadcastSizeSelection = temp
                 updateCovRate()
             }
                Picker(selection: $QuartzRC.BroadcastSelection,
                    label: ZStack {
                        Text("\(textureChoices[QuartzRC.BroadcastSelection])")
                            .opacity(1)
                        Rectangle()
                            .fill(Color.gray)
                            .opacity(0.2)
                            .cornerRadius(5)
                            .frame(width: 200, height: 25)
                          //  .padding()
                }) {
                   ForEach (0 ..< textureChoices.count, id: \.self) { index in
                       Text(self.textureChoices[index]).tag(index)
                   }
                }
                .background(Color.gray.opacity(0.2))
                .cornerRadius(5)
                Spacer()
                QuartzRCBroadcastInfo()
            } .padding()
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
                    Text("Contact Distributor")
                        .font(.caption)
                    Spacer()
                    Text("Color Chip \(ChipSizes[QuartzRC.BroadcastSizeSelection]) - \(textureChoices[QuartzRC.BroadcastSelection]), 55#")
                        .font(.caption)
                    Spacer()
                    Text("\(quantBroadcast(product: BroadcastQuartzRC))")
                        .font(.caption)
                }
        }
            .background(Color(red:239.0/255.0, green: 243.0/255.0, blue: 244.0/250, opacity: 1.0))
            .cornerRadius(5.0)
            .padding()
            HStack {
                Text("Add Waste Factor: ")
                Spacer()
                TextField("",value: $QuartzRC.BroadcastWaste, formatter: NumberFormatter())
                    .frame(width:30, height:25)
                    .background(Color(red:239.0/255.0, green: 243.0/255.0, blue: 244.0/250, opacity: 1.0))
                    .cornerRadius(5.0)
                Text("box(es)")
            }
            .padding()
            HStack {
                Text("Total:")
                Spacer()
                Text("\(quantBroadcast(product: BroadcastQuartzRC) + QuartzRC.BroadcastWaste) bag(s)")
            }
            .padding()
        }
    }


struct BroadcastQuartzRCView_Previews: PreviewProvider {
    static var previews: some View {
        BroadcastGarage()
    }
}
}
