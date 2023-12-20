//
//  PCoat.swift
//  ListTest
//
//  Created by Kane Davidson on 1/15/21.
//

import SwiftUI

struct PCoatSL: View {
    @EnvironmentObject var upcChoice : sysChoices //Used for coat selections
    @EnvironmentObject var UPCASL : stats //Used for system stats (mixRat,CovRate, etc)
    @EnvironmentObject var UPCBSL : stats //Used for system stats (mixRat,CovRate, etc)
    @EnvironmentObject var UPCCSL : stats //Used for system stats (mixRat,CovRate, etc)
    @EnvironmentObject var sf : SquareFeet //Square feet
    @State var waste : Int = 0
    
    let types = ["Urethane Polymer Concrete RC /EZ", "Urethane Polymer Concrete RC /AP", "Urethane Polymer Concrete RC /FC", "Urethane Polymer Concrete RC UV AP"]

    func quant(product : stats) -> Int {
        let quantity : Float = (sf.squareF / product.covRate) * product.MixRat
         let kit = Int(ceil(Float(quantity / product.MixRat)))
         return kit
        } // returns number of kits required
    func PCoatQuantValues() {
        upcChoice.PCoatPtA = quant(product: UPCASL) //The amount of part A in prime coat
        upcChoice.PCoatPtB = quant(product: UPCBSL) //The amount of part B in prime coat
        upcChoice.PCoatPtC = quant(product: UPCCSL) //The amount of part C in prime coat
    }
    
    var body: some View {
        
        VStack {
            Text("Choose your speed:")
             .fontWeight(.bold)
             .offset(y:5)
            Picker(selection: $upcChoice.PCoatSelection,
                label: ZStack {
                    Text("\(types[upcChoice.PCoatSelection])")
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
                    Text("EX-KUPCARC-E")
                        .font(.caption)
                    Spacer()
                    Text("UPC Part A - RC/TT, 6 lbs")
                        .font(.caption)
                    Spacer()
                    Text("\(quant(product: UPCASL))")
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
                    Text("\(quant(product: UPCBSL))")
                        .font(.caption)
                }
                HStack{
                    Text("EX-KUPCRFC-EA")
                        .font(.caption)
                    Spacer()
                    Text("UPC Part C - RC, 6 lbs")
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
                TextField("",value: $upcChoice.PCoatWaste, formatter: NumberFormatter())
                    .frame(width:50, height:25)
                    .background(Color(red:239.0/255.0, green: 243.0/255.0, blue: 244.0/250, opacity: 1.0))
                    .cornerRadius(5.0)
                Text("kit(s)")
                } .padding()
            }
            
            HStack {
                Text("Total:")
                Spacer()
                Text("\(quant(product: UPCASL) + upcChoice.PCoatWaste) kit(s)")
            } .padding()
            } 
        }
    


struct PCoatSL_Previews: PreviewProvider {
    static var previews: some View {
        PCoat()
    }
}
