//
//  BCoat.swift
//  ListTest
//
//  Created by Kane Davidson on 1/15/21.
//

import SwiftUI

struct BCoatSL: View {
   
    @EnvironmentObject var upcChoice : sysChoices //Used for coat selections
    @EnvironmentObject var UPCASL : stats //Used for system stats (mixRat,CovRate, etc)
    @EnvironmentObject var UPCBSL : stats //Used for system stats (mixRat,CovRate, etc)
    @EnvironmentObject var UPCCSL : stats //Used for system stats (mixRat,CovRate, etc)
    @EnvironmentObject var sf : SquareFeet //Square feet
    @State var waste : Int = 0
    
        
    let types = ["Urethane Polymer Concrete SL /EZ", "Urethane Polymer Concrete SL /AP", "Urethane Polymer Concrete SL /FC", "Urethane Polymer Concrete RC UV AP"]
    
    
    func quant(product : stats) -> Int {
        let quantity : Float = (sf.squareF / product.covRate) * product.MixRat
         let kit = Int(ceil(Float(quantity / product.MixRat)))
         return kit
        } // returns number of kits required
    
    func BCoatQuantValues() {
        upcChoice.BCoatPtA = quant(product: UPCASL) //The amount of part A in base coat
        upcChoice.BCoatPtB = quant(product: UPCBSL) //The amount of part B in base coat
        upcChoice.BCoatPtC = quant(product: UPCCSL) //The amount of part C in base coat

    }

    var body: some View {
            VStack {
               ThicknessSL()
               Text("Choose your speed:")
                .fontWeight(.bold)
                .offset(y:5)
                Picker(selection: $upcChoice.BCoatSelection,
                    label: ZStack {
                        Text("\(types[upcChoice.BCoatSelection])")
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
                        Text("EX-KUPCASL8-E")
                            .font(.caption)
                        Spacer()
                        Text("UPC Part A - SL/MF, 8 lbs")
                            .font(.caption)
                        Spacer()
                        Text("\(quant(product: UPCASL))")
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
                        Text("\(quant(product: UPCBSL))")
                            .font(.caption)
                    }
                    HStack{
                        Text("EX-KUPCSLC2-EA")
                            .font(.caption)
                        Spacer()
                        Text("UPC Part C - SL, 25 lbs")
                            .font(.caption)
                        Spacer()
                        Text("\(quant(product: UPCCSL))")
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
                    TextField("",value: $upcChoice.BCoatWaste, formatter: NumberFormatter())
                        .frame(width:50, height:25)
                        .background(Color(red:239.0/255.0, green: 243.0/255.0, blue: 244.0/250, opacity: 1.0))
                        .cornerRadius(5.0)
                    Text("kit(s)")
                } .padding()
                HStack {
                    Text("Total:")
                    Spacer()
                    Text("\(quant(product: UPCASL) + upcChoice.BCoatWaste) kit(s)")
                } .padding()
                
            }
            }
        }
    


struct BCoatSL_Previews: PreviewProvider {
    static var previews: some View {
        BCoat()
    }
}
