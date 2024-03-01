//
//  CoatChoicesGarage.swift
//  Calculator
//
//  Created by Kane Davidson on 5/18/21.
//

import SwiftUI
import Combine

var PAPtA = stats(product: "Top Shelf® Epoxy Part A:", covRate: 700, MixRat: 1)
var PAPtB = stats(product: "Top Shelf® Epoxy Part B:", covRate: 700, MixRat: 0.5)

class ColorChipValuesPA : ObservableObject {
    @Published var BCoatPtA : Int = 0 // Used for part pickers in base coat
    @Published var BCoatHardener : Int = 0 // Used for part pickers in base coat
    @Published var BCoatPolyColorant : Int = 0 // Used for part pickers in base coat
    @Published var BCoatWaste : Int = 0 // Waste in base coat
    @Published var PCoatPtA : Int = 0 // Used for part pickers in base coat
    @Published var PCoatHardener : Int = 0 // Used for part pickers in base coat
    @Published var PCoatPolyColorant : Int = 0 // Used for part pickers in base coat
    @Published var BroadcastSizeSelection  = 0 // for prime coat picker
    @Published var BroadcastSelection : Int  = 0 // for top coat picker
    @Published var BroadcastWaste : Int = 0
    @Published var QuantBCoatPtA : Int = 0 // The quantity of part A in base coat
    @Published var QuantBCoatHardener : Int = 0 // The quantity of part B in base coat
    @Published var QuantBCoatPtC : Int = 0 // The quantity of part C in base coat
    @Published var QuantBCoatPolyColorant : Int = 0 // The quantity of colorant in base coat
    @Published var QuantPCoatPtA : Int = 0 // The quantity of part A in prime coat
    @Published var QuantPCoatHardener : Int = 0 // The quantity of part B in prime coat
    @Published var QuantPCoatPtC : Int = 0 // The quantity of part C in prime coat
    @Published var QuantPCoatPolyColorant : Int = 0 // The quantity of colorant in prime coat
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

struct CoatChoicesPA: View {
    
    @EnvironmentObject var Chip : ChipOptions
    @EnvironmentObject var PolyColorant_TS : stats //Used for system stats (mixRat,CovRate, etc)
    @EnvironmentObject var sf : SquareFeet //Square feet
    @EnvironmentObject var Broadcast : stats
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
        if showingPicker == true && Chip.isPrimeCoat == true {  // Base coat + prime coat
            Toggle(isOn: $showingPCoat) {
                Text("Prime Coat")
                    .fontWeight(.bold)
            }
            .toggleStyle(DropDownToggle())
            .padding()
            .background(Color(red:239.0/255.0, green: 243.0/255.0, blue: 244.0/250, opacity: 1.0))
        
            if showingPCoat == true {
                PCoatPA()
                    .environmentObject(PAPtA)
                    .environmentObject(PAPtB)
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
                MVRCoatPA()
                    .environmentObject(PAPtA)
                    .environmentObject(PAPtB)
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
                BCoatPA()
                    .environmentObject(PAPtABC)
                    .environmentObject(PAPtBBC)
            }
            Toggle(isOn: $showingBroadcast) {
                Text("Broadcast")
                    .fontWeight(.bold)
            }
            .toggleStyle(DropDownToggle())
            .padding()
            .background(Color(red:239.0/255.0, green: 243.0/255.0, blue: 244.0/250, opacity: 1.0))
            if showingBroadcast == true {
                BroadcastPA()
            }
            Toggle(isOn: $showingTCoat1) {
                Text("Top Coat(s)")
                    .fontWeight(.bold)
            }
            .toggleStyle(DropDownToggle())
            .padding()
            .background(Color(red:239.0/255.0, green: 243.0/255.0, blue: 244.0/250, opacity: 1.0))
            if showingTCoat1 == true {
                TopCoat1PA()
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
                    SysSummaryPA()
                        .environmentObject(TSA_TS)
                        .environmentObject(TSB_TS)
                        .environmentObject(Broadcast)
            }
            

            }
        }
    }
}

    
    



struct CoatChoicesPA_Previews: PreviewProvider {
    static var previews: some View {
        CoatChoicesGarage()
    }
}
