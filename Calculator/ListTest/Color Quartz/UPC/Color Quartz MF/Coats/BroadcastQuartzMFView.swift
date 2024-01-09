//
//  BroadcastGarage.swift
//  Calculator
//
//  Created by Kane Davidson on 5/19/21.
//

import SwiftUI
import Combine



struct BroadcastQuartzMFView: View {
    
    @EnvironmentObject var QuartzMF : ColorQuartzRCValues //Used for coat selections
    @EnvironmentObject var sf : SquareFeet //Square feet
//    var BroadcastQuartzMF = stats(product: "Color Chip:", covRate: 0.15, MixRat: 55)
    @EnvironmentObject var TSA_QuartzMF : stats //Used for system stats (mixRat,CovRate, etc)
    @EnvironmentObject var TSB_QuartzMF : stats //Used for system stats (mixRat,CovRate, etc)
    @EnvironmentObject var TSColorant : stats //Used for system stats (mixRat,CovRate, etc)
    @EnvironmentObject var BroadcastQuartzMF : statsBroadcast
    
    @EnvironmentObject var QuartzMF_TSAC3 : stats2
    @EnvironmentObject var QuartzMF_TSBC3 : stats2
    @EnvironmentObject var QuartzMF_TSColorantC3 : stats2
    

    

    
    var ChipSizes = ["Q-Grade", "F-Grade", "XF-Grade"]
    
    let textureChoices = ["Aspen Green", "Autumn Red", "Black", "Blue", "Brown", "Buff", "Burgundy", "Cayman Green", "Chocolate Brown", "Clear", "Colbalt Blue", "Coral Rose", "Forest Green", "Glacier Blue", "Granite", "Gray", "Green", "Peach", "Plum", "Red", "Salt & Pepper", "Smoke", "Spice", "Suntan", "Tan", "Tobacco", "Tweed", "White", "Yellow", "Industrial Sand" ]
    
    func updateCovRate() -> Void
    {
        // TSE cov rate
        if QuartzMF.Coat3ProductType == 0
        {
            if QuartzMF.BroadcastSizeSelection == 0
            {
                QuartzMF_TSAC3.covRate = 75
                QuartzMF_TSBC3.covRate = 75
                QuartzMF_TSColorantC3.covRate = 75
            }
            
            else if QuartzMF.BroadcastSizeSelection == 1
            {
                QuartzMF_TSAC3.covRate = 115
                QuartzMF_TSBC3.covRate = 115
                QuartzMF_TSColorantC3.covRate = 115
            }
            else if QuartzMF.BroadcastSizeSelection == 2
            {
                QuartzMF_TSAC3.covRate = 150
                QuartzMF_TSBC3.covRate = 150
                QuartzMF_TSColorantC3.covRate = 150
            }
        }
        // PolyA is chosen in cap coat
        else if QuartzMF.Coat3ProductType == 1
        {
            if QuartzMF.BroadcastSizeSelection == 0
            {
                QuartzMF_TSAC3.covRate = 75
                QuartzMF_TSBC3.covRate = 75
                QuartzMF_TSColorantC3.covRate = 75
            }
            
            else if QuartzMF.BroadcastSizeSelection == 1
            {
                QuartzMF_TSAC3.covRate = 150
                QuartzMF_TSBC3.covRate = 150
                QuartzMF_TSColorantC3.covRate = 150
            }
            else if QuartzMF.BroadcastSizeSelection == 2
            {
                QuartzMF_TSAC3.covRate = 200
                QuartzMF_TSBC3.covRate = 200
                QuartzMF_TSColorantC3.covRate = 200
            }
        }
        // PolyU in cap coat
        else if QuartzMF.Coat3ProductType == 2
        {
            if QuartzMF.BroadcastSizeSelection == 0
            {
                QuartzMF_TSAC3.covRate = 75
                QuartzMF_TSBC3.covRate = 75
                QuartzMF_TSColorantC3.covRate = 75
            }
            
            else if QuartzMF.BroadcastSizeSelection == 1
            {
                QuartzMF_TSAC3.covRate = 115
                QuartzMF_TSBC3.covRate = 115
                QuartzMF_TSColorantC3.covRate = 115
            }
            else if QuartzMF.BroadcastSizeSelection == 2
            {
                QuartzMF_TSAC3.covRate = 150
                QuartzMF_TSBC3.covRate = 150
                QuartzMF_TSColorantC3.covRate = 150
            }
        }
        
        if QuartzMF.Coat4ProductType == 0
        {
            if QuartzMF.BroadcastSizeSelection == 0
            {
                QuartzMF_TSAC4.covRate = 210
                QuartzMF_TSBC4.covRate = 210
                QuartzMF_TSColorantC4.covRate = 210
                
            }
            
            else if QuartzMF.BroadcastSizeSelection == 1
            {
                QuartzMF_TSAC4.covRate = 285
                QuartzMF_TSBC4.covRate = 285
                QuartzMF_TSColorantC4.covRate = 285
                
            }
            else if QuartzMF.BroadcastSizeSelection == 2
            {
                QuartzMF_TSAC4.covRate = 420
                QuartzMF_TSBC4.covRate = 420
                QuartzMF_TSColorantC4.covRate = 420
                
            }
        }
        
    }
    
    func quantBroadcast(product : statsBroadcast) -> Int {
        let quantity : Float = (sf.squareF * product.covRate)
         let kit = Int(ceil(Float(quantity / product.MixRat)))
         return kit
        } // returns number of kits required for BroadcastQuartzMF
    
    func quant(product : stats) -> Int {
        let quantity : Float = (sf.squareF / product.covRate) * product.MixRat
        let kit = Int(ceil(Float(quantity / product.MixRat)))
        return kit
    } // returns number of kits required
    
//    func checkChipSize() {
//        if QuartzMF.BroadcastSizeSelection == 0 {
//            BroadcastQuartzMF.covRate = 0.25
//        }
//
//        else if QuartzMF.BroadcastSizeSelection == 1 {
//            BroadcastQuartzMF.covRate = 0.50
//        }
//        else if QuartzMF.BroadcastSizeSelection == 2 {
//            BroadcastQuartzMF.covRate = 0.75
//        }
//    }
    


    var body: some View {
        VStack {
            HStack {
            Text("Color Chip:")
             .fontWeight(.bold)
             Picker(selection: $QuartzMF.BroadcastSizeSelection, //used for size of chips
                 label: ZStack {
                     Text("\(ChipSizes[QuartzMF.BroadcastSizeSelection])")
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
             .onChange(of: QuartzMF.BroadcastSizeSelection) { _ in
 //                checkChipSize()
                 let temp = QuartzMF.BroadcastSizeSelection
                 QuartzMF.BroadcastSizeSelection = 0
                 QuartzMF.BroadcastSizeSelection = temp
                 updateCovRate()
             }
             .onChange(of: QuartzMF.Coat3ProductType) { _ in
//                 checkChipSize()
                 let temp = QuartzMF.BroadcastSizeSelection
                 QuartzMF.BroadcastSizeSelection = 0
                 QuartzMF.BroadcastSizeSelection = temp
                 updateCovRate()
             }
             .onChange(of: QuartzMF.Coat4ProductType) { _ in
//                 checkChipSize()
                 let temp = QuartzMF.BroadcastSizeSelection
                 QuartzMF.BroadcastSizeSelection = 0
                 QuartzMF.BroadcastSizeSelection = temp
                 updateCovRate()
             }
//             .onChange(of: sf.squareF)
//                { _ in
//
//                    updateCovRate()
//                }

//
//                Picker(selection: $QuartzMF.BroadcastSelection,
//                    label: ZStack {
//                        Text("\(textureChoices[QuartzMF.BroadcastSelection])")
//                            .opacity(1)
//                        Rectangle()
//                            .fill(Color.gray)
//                            .opacity(0.2)
//                            .cornerRadius(5)
//                            .frame(width: 200, height: 25)
//                          //  .padding()
//                }) {
//                   ForEach (0 ..< textureChoices.count, id: \.self) { index in
//                       Text(self.textureChoices[index]).tag(index)
//                   }
//                }
//                .background(Color.gray.opacity(0.2))
//                .cornerRadius(5)
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
                    Text("Color Chip \(ChipSizes[QuartzMF.BroadcastSizeSelection]) - see Kretus color chart, 55#")
                        .font(.caption)
                    Spacer()
                    Text("\(quantBroadcast(product: BroadcastQuartzMF))")
                        .font(.caption)
                }
        }
            .background(Color(red:239.0/255.0, green: 243.0/255.0, blue: 244.0/250, opacity: 1.0))
            .cornerRadius(5.0)
            .padding()
            HStack {
                Text("Add Waste Factor: ")
                Spacer()
                TextField("",value: $QuartzMF.BroadcastWaste, formatter: NumberFormatter())
                    .frame(width:30, height:25)
                    .background(Color(red:239.0/255.0, green: 243.0/255.0, blue: 244.0/250, opacity: 1.0))
                    .cornerRadius(5.0)
                Text("box(es)")
            }
            .padding()
            HStack {
                Text("Total:")
                Spacer()
                Text("\(quantBroadcast(product: BroadcastQuartzMF) + QuartzMF.BroadcastWaste) bag(s)")
            }
            .padding()
        }
    }


struct BroadcastQuartzMFView_Previews: PreviewProvider {
    static var previews: some View {
        BroadcastGarage()
    }
}
}
