//
//  SysSummary.swift
//  Calculator
//
//  Created by Kane Davidson on 1/22/21.
//

import SwiftUI

struct SysSummaryMF: View {
    
    @EnvironmentObject var upcChoice : sysChoices //Used for coat selections
    @EnvironmentObject var upc : options //Used for coat checkboxes
    @EnvironmentObject var UPCAMF : stats //Used for system stats (mixRat,CovRate, etc)
    @EnvironmentObject var UPCBMF : stats //Used for system stats (mixRat,CovRate, etc)
    @EnvironmentObject var UPCCMF : stats //Used for system stats (mixRat,CovRate, etc)
    @EnvironmentObject var sf : SquareFeet //Square feet
    @EnvironmentObject var colorant : Colorant //colorant selection
    let thickness = ["1/8\"", "3/16\"", "1/4\""]
    var UPC_TC = stats(product: "Urethane Polymer Concrete Part A:", covRate: 200, MixRat: 8)


    
    
    func quant(product : stats) -> Int {
        let quantity : Float = (sf.squareF / product.covRate) * product.MixRat
         let kit = Int(ceil(Float(quantity / product.MixRat)))
         return kit
        } // returns number of kits required
   
    
    var body: some View {
        VStack
        {
            if upc.isPrimeCoat == true
            {
                VStack
                {
                    Text("Prime Coat")
                        .bold()
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
                        Text("EX-KUPCARC-E")
                            .font(.caption)
                        Spacer()
                        Text("UPC Part A - RC/TT, 6 lbs")
                            .font(.caption)
                        Spacer()
                        Text("\(quant(product: UPCAMF) + upcChoice.PCoatWaste)")
                            .font(.caption)
                    }
                    HStack{
                        switch upcChoice.PCoatSelection {
                        case 0:
                            Text("EX-KUPCRZ6-EA")
                                .font(.caption)
                        case 1:
                            Text("EX-KUPCRCA6-EA")
                                .font(.caption)
                        case 2:
                            Text("EX-KUPCRCF6-EA")
                                .font(.caption)
                        default:
                            Text("")
                        }
                        Spacer()
                        switch upcChoice.PCoatSelection {
                        case 0:
                            Text("UPC Part B - RC/TT - EZ, 8 lbs")
                                .font(.caption)
                        case 1:
                            Text("UPC Part B - RC/TT - AP, 8 lbs")
                                .font(.caption)
                        case 2:
                            Text("UPC Part B - RC/TT - FC, 8 lbs")
                                .font(.caption)
                        default:
                            Text("")
                        }
                        Spacer()
                        Text("\(quant(product: UPCBMF) + upcChoice.PCoatWaste)")
                            .font(.caption)
                    }
                    HStack{
                        Text("EX-KUPCRFC-EA")
                            .font(.caption)
                        Spacer()
                        Text("UPC Part C - RC, 6 lbs")
                            .font(.caption)
                        Spacer()
                        Text("\(quant(product: UPCCMF) + upcChoice.PCoatWaste)")
                            .font(.caption)
                    }
                    ColorantChoices()
                }
                .background(Color(red:239.0/255.0, green: 243.0/255.0, blue: 244.0/250, opacity: 1.0))
                .cornerRadius(5.0)
                .padding()
            }
            
            VStack
            {
                Text("Base Coat")
                    .bold()
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
                    Text("EX-KUPCAMF8-E")
                        .font(.caption)
                    Spacer()
                    Text("UPC Part A - SL/MF, 8 lbs")
                        .font(.caption)
                    Spacer()
                    Text("\(quant(product: UPCAMF) + upcChoice.BCoatWaste)")
                        .font(.caption)
                }
                HStack{
                    switch upcChoice.BCoatSelection {
                    case 0:
                        Text("EX-KUPCSLZ8-EA")
                            .font(.caption)
                    case 1:
                        Text("EX-KUPCSLB8-EA")
                            .font(.caption)
                    case 2:
                        Text("EX-KUPCSLF8-EA")
                            .font(.caption)
                    default:
                        Text("")
                    }
                    Spacer()
                    switch upcChoice.BCoatSelection {
                    case 0:
                        Text("UPC Part B - SL/MF - EZ, 8 lbs")
                            .font(.caption)
                    case 1:
                        Text("UPC Part B - SL/MF - AP, 8 lbs")
                            .font(.caption)
                    case 2:
                        Text("UPC Part B - SL/MF - FC, 8 lbs")
                            .font(.caption)
                    default:
                        Text("")
                    }
                    Spacer()
                    Text("\(quant(product: UPCBMF) + upcChoice.BCoatWaste)")
                        .font(.caption)
                }
                HStack{
                    Text("EX-KUPCMFC-EA")
                        .font(.caption)
                    Spacer()
                    Text("UPC Part C - MF, 40 lbs")
                        .font(.caption)
                    Spacer()
                    Text("\(quant(product: UPCCMF) + upcChoice.BCoatWaste)")
                        .font(.caption)
                }
                ColorantChoices()
            }
            .background(Color(red:239.0/255.0, green: 243.0/255.0, blue: 244.0/250, opacity: 1.0))
            .cornerRadius(5.0)
            .padding()
            
            if upc.isTopCoat == true
            {
                VStack
                {
                    Text("Top Coat")
                        .bold()
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
                        Text("EX-KUPCARC-E")
                            .font(.caption)
                        Spacer()
                        Text("UPC Part A - RC/TT, 6 lbs")
                            .font(.caption)
                        Spacer()
                        Text("\(quant(product: UPC_TC) + upcChoice.TCoatWaste)")
                            .font(.caption)
                    }
                    HStack{
                        switch upcChoice.TCoatSelection {
                        case 0:
                            Text("EX-KUPCRZ6-EA")
                                .font(.caption)
                        case 1:
                            Text("EX-KUPCRCA6-EA")
                                .font(.caption)
                        case 2:
                            Text("EX-KUPCRCF6-EA")
                                .font(.caption)
                        case 3:
                            Text("EX-KUPCRCA6-EA")
                                .font(.caption)
                        default:
                            Text("")
                        }
                        Spacer()
                        switch upcChoice.TCoatSelection {
                        case 0:
                            Text("UPC Part B - RC/TT - EZ, 8 lbs")
                                .font(.caption)
                        case 1:
                            Text("UPC Part B - RC/TT - AP, 8 lbs")
                                .font(.caption)
                        case 2:
                            Text("UPC Part B - RC/TT - FC, 8 lbs")
                                .font(.caption)
                        case 3:
                            Text("UPC Part B - RC UV AP, 6 lbs")
                                .font(.caption)
                        default:
                            Text("")
                        }
                        Spacer()
                        Text("\(quant(product: UPC_TC) + upcChoice.TCoatWaste)")
                            .font(.caption)
                    }
                    HStack{
                        Text("EX-KUPCRFC-EA")
                            .font(.caption)
                        Spacer()
                        Text("UPC Part C - RC, 6 lbs")
                            .font(.caption)
                        Spacer()
                        Text("\(quant(product: UPC_TC))")
                            .font(.caption)
                    }
                    if upcChoice.TCoatSelection == 3 {
                        HStack{
                            Text("EX-KPACEL-08")
                                .font(.caption)
                            Spacer()
                            Text("Poly Accelerant, 8 oz")
                                .font(.caption)
                            Spacer()
                            Text("\(quant(product: UPC_TC) + upcChoice.TCoatWaste)")
                                .font(.caption)
                        }
                    }
                    if upcChoice.texture1 != upcChoice.texture2 {
                        Texture1Switch()
                        Texture2Switch()
                        ColorantChoices()
                    }
                    else {
                        Texture1Switch()
                        ColorantChoices()
                    }
                }
                .background(Color(red:239.0/255.0, green: 243.0/255.0, blue: 244.0/250, opacity: 1.0))
                .cornerRadius(5.0)
                .padding()
            }
            
        }
    }
}

struct SysSummaryMF_Previews: PreviewProvider {
    static var previews: some View {
        SysSummary()
    }
}
