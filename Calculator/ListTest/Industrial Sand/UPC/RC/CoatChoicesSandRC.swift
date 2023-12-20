//
//  CoatChoicesGarage.swift
//  Calculator
//
//  Created by Kane Davidson on 5/18/21.
//

import SwiftUI
import Combine

struct CoatChoicesSandRC: View {
    
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
                PCoatIndustrialSandRC()
                    .environmentObject(TSA_SandRC)
                    .environmentObject(TSB_SandRC)
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
                MVRCoatSandRC()
                    .environmentObject(TSA_QuartzTS)
                    .environmentObject(TSB_QuartzTS)
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
                BCoatIndustrialSandRC()
                    .environmentObject(TSABC_SandRC)
                    .environmentObject(TSBBC_SandRC)
                    .environmentObject(TSColorantBC_SandRC)
            }
            Toggle(isOn: $showingBroadcast) {
                Text("Broadcast")
                    .fontWeight(.bold)
            }
            .toggleStyle(DropDownToggle())
            .padding()
            .background(Color(red:239.0/255.0, green: 243.0/255.0, blue: 244.0/250, opacity: 1.0))
            if showingBroadcast == true {
                BroadcastSandRC()
                    .environmentObject(SandRC_TSAC3)
                    .environmentObject(SandRC_TSBC3)
                    .environmentObject(SandRC_TSColorantC3)
                    .environmentObject(TSABC_SandRC)
                    .environmentObject(TSBBC_SandRC)
                    .environmentObject(TSColorantBC_SandRC)

            }
            
            Toggle(isOn: $showingCapCoat) {
                Text("Cap Coat")
                    .fontWeight(.bold)
            }
            .toggleStyle(DropDownToggle())
            .padding()
            .background(Color(red:239.0/255.0, green: 243.0/255.0, blue: 244.0/250, opacity: 1.0))
            if showingCapCoat == true {
                IndustrialSandRCCapCoat()
//                    .environmentObject(PAPUTC1)
//                    .environmentObject(PAPUTC2)
            }
            Toggle(isOn: $showingTCoat1) {
                Text("Top Coat")
                    .fontWeight(.bold)
            }
            .toggleStyle(DropDownToggle())
            .padding()
            .background(Color(red:239.0/255.0, green: 243.0/255.0, blue: 244.0/250, opacity: 1.0))
            if showingTCoat1 == true {
                IndustrialSandRCTopCoat()
//                    .environmentObject(PAPUTC1)
//                    .environmentObject(PAPUTC2)
                    .environmentObject(SandRC_TSAC4)
                    .environmentObject(SandRC_TSBC4)
                    .environmentObject(SandRC_TSColorantC4)
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
                    IndustrialSandRCSysSummary()
                        .environmentObject(TSA_QuartzTS)
                        .environmentObject(TSB_QuartzTS)
                        .environmentObject(BroadcastQuartz)
            }
            

            }
        }
    }
}

    
    



struct CoatChoicesSandRC_Previews: PreviewProvider {
    static var previews: some View {
        CoatChoicesGarage()
    }
}
