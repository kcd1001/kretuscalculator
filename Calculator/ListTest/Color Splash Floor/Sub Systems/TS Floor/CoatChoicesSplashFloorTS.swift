//
//  CoatChoicesGarage.swift
//  Calculator
//
//  Created by Kane Davidson on 5/18/21.
//

import SwiftUI
import Combine

var TSAC2 = stats(product: "Top Shelf® Epoxy Part A:", covRate: 400, MixRat: 1)
var TSBC2 = stats(product: "Top Shelf® Epoxy Part B:", covRate: 400, MixRat: 0.5)
var TSColorantC2 = stats(product: "Top Shelf® Epoxy Colorant:", covRate: 400, MixRat: 16)
var TSTextureC2 = stats(product: "Texture", covRate: 400, MixRat: 1)

var TSAC3 = stats2(product: "Top Shelf® Epoxy Part A:", covRate: 600, MixRat: 1)
var TSBC3 = stats2(product: "Top Shelf® Epoxy Part B:", covRate: 600, MixRat: 0.5)
var TSColorantC3 = stats2(product: "Top Shelf® Epoxy Colorant:", covRate: 600, MixRat: 16)
var TSTextureC3 = stats2(product: "Texture", covRate: 600, MixRat: 1)

var TSTextureC4 = stats2(product: "Texture", covRate: 600, MixRat: 1)



class ColorSplashValuesFloorTS : ObservableObject {
    @Published var Coat1ProductType : Int = 0 
    @Published var Coat1PtA : Int = 0 // Used for part pickers in base coat
    @Published var Coat1PtB : Int = 0 // Used for part pickers in base coat
    @Published var Coat1Hardener : Int = 0 // Used for part pickers in base coat
    @Published var Coat1TSColorant : Int = 0 // Used for part pickers in base coat
    @Published var Coat1Waste : Int = 0 // Waste in base coat
    @Published var Coat1SolventCleaner : Bool = false // solvent cleaner in coat 1
    @Published var UPCSelection = "RC/TT"
    
    @Published var Coat2ProductType : Int = 0 
    @Published var Coat2PtA : Int = 0 // Used for part pickers in base coat
    @Published var Coat2PtB : Int = 0 // Used for part pickers in base coat
    @Published var Coat2TSColorant : Int = 0 // Used for part pickers in base coat
    @Published var Coat2PColorant : Int = 0 // Used for part pickers in base coat
    @Published var Coat2Texture : Int = 0 // Used for part pickers in base coat
    @Published var Coat2Waste : Int = 0 // Waste in prime coat
    @Published var Coat2MatAdd : Bool = false // matting additive in coat 2
    @Published var Coat2PtACode = "EX-KPLY72AZ-01"
    @Published var Coat2PtBCode = "EX-KPLY72B-01"
    
    @Published var Coat3ProductType : Int = 0
    @Published var Coat3PtA : Int = 0 // Used for part pickers in base coat
    @Published var Coat3PtB : Int = 0 // Used for part pickers in base coat
    @Published var Coat3TSColorant : Int = 0 // Used for part pickers in base coat
    @Published var Coat3PColorant : Int = 0 // Used for part pickers in base coat
    @Published var Coat3Texture : Int = 0 // Used for part pickers in base coat
    @Published var Coat3Waste : Int = 0 // Waste in prime coat
    @Published var Coat3MatAdd : Bool = false // matting additive in coat 3
    @Published var Coat3PtACode = "EX-KPLY72AZ-01"
    @Published var Coat3PtBCode = "EX-KPLY72B-01"

    @Published var QuantBCoatPtA : Int = 0 // The quantity of part A in base coat
    @Published var QuantBCoatPtB : Int = 0 // The quantity of part B in base coat
    @Published var QuantBCoatPtC : Int = 0 // The quantity of part C in base coat
    @Published var QuantBCoatColorant : Int = 0 // The quantity of colorant in base coat
    @Published var QuantPCoatPtA : Int = 0 // The quantity of part A in prime coat
    @Published var QuantPCoatPtB : Int = 0 // The quantity of part B in prime coat
    @Published var QuantPCoatPtC : Int = 0 // The quantity of part C in prime coat
    @Published var QuantPCoatColorant : Int = 0 // The quantity of colorant in prime coat
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

struct CoatChoicesSplashFloorTS: View {
    
    @EnvironmentObject var Chip : ChipOptions
    @EnvironmentObject var TSColorant : stats //Used for system stats (mixRat,CovRate, etc)
    @EnvironmentObject var sf : SquareFeet //Square feet
    @EnvironmentObject var Broadcast : stats
    @State var showingPicker : Bool = false
    @State var showingMVR : Bool = false 
    @State var showingPCoat : Bool = false
    @State var showingCoat1 : Bool = false
    @State var showingCoat2 : Bool = false
    @State var showingBroadcast : Bool = false
    @State var showingCoat3 : Bool = false
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
//        if showingPicker == true && Chip.isPrimeCoat == true {  // Base coat + prime coat
//            Toggle(isOn: $showingPCoat) {
//                Text("Prime Coat")
//                    .fontWeight(.bold)
//            }
//            .toggleStyle(DropDownToggle())
//            .padding()
//            .background(Color(red:239.0/255.0, green: 243.0/255.0, blue: 244.0/250, opacity: 1.0))
//
//            if showingPCoat == true {
//                PCoatTS()
//                    .environmentObject(TSA_TS)
//                    .environmentObject(TSB_TS)
//            }
//        }
//        if showingPicker == true && Chip.isMVR == true {  // Base coat + prime coat
//            Toggle(isOn: $showingMVR) {
//                Text("MVR Coat")
//                    .fontWeight(.bold)
//            }
//            .toggleStyle(DropDownToggle())
//            .padding()
//            .background(Color(red:239.0/255.0, green: 243.0/255.0, blue: 244.0/250, opacity: 1.0))
//            
//            if showingMVR == true {
//                MVRCoatTS()
//                    .environmentObject(TSA_TS)
//                    .environmentObject(TSB_TS)
//            }
//        }
       
        if showingPicker == true { // Only base coat selected
            Toggle(isOn: $showingCoat1) {
                Text("Coat 1")
                    .fontWeight(.bold)
            }
            .toggleStyle(DropDownToggle())
            .padding()
            .background(Color(red:239.0/255.0, green: 243.0/255.0, blue: 244.0/250, opacity: 1.0))
            
            if showingCoat1 == true {
                SplashFloorTSCoat1()
                    .environmentObject(TSAC1)
                    .environmentObject(TSBC1)
                    .environmentObject(TSColorantC1)
            }
            
            Toggle(isOn: $showingCoat2) {
                Text("Coat 2")
                    .fontWeight(.bold)
            }
            .toggleStyle(DropDownToggle())
            .padding()
            .background(Color(red:239.0/255.0, green: 243.0/255.0, blue: 244.0/250, opacity: 1.0))
            
            if showingCoat2 == true {
                SplashFloorTSCoat2()
                    .environmentObject(TSAC2)
                    .environmentObject(TSBC2)
                    .environmentObject(TSColorantC2)
            }

            Toggle(isOn: $showingCoat3) {
                Text("Coat 3")
                    .fontWeight(.bold)
            }
            .toggleStyle(DropDownToggle())
            .padding()
            .background(Color(red:239.0/255.0, green: 243.0/255.0, blue: 244.0/250, opacity: 1.0))
            if showingCoat3 == true {
                SplashFloorTSCoat3()
                    .environmentObject(TSAC3)
                    .environmentObject(TSBC3)
                    .environmentObject(TSColorantC3)
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
                    SplashFloorTSSysSummary()

            }
            

            }
        }
    }
}

    
    



struct CoatChoicesSplashFloorTS_Previews: PreviewProvider {
    static var previews: some View {
        CoatChoicesGarage()
    }
}
