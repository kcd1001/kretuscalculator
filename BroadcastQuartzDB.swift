//
//  BroadcastGarage.swift
//  Calculator
//
//  Created by Kane Davidson on 5/19/21.
//

import SwiftUI
import Combine



struct BroadcastQuartzDB: View {
    
    @EnvironmentObject var QuartzDB : ColorQuartzDBValues //Used for coat selections
    @EnvironmentObject var sf : SquareFeet //Square feet
//    var BroadcastQuartzTS = stats(product: "Color Chip:", covRate: 0.15, MixRat: 55)
    @EnvironmentObject var TSA_QuartzDB : stats //Used for system stats (mixRat,CovRate, etc)
    @EnvironmentObject var TSB_QuartzDB : stats //Used for system stats (mixRat,CovRate, etc)
    @EnvironmentObject var TSColorant : stats //Used for system stats (mixRat,CovRate, etc)
    @EnvironmentObject var BroadcastQuartzTS : statsBroadcast
    
    @EnvironmentObject var QuartzDB_TSAC3 : stats2
    @EnvironmentObject var QuartzDB_TSBC3 : stats2
    @EnvironmentObject var QuartzDB_TSColorantC3 : stats2

    

    
    var ChipSizes = ["#20 / Q-Grade", "#30 / F-Grade", "#60 / XF-Grade"]
    
    let textureChoices = ["Aspen Green", "Autumn Red", "Black", "Blue", "Brown", "Buff", "Burgundy", "Cayman Green", "Chocolate Brown", "Clear", "Colbalt Blue", "Coral Rose", "Forest Green", "Glacier Blue", "Granite", "Gray", "Green", "Peach", "Plum", "Red", "Salt & Pepper", "Smoke", "Spice", "Suntan", "Tan", "Tobacco", "Tweed", "White", "Yellow", "Industrial Sand" ]
    
    func quantBroadcast(product : statsBroadcast) -> Int {
        let quantity : Float = (sf.squareF * product.covRate)
         let kit = Int(ceil(Float(quantity / product.MixRat)))
         return kit
        } // returns number of kits required for BroadcastQuartzTS
    
    func checkChipSize() {
        if QuartzDB.BroadcastSizeSelection == 0 {
            BroadcastQuartzTS.covRate = 0.25
        }
        
        else if QuartzDB.BroadcastSizeSelection == 1 {
            BroadcastQuartzTS.covRate = 0.50
        }
        else if QuartzDB.BroadcastSizeSelection == 2 {
            BroadcastQuartzTS.covRate = 0.75
        }
    }
    
    func updateCovRate() -> Void
    {
        // TSE cov rate
        if QuartzDB.Coat3ProductType == 0
        {
            if QuartzDB.BroadcastSizeSelection == 0
            {
                quartzTS_TSAC3.covRate = 120
                quartzTS_TSBC3.covRate = 120
                quartzTS_TSColorantC3.covRate = 120
            }
            
            else if QuartzDB.BroadcastSizeSelection == 1
            {
                quartzTS_TSAC3.covRate = 170
                quartzTS_TSBC3.covRate = 170
                quartzTS_TSColorantC3.covRate = 170
            }
            else if QuartzDB.BroadcastSizeSelection == 2
            {
                quartzTS_TSAC3.covRate = 200
                quartzTS_TSBC3.covRate = 200
                quartzTS_TSColorantC3.covRate = 200
            }
        }
        // PolyA is chosen in cap coat
        else if QuartzDB.Coat3ProductType == 1
        {
            if QuartzDB.BroadcastSizeSelection == 0
            {
                quartzTS_TSAC3.covRate = 160
                quartzTS_TSBC3.covRate = 160
                quartzTS_TSColorantC3.covRate = 160
            }
            
            else if QuartzDB.BroadcastSizeSelection == 1
            {
                quartzTS_TSAC3.covRate = 230
                quartzTS_TSBC3.covRate = 230
                quartzTS_TSColorantC3.covRate = 230
            }
            else if QuartzDB.BroadcastSizeSelection == 2
            {
                quartzTS_TSAC3.covRate = 270
                quartzTS_TSBC3.covRate = 270
                quartzTS_TSColorantC3.covRate = 270
            }
        }
        // PolyU in cap coat
        else if QuartzDB.Coat3ProductType == 2
        {
            if QuartzDB.BroadcastSizeSelection == 0
            {
                quartzTS_TSAC3.covRate = 120
                quartzTS_TSBC3.covRate = 120
                quartzTS_TSColorantC3.covRate = 120
            }
            
            else if QuartzDB.BroadcastSizeSelection == 1
            {
                quartzTS_TSAC3.covRate = 170
                quartzTS_TSBC3.covRate = 170
                quartzTS_TSColorantC3.covRate = 170
            }
            else if QuartzDB.BroadcastSizeSelection == 2
            {
                quartzTS_TSAC3.covRate = 200
                quartzTS_TSBC3.covRate = 200
                quartzTS_TSColorantC3.covRate = 200
            }
        }
        
        if QuartzDB.Coat4ProductType == 0
        {
            if QuartzDB.BroadcastSizeSelection == 0
            {
                quartzTS_TSAC4.covRate = 210
                quartzTS_TSBC4.covRate = 210
                quartzTS_TSColorantC4.covRate = 210
                
            }
            
            else if QuartzDB.BroadcastSizeSelection == 1
            {
                quartzTS_TSAC4.covRate = 285
                quartzTS_TSBC4.covRate = 285
                quartzTS_TSColorantC4.covRate = 285
                
            }
            else if QuartzDB.BroadcastSizeSelection == 2
            {
                quartzTS_TSAC4.covRate = 420
                quartzTS_TSBC4.covRate = 420
                quartzTS_TSColorantC4.covRate = 420
                
            }
        }
        
    }

    var body: some View {
        VStack {
            HStack {
            Text("Color Chip:")
             .fontWeight(.bold)
             Picker(selection: $QuartzDB.BroadcastSizeSelection, //used for size of chips
                 label: ZStack {
                     Text("\(ChipSizes[QuartzDB.BroadcastSizeSelection])")
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
             .onChange(of: QuartzDB.BroadcastSizeSelection) { _ in
                 checkChipSize()
                 updateCovRate()
             }
             .onChange(of: QuartzDB.Coat3ProductType) { _ in
                 checkChipSize()
                 updateCovRate()
             }
             .onChange(of: QuartzDB.Coat4ProductType) { _ in
                 checkChipSize()
                 updateCovRate()
             }
                Picker(selection: $QuartzDB.BroadcastSelection,
                    label: ZStack {
                        Text("\(textureChoices[QuartzDB.BroadcastSelection])")
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
                QuartzBroadcastInfo()
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
                    Text("Color Chip \(ChipSizes[QuartzDB.BroadcastSizeSelection]) - \(textureChoices[QuartzDB.BroadcastSelection]), 55#")
                        .font(.caption)
                    Spacer()
                    Text("\(quantBroadcast(product: BroadcastQuartzTS))")
                        .font(.caption)
                }
        }
            .background(Color(red:239.0/255.0, green: 243.0/255.0, blue: 244.0/250, opacity: 1.0))
            .cornerRadius(5.0)
            .padding()
            HStack {
                Text("Add Waste Factor: ")
                Spacer()
                TextField("",value: $QuartzDB.BroadcastWaste, formatter: NumberFormatter())
                    .frame(width:30, height:25)
                    .background(Color(red:239.0/255.0, green: 243.0/255.0, blue: 244.0/250, opacity: 1.0))
                    .cornerRadius(5.0)
                Text("box(es)")
            }
            .padding()
            HStack {
                Text("Total:")
                Spacer()
                Text("\(quantBroadcast(product: BroadcastQuartzTS) + QuartzDB.BroadcastWaste) bag(s)")
            }
            .padding()
        }
    }


struct BroadcastQuartzDB_Previews: PreviewProvider {
    static var previews: some View {
        BroadcastGarage()
    }
}
}
