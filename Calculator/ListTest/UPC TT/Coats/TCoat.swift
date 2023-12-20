//
//  TCoat.swift
//  ListTest
//
//  Created by Kane Davidson on 1/15/21.
//

import SwiftUI

struct TCoat: View {
    @EnvironmentObject var upcChoiceRC : sysChoices //Used for coat selections
    @EnvironmentObject var UPCA : stats //Used for system stats (mixRat,CovRate, etc)
    @EnvironmentObject var UPCB : stats //Used for system stats (mixRat,CovRate, etc)
    @EnvironmentObject var UPCC : stats //Used for system stats (mixRat,CovRate, etc)
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
    
    func quantPT(product : stats) -> Int {
        let quantity : Float = (sf.squareF / 200) * product.MixRat
         let kit = Int(ceil(Float(quantity / product.MixRat)))
         return kit
        } // returns number of kits required
    
    private func TCoatQuantValues() {
        if upc.isUVRes == true {
            upcChoiceRC.TCoatSelection = 3
        }
    }
    
    
    var body: some View {
        
        VStack {
            Text("Choose your speed:")
             .fontWeight(.bold)
             .offset(y:5)
//            if upc.isUVRes != true {
            Picker(selection: $upcChoiceRC.TCoatSelection,
                label: ZStack {
                    Text("\(types[upcChoiceRC.TCoatSelection])")
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
            .onChange(of: upcChoiceRC.TCoatSelection) { _ in
                TCoatQuantValues()
            }
        }
//        else {
//            ZStack {
//                Text("UPC Part B - RC UV AP, 6 lbs")
//                    .opacity(1)
//                Rectangle()
//                    .fill(Color.gray)
//                    .opacity(0.2)
//                    .cornerRadius(5)
//                    .frame(width: 300, height: 25)
//            }
//        }
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
                    Text("\(quantPT(product: UPCA))")
                        .font(.caption)
                }
//                if upc.isUVRes != true {
                HStack{
                    switch upcChoiceRC.TCoatSelection {
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
                    switch upcChoiceRC.TCoatSelection {
                    case 0:
                        Text("UPC Part B - RC/TT - EZ, 6 lbs")
                            .font(.caption)
                    case 1:
                        Text("UPC Part B - RC/TT - AP, 6 lbs")
                            .font(.caption)
                    case 2:
                        Text("UPC Part B - RC/TT - FC, 6 lbs")
                            .font(.caption)
                    case 3:
                        Text("UPC Part B - RC UV AP, 6 lbs")
                            .font(.caption)
                    default:
                        Text("")
                    }
                    Spacer()
                    Text("\(quantPT(product: UPCB))")
                        .font(.caption)
                }
//                }
//                else {
//                    HStack{
//                        Text("EX-KUPCRCA6-EA")
//                            .font(.caption)
//                        Spacer()
//                        Text("UPC Part B - RC UV AP, 6 lbs")
//                            .font(.caption)
//                        Spacer()
//                        Text("\(quantPT(product: UPCB))")
//                            .font(.caption)
//                    }
//                }
                HStack{
                    Text("EX-KUPCRFC-EA")
                        .font(.caption)
                    Spacer()
                    Text("UPC Part C - RC, 6 lbs")
                        .font(.caption)
                    Spacer()
                    Text("\(quantPT(product: UPCC))")
                        .font(.caption)
                }
                if upcChoiceRC.TCoatSelection == 3 {
                    HStack{
                        Text("EX-KPACEL-08")
                            .font(.caption)
                        Spacer()
                        Text("Poly Accelerant, 8 oz")
                            .font(.caption)
                        Spacer()
                        Text("\(quantPT(product: UPCC))")
                            .font(.caption)
                    }
                }
                if upcChoiceRC.texture1 != upcChoiceRC.texture2 {
                    Texture1Switch()
                    Texture2Switch()
                    ColorantChoicesPT()
                }
                else {
                    Texture1Switch()
                    ColorantChoicesPT()
                }
            }
            .background(Color(red:239.0/255.0, green: 243.0/255.0, blue: 244.0/250, opacity: 1.0))
            .cornerRadius(5.0)
            .padding()
            HStack {
                Text("Add Waste Factor: ")
                Spacer()
                TextField("",value: $upcChoiceRC.TCoatWaste, formatter: NumberFormatter())
                    .frame(width:50, height:25)
                    .background(Color(red:239.0/255.0, green: 243.0/255.0, blue: 244.0/250, opacity: 1.0))
                    .cornerRadius(5.0)
                Text("kit(s)")
            } .padding()
            HStack {
                Text("Total:")
                Spacer()
                Text("\(quantPT(product: UPCA) + upcChoiceRC.TCoatWaste) kit(s)")
            } .padding()
            } 
        }
//    }

struct TCoat_Previews: PreviewProvider {
    static var previews: some View {
        TCoat()
    }
}

