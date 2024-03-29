//
//  CoatChoicesGarage.swift
//  Calculator
//
//  Created by Kane Davidson on 5/18/21.
//

import SwiftUI
import Combine

//var selectTSA_TS = stats(product: "Top Shelf® Epoxy Part A:", covRate: 225, MixRat: 2)
//var selectTSB_TS = stats(product: "Top Shelf® Epoxy Part B:", covRate: 225, MixRat: 1)


struct CoatChoicesSelectTS: View {
    
    @EnvironmentObject var Chip : ChipOptions
    @EnvironmentObject var TSColorant : stats //Used for system stats (mixRat,CovRate, etc)
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
                PCoatSelectTS()
                    .environmentObject(selectTSA_TS)
                    .environmentObject(selectTSB_TS)
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
                MVRCoatTS()
                    .environmentObject(TSA_TS)
                    .environmentObject(TSB_TS)
            }
        }
       
        if showingPicker == true { // Only base coat selected
            Toggle(isOn: $showingBCoat) {
                Text("Customize your kit")
                    .fontWeight(.bold)
            }
            .toggleStyle(DropDownToggle())
            .padding()
            .background(Color(red:239.0/255.0, green: 243.0/255.0, blue: 244.0/250, opacity: 1.0))
            
            if showingBCoat == true {
                BCoatSelectTS()
                    .environmentObject(selectTSABC_TS)
                    .environmentObject(selectTSBBC_TS)
            }
//            Toggle(isOn: $showingBroadcast) {
//                Text("Broadcast")
//                    .fontWeight(.bold)
//            }
//            .toggleStyle(DropDownToggle())
//            .padding()
//            .background(Color(red:239.0/255.0, green: 243.0/255.0, blue: 244.0/250, opacity: 1.0))
//            if showingBroadcast == true {
//                BroadcastSelectTS()
//            }
//            Toggle(isOn: $showingTCoat1) {
//                Text("Top Coat(s)")
//                    .fontWeight(.bold)
//            }
//            .toggleStyle(DropDownToggle())
//            .padding()
//            .background(Color(red:239.0/255.0, green: 243.0/255.0, blue: 244.0/250, opacity: 1.0))
//            if showingTCoat1 == true {
//                TopCoat1SelectTS()
//                    .environmentObject(PAPUTC1)
//                    .environmentObject(PAPUTC2)
//            }

            if showingPicker == true {
                Toggle(isOn: $showingSysSummary) {
                    Text("KRETUS® Order Summary")
                        .fontWeight(.bold)
                }


                .toggleStyle(DropDownToggle())
                .padding()
                .background(Color(red:239.0/255.0, green: 243.0/255.0, blue: 244.0/250, opacity: 1.0))
                if showingSysSummary == true {
                    SysSumPCBCSelectTS()
                        .environmentObject(selectTSA_TS)
                        .environmentObject(selectTSB_TS)
                        .environmentObject(Broadcast)
            }
            

            }
        }
    }
}

struct CoatChoicesSelectTS_Previews: PreviewProvider {
    static var previews: some View {
        CoatChoicesGarage()
    }
}
