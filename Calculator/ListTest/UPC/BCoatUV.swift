//
//  BCoat.swift
//  ListTest
//
//  Created by Kane Davidson on 1/15/21.
//

import SwiftUI

struct BCoatUV: View {
   
    @EnvironmentObject var upcChoiceRC : sysChoices //Used for coat selections
    @EnvironmentObject var UPCA : stats //Used for system stats (mixRat,CovRate, etc)
    @EnvironmentObject var UPCB : stats //Used for system stats (mixRat,CovRate, etc)
    @EnvironmentObject var UPCC : stats //Used for system stats (mixRat,CovRate, etc)
    @EnvironmentObject var sf : SquareFeet //Square feet
    @State var waste : Int = 0
    
        
    let types = ["Urethane Polymer Concrete RC UV AP"]

    
    func quant(product : stats) -> Int {
        let quantity : Float = (sf.squareF / product.covRate) * product.MixRat
         let kit = Int(ceil(Float(quantity / product.MixRat)))
         return kit
        } // returns number of kits required
    
    func BCoatQuantValues() {
        upcChoiceRC.BCoatPtA = quant(product: UPCA) //The amount of part A in base coat
        upcChoiceRC.BCoatPtB = quant(product: UPCB) //The amount of part B in base coat
        upcChoiceRC.BCoatPtC = quant(product: UPCC) //The amount of part C in base coat

    }

    var body: some View {
            VStack {
               ThicknessUV() 
               Text("Choose your speed:")
                .fontWeight(.bold)
                .offset(y:5)
                Picker(selection: $upcChoiceRC.BCoatSelection,
                    label: ZStack {
                        Text("\(types[upcChoiceRC.BCoatSelection])")
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
                VStack {
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
                        Text("\(quant(product: UPCA))")
                            .font(.caption)
                    }
                    HStack{
                        Text("EX-KUPCRCA6-EA")
                            .font(.caption)
                        Spacer()
                        Text("UPC Part B - RC UV AP, 6 lbs")
                            .font(.caption)
                        Spacer()
                        Text("\(quant(product: UPCB))")
                            .font(.caption)
                    }
                    HStack{
                        Text("EX-KUPCRFC-EA")
                            .font(.caption)
                        Spacer()
                        Text("UPC Part C - RC, 6 lbs")
                            .font(.caption)
                        Spacer()
                        Text("\(quant(product: UPCC))")
                            .font(.caption)
                    }
                    HStack{
                        Text("EX-KPACEL-08")
                            .font(.caption)
                        Spacer()
                        Text("Poly Accelerant, 8 oz")
                            .font(.caption)
                        Spacer()
                        Text("\(quant(product: UPCC))")
                            .font(.caption)
                    }
                    ColorantChoices()
                }
                .background(Color(red:239.0/255.0, green: 243.0/255.0, blue: 244.0/250, opacity: 1.0))
                .cornerRadius(5.0)
                .padding()
                HStack {
                    Text("Add Waste Factor: ")
                    Spacer()
                    TextField("",value: $upcChoiceRC.BCoatWaste, formatter: NumberFormatter())
                        .frame(width:50, height:25)
                        .background(Color(red:239.0/255.0, green: 243.0/255.0, blue: 244.0/250, opacity: 1.0))
                        .cornerRadius(5.0)
                    Text("kit(s)")
                } .padding()
                HStack {
                    Text("Total:")
                    Spacer()
                    Text("\(quant(product: UPCA) + upcChoiceRC.BCoatWaste) kit(s)")
                } .padding()
                
            }
            }
        }
    


struct BCoatUV_Previews: PreviewProvider {
    static var previews: some View {
        BCoat()
    }
}

