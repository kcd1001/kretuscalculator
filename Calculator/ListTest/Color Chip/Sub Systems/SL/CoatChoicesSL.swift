//
//  CoatChoicesGarage.swift
//  Calculator
//
//  Created by Kane Davidson on 5/18/21.
//

import SwiftUI
import Combine

var ChipSLUPCA = stats(product: "Urethane Polymer Concrete Part A:", covRate: 330, MixRat: 6)
var ChipSLUPCB = stats(product: "Urethane Polymer Concrete Part B:", covRate: 330, MixRat: 6)
var ChipSLUPCC = stats(product: "Urethane Polymer Concrete Part C:", covRate: 330, MixRat: 6)
var ChipSLUPCColorant = stats(product: "Urethane Polymer Concrete Colorant", covRate: 330, MixRat: 4)


class ColorChipValuesSL : ObservableObject {
    @Published var BCoatPtB : Int = 0 // Used for part pickers in base coat
    @Published var BCoatColor : Int = 0 // Used for part pickers in base coat
    @Published var BCoatWaste : Int = 0 // Waste in base coat
    @Published var PCoatColor : Int = 0 // Used for part pickers in base coat
    @Published var PCoatPtB : Int = 0 // Used for part pickers in base coat
    @Published var PCoatTSColorant : Int = 0 // Used for part pickers in base coat
    @Published var MVRCoatColor : Int = 0 // Used for part pickers in base coat
    @Published var BroadcastSizeSelection  = 0 // for prime coat picker
    @Published var BroadcastSelection : Int  = 0 // for top coat picker
    @Published var BroadcastWaste : Int = 0
    @Published var QuantPCoatPtA : Int = 0
    @Published var QuantPCoatPtB : Int = 0
    @Published var QuantPCoatPtC : Int = 0
    @Published var QuantBCoatColor : Int = 0 // The quantity of part A in base coat
    @Published var QuantPCoatColor : Int = 0 // The quantity of part A in prime coat
    @Published var PCoatWaste : Int = 0 // Waste in prime coat
    @Published var TCoat1Choice: Int = 2 // The product chosen in top coat 1
    @Published var TCoat1Hardener : Int = 0 // The hardener chosen in top coat 1
    @Published var TCoat2Choice: Int = 6 // The product chosen in top coat 2
    @Published var TCoat2Hardener : Int = 0 // The hardener chosen in top coat 1
//        @Published var QuantTCoatPtB : Int = 0 // The quantity of part B in top coat
//        @Published var QuantTCoatPtC : Int = 0 // The quantity of part C in top coat
//        @Published var QuantTCoatColorant : Int = 0 // The quantity of colorant in prime coat
    @Published var TCoatWaste : Int = 0 // Waste in top coat
    @Published var texture1 : Int = 0  // for texture 1 selection
//        @Published var texture2 : Int = 0 // for texture 2 selection
//        @Published var texture1Quant : Int = 0
//        @Published var texture2Quant : Int = 0
    @Published var MVRPtA : Int = 0
    @Published var MVRPtB : Int = 0
    @Published var MVRTSColorant : Int = 0
    @Published var QuantMVRPtA : Int = 0 // The quantity of part A in MVR coat
    @Published var QuantMVRPtB : Int = 0 // The quantity of part B in MVR coat
    @Published var QuantMVRColorant : Int = 0 // The quantity of colorant in MVR coat
    @Published var MVRWaste : Int = 0
}

struct CoatChoicesSL: View {
    
    @EnvironmentObject var Chip : ChipOptions
    @EnvironmentObject var sf : SquareFeet //Square feet
    @EnvironmentObject var Broadcast : stats
    @EnvironmentObject var BCoatChipSLUPCA : stats2 //Used for system stats (mixRat,CovRate, etc)
    @EnvironmentObject var BCoatChipSLUPCB : stats2 //Used for system stats (mixRat,CovRate, etc)
    @EnvironmentObject var BCoatChipSLUPCC : stats2 //Used for system stats (mixRat,CovRate, etc)
    @EnvironmentObject var BCoatChipSLUPCColorant : stats2 //Used for system stats (mixRat,CovRate, etc)
    @State var showingPicker : Bool = false
    @State var showingMVR : Bool = false
    @State var showingPCoat : Bool = false
    @State var showingBCoat : Bool = false
    @State var showingBroadcast : Bool = false
    @State var showingTCoat1 : Bool = false
    @State var showingTCoat2 : Bool = false
    @State var showingSysSummary : Bool = false

    var body: some View {
        
        HStack {
        Spacer()
        Button(action: {
           showingPicker = true
        })
        {
            Text("Submit")
                .underline()
        }
        Spacer()
        }
        if showingPicker && Chip.isPrimeCoat {  // Base coat + prime coat
            Toggle(isOn: $showingPCoat) {
                Text("Prime Coat")
                    .fontWeight(.bold)
            }
            .toggleStyle(DropDownToggle())
            .padding()
            .background(Color(red:239.0/255.0, green: 243.0/255.0, blue: 244.0/250, opacity: 1.0))
            
            if showingPCoat == true {
                PCoatChipSL()
                    .environmentObject(ChipSLUPCA)
                    .environmentObject(ChipSLUPCB)
                    .environmentObject(ChipSLUPCC)
                    .environmentObject(ChipSLUPCColorant)

            }
        }
        if showingPicker == true && Chip.isMVR == true {  // Base coat + prime coat
            Toggle(isOn: $showingMVR) {
                Text("MVR Coat")
                    .fontWeight(.bold)
            }
            .toggleStyle(DropDownToggle())
            .padding()
            .background(Color(red:239.0/255.0, green: 243.0/255.0, blue: 244.0/250, opacity: 1.0))
            
            if showingMVR == true {
                MVRCoatChipSL()
                    .environmentObject(ChipSLUPCA)
                    .environmentObject(ChipSLUPCB)
                    .environmentObject(ChipSLUPCC)
                    .environmentObject(ChipSLUPCColorant)
            }
        }
       
        if showingPicker == true { // Only base coat selected
            Toggle(isOn: $showingBCoat) {
                Text("Base Coat")
                    .fontWeight(.bold)
            }
            .toggleStyle(DropDownToggle())
            .padding()
            .background(Color(red:239.0/255.0, green: 243.0/255.0, blue: 244.0/250, opacity: 1.0))
            
            if showingBCoat == true {
                BCoatChipSL()
//                    .environmentObject(BCoatChipSLUPCA)
//                    .environmentObject(BCoatChipSLUPCB)
//                    .environmentObject(BCoatChipSLUPCC)
//                    .environmentObject(BCoatChipSLUPCColorant)

            }
            Toggle(isOn: $showingBroadcast) {
                Text("Broadcast")
                    .fontWeight(.bold)
            }
            .toggleStyle(DropDownToggle())
            .padding()
            .background(Color(red:239.0/255.0, green: 243.0/255.0, blue: 244.0/250, opacity: 1.0))
            if showingBroadcast == true {
                BroadcastChipSL()
            }
            Toggle(isOn: $showingTCoat1) {
                Text("Top Coat(s)")
                    .fontWeight(.bold)
            }
            .toggleStyle(DropDownToggle())
            .padding()
            .background(Color(red:239.0/255.0, green: 243.0/255.0, blue: 244.0/250, opacity: 1.0))
            if showingTCoat1 == true {
                TopCoat1ChipSL()
                    .environmentObject(PAPUTC1)
                    .environmentObject(PAPUTC2)
            }

            if showingPicker == true {
                Toggle(isOn: $showingSysSummary) {
                    Text("KRETUS® Order Summary")
                        .fontWeight(.bold)
                }


                .toggleStyle(DropDownToggle())
                .padding()
                .background(Color(red:239.0/255.0, green: 243.0/255.0, blue: 244.0/250, opacity: 1.0))
                if showingSysSummary == true {
                    SysSummaryChipSL()
                        .environmentObject(Broadcast)
            }
            

            }
        }
    }
}

    
    



struct CoatChoicesSL_Previews: PreviewProvider {
    static var previews: some View {
        CoatChoicesGarage()
    }
}
