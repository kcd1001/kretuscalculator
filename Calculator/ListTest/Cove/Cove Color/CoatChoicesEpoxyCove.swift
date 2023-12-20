//
//  CoatChoicesGarage.swift
//  Calculator
//
//  Created by Kane Davidson on 5/18/21.
//

import SwiftUI
import Combine

class EpoxyCoveSelections : ObservableObject {
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
    
    @Published var Coat3ProductType : Int = 0
    @Published var Coat3PtA : Int = 0 // Used for part pickers in base coat
    @Published var Coat3PtB : Int = 0 // Used for part pickers in base coat
    @Published var Coat3TSColorant : Int = 0 // Used for part pickers in base coat
    @Published var Coat3PColorant : Int = 0 // Used for part pickers in base coat
    @Published var Coat3Texture : Int = 0 // Used for part pickers in base coat
    @Published var Coat3Waste : Int = 0 // Waste in prime coat
    @Published var Coat3MatAdd : Bool = false // matting additive in coat 3
    @Published var Coat3PtACode = "EX-KPLY72AZ-01"
    @Published var Coat3PtBCode = "EX-KPLY72BZ-01"

    
    @Published var Coat4PtA : Int = 0
    @Published var Coat4PtB : Int = 0
    @Published var Coat4Waste : Int = 0
    @Published var Coat4ProductType : Int = 0
    @Published var Coat4Texture : Int = 0
    @Published var Coat4PColorant : Int = 0
    @Published var Coat4MatAdd : Bool = false
    @Published var Coat4PtACode = "EX-KPLY72AZ-01"
    @Published var Coat4PtBCode = "EX-KPLY72BZ-01"

    @Published var ThicknessSelection : Int = 0
    
    @Published var BroadcastSelection : Int = 0
    @Published var BroadcastSizeSelection : Int = 0
    @Published var BroadcastWaste : Int = 0
}

struct CoatChoicesEpoxyCove: View {
    
    @EnvironmentObject var Chip : ChipOptions
    @EnvironmentObject var TSColorant : stats //Used for system stats (mixRat,CovRate, etc)
    @EnvironmentObject var sf : SquareFeet //Square feet
    @EnvironmentObject var Broadcast : stats
    @EnvironmentObject var bCoatCoveTSA : stats2
    @EnvironmentObject var bCoatCoveTSB : stats2
    @EnvironmentObject var bCoatCoveTSColorant : stats2
    @EnvironmentObject var bCoatCoveTexture : stats2
    
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
                Text("Prime Coat")
                    .fontWeight(.bold)
            }
            .toggleStyle(DropDownToggle())
            .padding()
            .background(Color(red:239.0/255.0, green: 243.0/255.0, blue: 244.0/250, opacity: 1.0))
            
            if showingCoat1 == true {
                EpoxyCovePCoat()
                    .environmentObject(coveTSA)
                    .environmentObject(coveTSB)
                    .environmentObject(coveTSColorant)
            }
            
            Toggle(isOn: $showingCoat2) {
                Text("Body Coat")
                    .fontWeight(.bold)
            }
            .toggleStyle(DropDownToggle())
            .padding()
            .background(Color(red:239.0/255.0, green: 243.0/255.0, blue: 244.0/250, opacity: 1.0))
            
            if showingCoat2 == true {
                EpoxyCoveBCoat()
                    .environmentObject(bCoatCoveTSA)
                    .environmentObject(bCoatCoveTSB)
                    .environmentObject(bCoatCoveTSColorant)
                    .environmentObject(bCoatCoveTexture)

            }

            Toggle(isOn: $showingCoat3) {
                Text("Cap Coat")
                    .fontWeight(.bold)
            }
            .toggleStyle(DropDownToggle())
            .padding()
            .background(Color(red:239.0/255.0, green: 243.0/255.0, blue: 244.0/250, opacity: 1.0))
            if showingCoat3 == true {
                EpoxyCoveCCoat()

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
                    EpoxyCoveColorSysSummary()

            }
            

            }
        }
    }
}

    
    



struct CoatChoicesEpoxyCove_Previews: PreviewProvider {
    static var previews: some View {
        CoatChoicesGarage()
    }
}
