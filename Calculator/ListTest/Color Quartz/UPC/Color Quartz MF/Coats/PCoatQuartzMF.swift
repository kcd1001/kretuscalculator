//
//  BCoatGarage.swift
//  Calculator
//
//  Created by Kane Davidson on 5/18/21.
//

import SwiftUI
import Combine



struct PCoatQuartzMF: View {
    
 
    @EnvironmentObject var QuartzMF : ColorQuartzRCValues //Used for coat selections
    @EnvironmentObject var UPC_QuartzMF : stats //Used for system stats (mixRat,CovRate, etc)
    @EnvironmentObject var UPCColorant_QuartzMF : stats //Used for system stats (mixRat,CovRate, etc)
    @EnvironmentObject var sf : SquareFeet //Square feet
    @EnvironmentObject var BroadcastQuartzMF : statsBroadcast
    
    let typesB = ["AP", "EZ", "FC"]
    let typesBCodes = ["EX-KUPCSLB8-EA", "EX-KUPCSLZ8-EA", "EX-KUPCSLF8-EA"]
    
    var UPCColorantChoices = ["No Color (Unpigmented)", "Black", "Blue","Bone", "Brown", "Clay", "Gray", "Green", "Mustard", "Red"]
    
    var UPCColorantCodes = ["", "EX-KUPCCLBK-EA", "EX-KUPCCLBL-EA", "EX-KUPCCLWH-EA", "EX-KUPCCLBR-EA","EX-KUPCCLCL-EA", "EX-KUPCCLGY-EA", "EX-KUPCCLGR-EA", "EX-KUPCCLCY-EA","EX-KUPCCLRD-EA"]
    
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
                QuartzMFBCoatInfo()
            }
            .padding()
           Text("Choose Your Speed:")
            .fontWeight(.bold)
            Picker(selection: $QuartzMF.PCoatPtB,
                label: ZStack {
                    Text("\(typesB[QuartzMF.PCoatPtB])")
                        .opacity(1)
                    Rectangle()
                        .fill(Color.gray)
                        .opacity(0.2)
                        .cornerRadius(5)
                        .frame(width: 225, height: 25)
                      //  .padding()
            }) {
                ForEach (0 ..< typesB.count, id: \.self) { index in
                    Text(self.typesB[index]).tag(index)
                }
            }
            .background(Color.gray.opacity(0.2))
            .cornerRadius(5)

            Text("UPC Colorant:")
             .fontWeight(.bold)
             Picker(selection: $QuartzMF.PCoatTSColorant,
                 label: ZStack {
                     Text("\(UPCColorantChoices[QuartzMF.PCoatTSColorant])")
                         .opacity(1)
                     Rectangle()
                         .fill(Color.gray)
                         .opacity(0.2)
                         .cornerRadius(5)
                         .frame(width: 300, height: 25)
             }) {
                ForEach (0 ..< UPCColorantChoices.count, id: \.self) { index in
                     Text(self.UPCColorantChoices[index]).tag(index)
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
                HStack{
                    Text("EX-KUPCASL8-EA")
                        .font(.caption)
                    Spacer()
                    Text("UPC Part A - SL/MF, 8#")
                        .font(.caption)
                    Spacer()
                    Text("\(quant(product: UPC_QuartzMF))")
                        .font(.caption)
                }
            
                HStack{
                    Text("\(typesBCodes[QuartzMF.PCoatPtB])")
                        .font(.caption)
                    Spacer()
                    Text("UPC Part B - SL/MF \(typesB[QuartzMF.PCoatPtB]), 8#")
                        .font(.caption)
                    Spacer()
                    Text("\(quant(product: UPC_QuartzMF))")
                        .font(.caption)
                }
                
                HStack{
                    Text("EX-KUPCMFC-EA")
                        .font(.caption)
                    Spacer()
                    Text("UPC Part C - MF, 40#")
                        .font(.caption)
                    Spacer()
                    Text("\(quant(product: UPC_QuartzMF))")
                        .font(.caption)
                }
                
                if QuartzMF.PCoatTSColorant != 0
                {
                    HStack {
                        Text("\(UPCColorantCodes[QuartzMF.PCoatTSColorant])")
                            .font(.caption)
                        Spacer()
                        Text("UPC Colorant - \(UPCColorantChoices[QuartzMF.PCoatTSColorant]), 4 oz")
                            .font(.caption)
                        Spacer()
                        Text("\(quant(product: UPCColorant_QuartzMF))")
                            .font(.caption)
                    }
                }
            }
            .background(Color(red:239.0/255.0, green: 243.0/255.0, blue: 244.0/250, opacity: 1.0))
            .cornerRadius(5.0)
            .padding()
        }
           
            HStack {
                Text("Add Waste Factor: ")
                Spacer()
                TextField("",value: $QuartzMF.PCoatWaste, formatter: NumberFormatter())
                    .frame(width:30, height:25)
                    .background(Color(red:239.0/255.0, green: 243.0/255.0, blue: 244.0/250, opacity: 1.0))
                    .cornerRadius(5.0)
                Text("kit(s)")
            }
            .padding()
            HStack {
                Text("Total:")
                Spacer()
                Text("\(quant(product: UPC_QuartzMF) + QuartzMF.PCoatWaste) kit(s)")
            }
            .padding()
        }
    }


struct PCoatQuartzMF_Previews: PreviewProvider {
    static var previews: some View {
        BCoatGarage()
    }
}
