//
//  TCoat.swift
//  ListTest
//
//  Created by Kane Davidson on 1/15/21.
//

import SwiftUI

struct TCoatMF: View {
    @EnvironmentObject var upcChoice : sysChoices //Used for coat selections
    @EnvironmentObject var UPCAMF : stats //Used for system stats (mixRat,CovRate, etc)
    @EnvironmentObject var UPCBMF : stats //Used for system stats (mixRat,CovRate, etc)
    @EnvironmentObject var UPCCMF : stats //Used for system stats (mixRat,CovRate, etc)
    @EnvironmentObject var UPCColor : stats
    @EnvironmentObject var upc : options //Used for coat checkboxes
    @EnvironmentObject var sf : SquareFeet //Square feet
    @EnvironmentObject var Colorant : Colorant
    @EnvironmentObject var system : options 
    @State var waste : Int = 0
    
    let thickness = ["5-7 mils" , "8-12 mils", "25-30 mils"]
        
    let types = ["Urethane Polymer Concrete RC /EZ", "Urethane Polymer Concrete RC /AP", "Urethane Polymer Concrete RC /FC", "Urethane Polymer Concrete RC UV AP"]
    let texture = ["Anti-Slip AO 60", "Anti-Slip AO 36", "Anti-Slip AO 24", "Industrial Sand #60", "Industrial Sand #30", "Industrial Sand #20"]
        
    let textAO2 = ["No Top Coat Texture 2","Anti-Slip AO 60", "Anti-Slip AO 36", "Anti-Slip AO 24"]
        
    let textSand2 = ["No Top Coat Texture 2","Industrial Sand #60", "Industrial Sand #30", "Industrial Sand #20"]
    
    var UPC_TC = stats(product: "Urethane Polymer Concrete Part A:", covRate: 200, MixRat: 8)

    
    func quant(product : stats) -> Int {
        let quantity : Float = (sf.squareF / product.covRate) * product.MixRat
         let kit = Int(ceil(Float(quantity / product.MixRat)))
         return kit
        } // returns number of kits required
    
    private func TCoatQuantValues() {
        if upc.isUVRes == true {
            upcChoice.TCoatSelection = 3
        }
    }
    
    
    var body: some View {
        
        VStack {
            Text("Choose your speed:")
             .fontWeight(.bold)
             .offset(y:5)
            Picker(selection: $upcChoice.TCoatSelection,
                label: ZStack {
                    Text("\(types[upcChoice.TCoatSelection])")
                        .opacity(1)
                    Rectangle()
                        .fill(Color.gray)
                        .opacity(0.2)
                        .cornerRadius(5)
                        .frame(width: 300, height: 25)
            }) {
                ForEach (0 ..< 3) { index in
                    Text(self.types[index]).tag(index)
                }
            }
            .background(Color.gray.opacity(0.2))
            .cornerRadius(5)
            .onChange(of: upcChoice.TCoatSelection) { _ in
                TCoatQuantValues()
            }
            if system.isTexture == true {
                Texture() 
            }
            VStack() {
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
                    Text("\(quant(product: UPC_TC))")
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
                    Text("\(quant(product: UPC_TC))")
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
                        Text("\(quant(product: UPC_TC))")
                            .font(.caption)
                    }
                }
                if upcChoice.texture1 != upcChoice.texture2  {
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
            HStack {
                Text("Add Waste Factor: ")
                Spacer()
                TextField("",value: $upcChoice.TCoatWaste, formatter: NumberFormatter())
                    .frame(width:50, height:25)
                    .background(Color(red:239.0/255.0, green: 243.0/255.0, blue: 244.0/250, opacity: 1.0))
                    .cornerRadius(5.0)
                Text("kit(s)")
            } .padding()
            HStack {
                Text("Total:")
                Spacer()
                Text("\(quant(product: UPC_TC) + upcChoice.TCoatWaste) kit(s)")
            } .padding()
            } 
        }
    }

struct TCoatMF_Previews: PreviewProvider {
    static var previews: some View {
        TCoat()
    }
}
