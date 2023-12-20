//
//  SplashFloorTSCoat1.swift
//  Calculator
//
//  Created by Kane Davidson on 4/12/22.
//

import SwiftUI

struct MetallicUVPCoat: View {

    
    let typesB = ["AP", "EZ", "Fast", "MVR-EZ", "MVR-FC", "TH"]
    
    let typesBCodes = ["EX-KTSEAPB-EA", "EX-KTSEZB-EA", "EX-KTSEFB-EA", "EX-KTSEMVZB-EA", "EX-KTSEMVFB-EA", "EX-KTSETHB-EA"]
    
    let pigmentChoices = ["Antique Silver", "Black", "Cabernet", "California Gold", "Carbon", "Cherrywood", "Dark Blue", "Dark Gray", "Forest Green", "Gold Glitter", "Ivory", "Jade Green", "New Copper", "Olive", "Sedona", "Silver Glitter", "Sky Blue", "Sterling", "Sunset Gold", "Violet"]
    
    let pigmentCodes = [ "EX-KMETASL-EA", "EX-KMETABL-EA", "EX-KMETACB-EA", "EX-KMETACG-EA", "EX-KMETACN-EA", "EX-KMETACW-EA", "EX-KMETADB-EA", "EX-KMETADG-EA", "EX-KMETAFG-EA", "EX-KMETGG-EA", "EX-KMETAIV-EA", "EX-KMETAJG-EA", "EX-KMETANC-EA", "EX-KMETAOL-EA", "EX-KMETASD-EA", "EX-KMETASG-EA", "EX-KMETASB-EA", "EX-KMETAST-EA", "EX-KMETASN-EA", "EX-KMETAVL-EA" ]
    
    @EnvironmentObject var tsMetallicUV : EpoxyCoveSelections //Used for coat selections
    @EnvironmentObject var sf : SquareFeet //Square feet
    @State var PCoatPtACode = "EX-KPLY72AZ-01"
    @State var PCoatHardenerCode = "EX-KPLY72B-01"
    @State var PUPtACode = "EX-KPLY72AZ-01"
    @State var PUHardenerCode = "EX-KPLY72B-01"
    @State var isSolventCleaner = false

    @State var UPCACode = "EX-KUPCARC-EA"
    @State var UPCBCode = "EX-KUPCRCA6-EA"
    @State var UPCCode = "EX-KUPCRFC-EA"


    
    func quant(product : stats) -> Int {
        let quantity : Float = (sf.squareF / product.covRate) * product.MixRat
        let kit = Int(ceil(Float(quantity / product.MixRat)))
        return kit
    } // returns number of kits required
    
    var body: some View {
        HStack {
            
            Text("Coating Thickness: 8 mils")
                .fontWeight(.heavy)
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
            Spacer()
            
 //           PCoattsMetallicUVInfo()
                
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
        
        // solvent cleaner coat option
        HStack {
            Toggle(isOn: $tsMetallicUV.Coat1SolventCleaner, label: {
                Text("Add Optional Solvent Cleaner")
                    .fontWeight(.bold)
                
            })
            .toggleStyle(CheckBoxToggleStyle())
        }
        .padding()
        
                Text("Top Shelf Epoxy® Part B:")
                    .fontWeight(.bold)
                Picker(selection: $tsMetallicUV.Coat1PtB,
                       label: ZStack {
                    Text("\(typesB[tsMetallicUV.Coat1PtB])")
                        .opacity(1)
                    Rectangle()
                        .fill(Color.gray)
                        .opacity(0.2)
                        .cornerRadius(5)
                        .frame(width: 150, height: 25)
                    //   .padding()
                }) {
                    ForEach (0 ..< typesB.count, id: \.self) { index in
                        Text(self.typesB[index]).tag(index)
                    }
                }
                .background(Color.gray.opacity(0.2))
                .cornerRadius(5)
                //             .onChange(of: tsMetallicUV.Coat1PtB) { _ in
                //                 CheckCoatChoices()
                //             }
//                Text("Metllic Pigment:")
//                    .fontWeight(.bold)
//                Picker(selection: $tsMetallicUV.Coat1TSColorant,
//                       label: ZStack {
//                    Text("\(pigmentChoices[tsMetallicUV.Coat1TSColorant])")
//                        .opacity(1)
//                    Rectangle()
//                        .fill(Color.gray)
//                        .opacity(0.2)
//                        .cornerRadius(5)
//                        .frame(width: 300, height: 25)
//                }) {
//                    ForEach (0 ..< pigmentChoices.count, id: \.self) { index in
//                        Text(self.pigmentChoices[index]).tag(index)
//                    }
//                }
//                .background(Color.gray.opacity(0.2))
//                .cornerRadius(5)
            
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
                            Text("EX-KTSECVRC-01")
                                .font(.caption)
                            Spacer()
                            Text("TSE Part A - Clear, 1 gal")
                                .font(.caption)
                            Spacer()
                            Text("\(quant(product: metallicTSA))")
                                .font(.caption)
                        }
                    
                    HStack{
                        Text("\(typesBCodes[tsMetallicUV.Coat1PtB])")
                            .font(.caption)
                        Spacer()
                        Text("Top Shelf® Epoxy Part B: \(typesB[tsMetallicUV.Coat1PtB]), 1/2 gal")
                            .font(.caption)
                        Spacer()
                        Text("\(quant(product: metallicTSB))")
                            .font(.caption)
                    }
                    
//                    HStack {
//                                Text("\(pigmentCodes[tsMetallicUV.Coat1TSColorant])")
//                                    .font(.caption)
//                                Spacer()
//                                Text("Metallic Pigment:  \(pigmentChoices[tsMetallicUV.Coat1TSColorant]), 8 oz")
//                                    .font(.caption)
//                                Spacer()
//                                Text("\(quant(product: metallicPigment))")
//                                    .font(.caption)
//                            }
                
                if tsMetallicUV.Coat1SolventCleaner == true
                {
                    HStack
                    {
                        Text("EX-KSLVCLN-EA")
                            .font(.caption)
                        Spacer()
                        Text("Solvent Cleaner, 32 oz")
                            .font(.caption)
                        Spacer()
                        Text("\(quant(product: metallicTSA))")
                            .font(.caption)
                    }
                }
            }
            .background(Color(red:239.0/255.0, green: 243.0/255.0, blue: 244.0/250, opacity: 1.0))
            .cornerRadius(5.0)
            .padding()
        
            HStack {
                Text("Add Waste Factor: ")
                Spacer()
                TextField("",value: $tsMetallicUV.Coat1Waste, formatter: NumberFormatter())
                    .frame(width:30, height:25)
                    .background(Color(red:239.0/255.0, green: 243.0/255.0, blue: 244.0/250, opacity: 1.0))
                    .cornerRadius(5.0)
                Text("kit(s)")
            }
            .padding()
            HStack {
                Text("Total:")
                Spacer()
                Text("\(quant(product: metallicTSA) + tsMetallicUV.Coat1Waste) kit(s)")
            }
            .padding()
        }
    }



struct tsMetallicUVUVPCoat_Previews: PreviewProvider {
    static var previews: some View {
        SplashFloorTSCoat1()
    }
}
