//
//  CoatChoicesGarage.swift
//  Calculator
//
//  Created by Kane Davidson on 5/18/21.
//

import SwiftUI
import Combine

var TSA_QuartzSG = stats(product: "Top Shelf® Epoxy Part A:", covRate: 450, MixRat: 1)
var TSB_QuartzSG = stats(product: "Top Shelf® Epoxy Part B:", covRate: 450, MixRat: 0.5)
var TSColorant_QuartzSG = stats(product: "Top Shelf® Epoxy Colorant:", covRate: 450, MixRat: 16)

var quartzSG_TSAC3 = stats2(product: "Top Shelf® Epoxy Part A:", covRate: 120, MixRat: 1)
var quartzSG_TSBC3 = stats2(product: "Top Shelf® Epoxy Part B:", covRate: 120, MixRat: 0.5)
var quartzSG_TSColorantC3 = stats2(product: "Top Shelf® Epoxy Colorant:", covRate: 120, MixRat: 16)

class ColorQuartzSGValues : ObservableObject {
    @Published var BCoatPtA : Int = 0 // Used for part pickers in base coat
    @Published var BCoatPtB : Int = 0 // Used for part pickers in base coat
    @Published var BCoatTSColorant : Int = 0 // Used for part pickers in base coat
    @Published var BCoatWaste : Int = 0 // Waste in base coat
    @Published var PCoatPtA : Int = 0 // Used for part pickers in base coat
    @Published var PCoatPtB : Int = 0 // Used for part pickers in base coat
    @Published var PCoatTSColorant : Int = 0 // Used for part pickers in base coat
    @Published var BroadcastSizeSelection  = 0 // for prime coat picker
    @Published var BroadcastSelection : Int  = 0 // for top coat picker
    @Published var BroadcastWaste : Int = 0
    @Published var QuantBCoatPtA : Int = 0 // The quantity of part A in base coat
    @Published var QuantBCoatPtB : Int = 0 // The quantity of part B in base coat
    @Published var QuantBCoatPtC : Int = 0 // The quantity of part C in base coat
    @Published var QuantBCoatColorant : Int = 0 // The quantity of colorant in base coat
    @Published var QuantPCoatPtA : Int = 0 // The quantity of part A in prime coat
    @Published var QuantPCoatPtB : Int = 0 // The quantity of part B in prime coat
    @Published var QuantPCoatPtC : Int = 0 // The quantity of part C in prime coat
    @Published var QuantPCoatColorant : Int = 0 // The quantity of colorant in prime coat
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
    
    @Published var Coat3ProductType : Int = 0
    @Published var Coat3PtA : Int = 0 // Used for part pickers in base coat
    @Published var Coat3PtB : Int = 0 // Used for part pickers in base coat
    @Published var Coat3TSColorant : Int = 0 // Used for part pickers in base coat
    @Published var Coat3PColorant : Int = 0 // Used for part pickers in base coat
    @Published var Coat3Texture : Int = 0 // Used for part pickers in base coat
    @Published var Coat3Waste : Int = 0 // Waste in prime coat
    @Published var Coat3MatAdd : Bool = false // matting additive in coat 3
    @Published var PCoatPtACode = "EX-KPLY72AZ-01"
    @Published var PCoatHardenerCode = "EX-KPLY72B-01"
    @Published var PUPtACode = "EX-KPLY72AZ-01"
    @Published var PUHardenerCode = "EX-KPLY72B-01"
    
    @Published var Coat4ProductType : Int = 0
    @Published var Coat4PtA : Int = 0 // Used for part pickers in base coat
    @Published var Coat4PtB : Int = 0 // Used for part pickers in base coat
    @Published var Coat4TSColorant : Int = 0 // Used for part pickers in base coat
    @Published var Coat4PColorant : Int = 0 // Used for part pickers in base coat
    @Published var Coat4Texture : Int = 0 // Used for part pickers in base coat
    @Published var Coat4Waste : Int = 0 // Waste in prime coat
    @Published var Coat4MatAdd : Bool = false // matting additive in coat 3
    @Published var Coat4PCoatPtACode = "EX-KPLY72AZ-01"
    @Published var Coat4PCoatHardenerCode = "EX-KPLY72B-01"
    @Published var Coat4PUPtACode = "EX-KPLY72AZ-01"
    @Published var Coat4PUHardenerCode = "EX-KPLY72B-01"
}

struct CoatChoicesQuartzSG: View {
    
    @EnvironmentObject var Chip : ChipOptions
    @EnvironmentObject var TSColorant : stats //Used for system stats (mixRat,CovRate, etc)
    @EnvironmentObject var sf : SquareFeet //Square feet
    @EnvironmentObject var BroadcastQuartz : stats
    
    @State var showingPicker : Bool = false
    @State var showingMVR : Bool = false 
    @State var showingPCoat : Bool = false
    @State var showingBCoat : Bool = false
    @State var showingBroadcast : Bool = false
    @State var showingTCoat1 : Bool = false
    @State var showingTCoat2 : Bool = false
    @State var showingSysSummary : Bool = false
    @State var showingCapCoat : Bool = false

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
                PCoatQuartzSG()
                    .environmentObject(TSA_QuartzSG)
                    .environmentObject(TSB_QuartzSG)
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
                MVRCoatQuartzSG()
                    .environmentObject(TSA_QuartzSG)
                    .environmentObject(TSB_QuartzSG)
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
                BCoatQuartzSG()
                    .environmentObject(TSABC_QuartzSG)
                    .environmentObject(TSBBC_QuartzSG)
            }
            Toggle(isOn: $showingBroadcast) {
                Text("Broadcast")
                    .fontWeight(.bold)
            }
            .toggleStyle(DropDownToggle())
            .padding()
            .background(Color(red:239.0/255.0, green: 243.0/255.0, blue: 244.0/250, opacity: 1.0))
            if showingBroadcast == true {
                BroadcastQuartzSG()
                    .environmentObject(quartzSG_TSAC3)
                    .environmentObject(quartzSG_TSBC3)
                    .environmentObject(quartzSG_TSColorantC3)
            }
            
            Toggle(isOn: $showingCapCoat) {
                Text("Cap Coat")
                    .fontWeight(.bold)
            }
            .toggleStyle(DropDownToggle())
            .padding()
            .background(Color(red:239.0/255.0, green: 243.0/255.0, blue: 244.0/250, opacity: 1.0))
            if showingCapCoat == true {
                ColorQuartzTSCapCoat()
//                    .environmentObject(PAPUTC1)
//                    .environmentObject(PAPUTC2)
                    .environmentObject(quartzTS_TSAC3)
                    .environmentObject(quartzTS_TSBC3)
                    .environmentObject(quartzTS_TSColorantC3)
            }
            Toggle(isOn: $showingTCoat1) {
                Text("Top Coat")
                    .fontWeight(.bold)
            }
            .toggleStyle(DropDownToggle())
            .padding()
            .background(Color(red:239.0/255.0, green: 243.0/255.0, blue: 244.0/250, opacity: 1.0))
            if showingTCoat1 == true {
                ColorQuartzTSTopCoat()
//                    .environmentObject(PAPUTC1)
//                    .environmentObject(PAPUTC2)
                    .environmentObject(quartzTS_TSAC4)
                    .environmentObject(quartzTS_TSBC4)
                    .environmentObject(quartzTS_TSColorantC4)
                
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
                    ColorQuartzSGSysSummary()
                        .environmentObject(TSA_QuartzTS)
                        .environmentObject(TSB_QuartzTS)
                        .environmentObject(BroadcastQuartz)
                        .environmentObject(quartzTS_TSAC3)
                        .environmentObject(quartzTS_TSBC3)
                        .environmentObject(quartzTS_TSColorantC3)
                        .environmentObject(quartzTS_TSAC4)
                        .environmentObject(quartzTS_TSBC4)
                        .environmentObject(quartzTS_TSColorantC4)
            }
            

            }
        }
    }
}

    
    



struct CoatChoicesQuartzSG_Previews: PreviewProvider {
    static var previews: some View {
        CoatChoicesGarage()
    }
}
