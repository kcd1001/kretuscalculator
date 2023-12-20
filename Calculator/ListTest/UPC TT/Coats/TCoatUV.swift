//
//  TCoat.swift
//  ListTest
//
//  Created by Kane Davidson on 1/15/21.
//

import SwiftUI

struct TCoatUV: View {
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
        
    let types = ["Urethane Polymer Concrete RC UV AP"]

    let texture = ["Anti-Slip AO 60", "Anti-Slip AO 36", "Anti-Slip AO 24", "Industrial Sand #60", "Industrial Sand #30", "Industrial Sand #20"]
        
    let textAO2 = ["No Top Coat Texture 2","Anti-Slip AO 60", "Anti-Slip AO 36", "Anti-Slip AO 24"]
        
    let textSand2 = ["No Top Coat Texture 2","Industrial Sand #60", "Industrial Sand #30", "Industrial Sand #20"]
    
    func quantPT(product : stats) -> Int {
        let quantity : Float = (sf.squareF / 200) * product.MixRat
         let kit = Int(ceil(Float(quantity / product.MixRat)))
         return kit
        } // returns number of kits required
    
    func TCoatQuantValues() {
        if upc.isTopCoat == true {
        upcChoiceRC.TCoatPtA = quantPT(product: UPCA) + upcChoiceRC.TCoatWaste //The amount of part A in top coat
        upcChoiceRC.TCoatPtB = quantPT(product: UPCB) + upcChoiceRC.TCoatWaste //The amount of part B in top coat
        upcChoiceRC.TCoatPtC = quantPT(product: UPCC) + upcChoiceRC.TCoatWaste //The amount of part C in top coat
        upcChoiceRC.TCoatColorant = quantPT(product: UPCColor ) + upcChoiceRC.TCoatWaste // The amount of colorant in top coat
//        upcChoiceRC.texture1Quant = quant(product: UPCA) + upcChoiceRC.TCoatWaste // The amount of texture 1
//        upcChoiceRC.texture2Quant = quant(product: UPCA) + upcChoiceRC.TCoatWaste // The amount of texture 2

        }
        else {
            upcChoiceRC.TCoatPtA = 0
            upcChoiceRC.TCoatPtB = 0
            upcChoiceRC.TCoatPtC = 0
            upcChoiceRC.TCoatColorant = 0
            upcChoiceRC.texture1Quant = 0
            upcChoiceRC.texture2Quant = 0
        }
    }
    
    
    var body: some View {
        
        VStack {
            Text("Choose your speed:")
             .fontWeight(.bold)
             .offset(y:5)
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
                ForEach (0 ..< types.count, id: \.self) { index in
                    Text(self.types[index]).tag(index)
                }
            }
            .background(Color.gray.opacity(0.2))
            .cornerRadius(5)
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
                HStack{
                    Text("EX-KUPCRCA6-EA")
                        .font(.caption)
                    Spacer()
                    Text("UPC Part B - RC UV AP, 6 lbs")
                        .font(.caption)
                    Spacer()
                    Text("\(quantPT(product: UPCB))")
                        .font(.caption)
                }
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
    }

struct TCoatUV_Previews: PreviewProvider {
    static var previews: some View {
        TCoat()
    }
}
