//
//  EpoxyCoveColorSysSummary.swift
//  Calculator
//
//  Created by Kane Davidson on 7/4/22.
//

import SwiftUI

struct UPCCoveSysSummary: View {
    
    @EnvironmentObject var CoveColor : EpoxyCoveSelections //Used for coat selections
    @EnvironmentObject var sf : SquareFeet //Square feet
    
    @EnvironmentObject var bCoatCoveUPCA : stats2
    @EnvironmentObject var bCoatCoveUPCB : stats2
    @EnvironmentObject var bCoatCoveUPCColorant : stats2
    @EnvironmentObject var bCoatCoveTexture : stats2
    
    let WCtypesB = ["AP", "EZ", "Fast" ]
    let WCtypesBCodes = ["EX-KUPCWCZ3-EA", "EX-KUPCWCF3-EA"]


    let typesB = ["AP", "EZ", "Fast" ]
    let typesBCodes = ["EX-KUPCRCA6-EA", "EX-KUPCRCZ6-EA", "EX-KUPCRCF6-EA"]

    let UPCColorantChoices = ["No Color (Unpigmented)", "Black", "Blue","Bone", "Brown", "Clay", "Gray", "Green", "Mustard", "Red"]
    
    let UPCColorantCodes = ["", "EX-KUPCCLBK-EA", "EX-KUPCCLBL-EA", "EX-KUPCCLWH-EA", "EX-KUPCCLBR-EA","EX-KUPCCLCL-EA", "EX-KUPCCLGY-EA", "EX-KUPCCLGR-EA", "EX-KUPCCLCY-EA","EX-KUPCCLRD-EA"]
    
    func quant(product : stats) -> Int {
        let quantity : Float = (sf.squareF / product.covRate) * product.MixRat
        let kit = Int(ceil(Float(quantity / product.MixRat)))
        return kit
    } // returns number of kits required
    
    var body: some View {
        
        Text("Prime Coat")
            .bold()
        
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
                Text("EX-KUPCARC-EA")
                    .font(.caption)
                Spacer()
                Text("UPC Part A - RC/TT, 6#")
                    .font(.caption)
                Spacer()
                Text("\(quant(product: coveUPCA) + CoveColor.Coat1Waste)")
                    .font(.caption)
            }
            
            HStack{
                Text("\(typesBCodes[CoveColor.Coat1PtB])")
                    .font(.caption)
                Spacer()
                Text("UPC Part B - RC/TT \(typesB[CoveColor.Coat1PtB]), 6#")
                    .font(.caption)
                Spacer()
                Text("\(quant(product: coveUPCB) + CoveColor.Coat1Waste)")
                    .font(.caption)
            }
            HStack
            {
                Text("EX-KUPCRFC-EA")
                    .font(.caption)
                Spacer()
                Text("UPC Part C - RC, 6#")
                    .font(.caption)
                Spacer()
                Text("\(quant(product: coveUPCA) + CoveColor.Coat1Waste)")
                    .font(.caption)
            }
            
            if CoveColor.Coat1TSColorant != 0
            {
                HStack {
                    Text("\(UPCColorantCodes[CoveColor.Coat1TSColorant])")
                        .font(.caption)
                    Spacer()
                    Text("UPC Colorant: \(UPCColorantChoices[CoveColor.Coat1TSColorant]), 16 oz")
                        .font(.caption)
                    Spacer()
                    Text("\(quant(product: coveUPCColorant))")
                        .font(.caption)
                }
            }
            
            
        }
        .background(Color(red:239.0/255.0, green: 243.0/255.0, blue: 244.0/250, opacity: 1.0))
        .cornerRadius(5.0)
        .padding()
        
        Text("Body Coat")
            .bold()
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
                Text("EX-KUPCAWC-EA")
                    .font(.caption)
                Spacer()
                Text("UPC Part A - WC/VC, 3#")
                    .font(.caption)
                Spacer()
                Text("\(quant(product: bCoatCoveUPCA) + CoveColor.Coat2Waste)")
                    .font(.caption)
            }
            
            HStack{
                Text("\(WCtypesBCodes[CoveColor.Coat2PtB])")
                    .font(.caption)
                Spacer()
                Text("UPC Part B - WC/VC \(WCtypesB[CoveColor.Coat2PtB]), 3#")
                    .font(.caption)
                Spacer()
                Text("\(quant(product: bCoatCoveUPCB) + CoveColor.Coat2Waste)")
                    .font(.caption)
            }
            
            HStack{
                Text("EX-KUPCWCC3-EA")
                    .font(.caption)
                Spacer()
                Text("UPC Part C - WC \(typesB[CoveColor.Coat2PtB]), 30#")
                    .font(.caption)
                Spacer()
                Text("\(quant(product: bCoatCoveUPCB))")
                    .font(.caption)
            }
            
            if CoveColor.Coat2TSColorant != 0
            {
                HStack {
                    Text("\(UPCColorantCodes[CoveColor.Coat2TSColorant])")
                        .font(.caption)
                    Spacer()
                    Text("UPC Colorant: \(UPCColorantChoices[CoveColor.Coat2TSColorant]), 16 oz")
                        .font(.caption)
                    Spacer()
                    Text("\(quant(product: bCoatCoveUPCColorant))")
                        .font(.caption)
                }
            }
        }
        .background(Color(red:239.0/255.0, green: 243.0/255.0, blue: 244.0/250, opacity: 1.0))
        .cornerRadius(5.0)
        .padding()
        
        Text("Cap Coat")
            .bold()
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
                Text("EX-KUPCARC-EA")
                    .font(.caption)
                Spacer()
                Text("UPC Part A - RC/TT, 6#")
                    .font(.caption)
                Spacer()
                Text("\(quant(product: coveUPCA) + CoveColor.Coat3Waste)")
                    .font(.caption)
            }
            
            HStack{
                Text("\(typesBCodes[CoveColor.Coat3PtB])")
                    .font(.caption)
                Spacer()
                Text("UPC Part B - RC/TT \(typesB[CoveColor.Coat3PtB]), 6#")
                    .font(.caption)
                Spacer()
                Text("\(quant(product: coveUPCB) + CoveColor.Coat3Waste)")
                    .font(.caption)
            }
            
            HStack
            {
                Text("EX-KUPCRFC-EA")
                    .font(.caption)
                Spacer()
                Text("UPC Part C - RC, 6#")
                    .font(.caption)
                Spacer()
                Text("\(quant(product: coveUPCA) + CoveColor.Coat3Waste)")
                    .font(.caption)
            }
            if CoveColor.Coat3TSColorant != 0
            {
                HStack {
                    Text("\(UPCColorantCodes[CoveColor.Coat3TSColorant])")
                        .font(.caption)
                    Spacer()
                    Text("UPC Colorant:  \(UPCColorantChoices[CoveColor.Coat3TSColorant]), 16 oz")
                        .font(.caption)
                    Spacer()
                    Text("\(quant(product: coveUPCColorant))")
                        .font(.caption)
                }
            }
            
            
        }
        .background(Color(red:239.0/255.0, green: 243.0/255.0, blue: 244.0/250, opacity: 1.0))
        .cornerRadius(5.0)
        .padding()
    }
}

struct UPCCoveSysSummary_Previews: PreviewProvider {
    static var previews: some View {
        EpoxyCoveColorSysSummary()
    }
}
