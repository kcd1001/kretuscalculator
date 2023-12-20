//
//  BroadcastGarage.swift
//  Calculator
//
//  Created by Kane Davidson on 5/19/21.
//

import SwiftUI
import Combine

class statsBroadcast : ObservableObject { //Structure for Each Part in coats
    @Published var product = ""
    @Published var covRate : Float = 0
    @Published var MixRat : Float = 0
    

    
    init(product: String, covRate: Float, MixRat: Float) {
        self.product = product
        self.covRate = covRate
        self.MixRat = MixRat
    }

}

struct BroadcastGarage: View {
    
    @EnvironmentObject var ChipGarage : ColorChipValues //Used for coat selections
    @EnvironmentObject var sf : SquareFeet //Square feet
//    var Broadcast = stats(product: "Color Chip:", covRate: 0.15, MixRat: 55)
    @EnvironmentObject var TSA : stats //Used for system stats (mixRat,CovRate, etc)
    @EnvironmentObject var TSB : stats //Used for system stats (mixRat,CovRate, etc)
    @EnvironmentObject var TSColorant : stats //Used for system stats (mixRat,CovRate, etc)
    @EnvironmentObject var Broadcast : statsBroadcast

    
    var ChipSizes = ["1/4\"", "1/8\""]
    
    var ChipChoices = ["Anaheim Gray", "Antler", "Avery", "Bow Tie", "Charcoal", "Coyote", "Domino", "Fog Gray", "Granite", "Gravel", "Keaton", "Lasorda Blue", "Lighthouse", "Monterey Spice", "Onyx Pearl", "Orbit", "Outback", "Pintail", "Saddle Tan", "Shorline", "Sienna", "Smoke", "Swan", "Terrier" , "Thistle", "Twilight"]
    
    func quantBroadcast(product : statsBroadcast) -> Int {
        let quantity : Float = (sf.squareF * product.covRate)
         let kit = Int(ceil(Float(quantity / product.MixRat)))
         return kit
        } // returns number of kits required for broadcast
    
    func checkChipSize() {
        if ChipGarage.BroadcastSizeSelection == 0 {
            Broadcast.covRate = 0.15
        }
        
        else if ChipGarage.BroadcastSizeSelection == 1 {
            Broadcast.covRate = 0.25
        }
    }

    var body: some View {
        VStack {
            HStack {
            Text("Color Chip:")
             .fontWeight(.bold)
             Picker(selection: $ChipGarage.BroadcastSizeSelection, //used for size of chips
                 label: ZStack {
                     Text("\(ChipSizes[ChipGarage.BroadcastSizeSelection])")
                         .opacity(1)
                     Rectangle()
                         .fill(Color.gray)
                         .opacity(0.2)
                         .cornerRadius(5)
                         .frame(width: 50, height: 25)
                       //  .padding()
             }) {
                ForEach (0 ..< ChipSizes.count, id: \.self) { index in
                    Text(self.ChipSizes[index]).tag(index)
                }
             }
             .pickerStyle(MenuPickerStyle())
             .onChange(of: ChipGarage.BroadcastSizeSelection) { _ in
                 checkChipSize()
             }
                Picker(selection: $ChipGarage.BroadcastSelection,
                    label: ZStack {
                        Text("\(ChipChoices[ChipGarage.BroadcastSelection])")
                            .opacity(1)
                        Rectangle()
                            .fill(Color.gray)
                            .opacity(0.2)
                            .cornerRadius(5)
                            .frame(width: 200, height: 25)
                          //  .padding()
                }) {
                   ForEach (0 ..< ChipChoices.count, id: \.self) { index in
                       Text(self.ChipChoices[index]).tag(index)
                   }
                } .pickerStyle(MenuPickerStyle())
            }
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
                HStack {
                    Text("Contact Distributor")
                        .font(.caption)
                    Spacer()
                    Text("Color Chip \(ChipSizes[ChipGarage.BroadcastSizeSelection]) - \(ChipChoices[ChipGarage.BroadcastSelection]), 55#")
                        .font(.caption)
                    Spacer()
                    Text("\(quantBroadcast(product: Broadcast))")
                        .font(.caption)
                }
        }
            .background(Color(red:239.0/255.0, green: 243.0/255.0, blue: 244.0/250, opacity: 1.0))
            .cornerRadius(5.0)
            .padding()
            HStack {
                Text("Add Waste Factor: ")
                Spacer()
                TextField("",value: $ChipGarage.BroadcastWaste, formatter: NumberFormatter())
                    .frame(width:30, height:25)
                    .background(Color(red:239.0/255.0, green: 243.0/255.0, blue: 244.0/250, opacity: 1.0))
                    .cornerRadius(5.0)
                Text("kit(s)")
            }
            .padding()
            HStack {
                Text("Total:")
                Spacer()
                Text("\(quantBroadcast(product: Broadcast) + ChipGarage.BroadcastWaste) kit(s)")
            }
            .padding()
        }
    }


struct BroadcastGarage_Previews: PreviewProvider {
    static var previews: some View {
        BroadcastGarage()
    }
}
}
