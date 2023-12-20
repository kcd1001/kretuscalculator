//
//  CoatChoicesGarage.swift
//  Calculator
//
//  Created by Kane Davidson on 5/18/21.
//

import SwiftUI
import Combine

struct CoatChoicesSandSG: View {
    
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
                PCoatIndustrialSandSG()
                    .environmentObject(TSA_SandSG)
                    .environmentObject(TSB_SandSG)
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
                MVRCoatSandSG()
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
                BCoatIndustrialSandSG()
                    .environmentObject(TSABC_SandSG)
                    .environmentObject(TSBBC_SandSG)
                    .environmentObject(TSColorantBC_SandSG)
            }
            Toggle(isOn: $showingBroadcast) {
                Text("Broadcast")
                    .fontWeight(.bold)
            }
            .toggleStyle(DropDownToggle())
            .padding()
            .background(Color(red:239.0/255.0, green: 243.0/255.0, blue: 244.0/250, opacity: 1.0))
            if showingBroadcast == true {
                BroadcastSandSG()
                    .environmentObject(SandSG_TSAC3)
                    .environmentObject(SandSG_TSBC3)
                    .environmentObject(SandSG_TSColorantC3)
                    .environmentObject(TSABC_SandSG)
                    .environmentObject(TSBBC_SandSG)
                    .environmentObject(TSColorantBC_SandSG)

            }
            
            Toggle(isOn: $showingCapCoat) {
                Text("Cap Coat")
                    .fontWeight(.bold)
            }
            .toggleStyle(DropDownToggle())
            .padding()
            .background(Color(red:239.0/255.0, green: 243.0/255.0, blue: 244.0/250, opacity: 1.0))
            if showingCapCoat == true {
                IndustrialSandTSCapCoat()
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
                IndustrialSandTSTopCoat()
//                    .environmentObject(PAPUTC1)
//                    .environmentObject(PAPUTC2)
                    .environmentObject(SandSG_TSAC4)
                    .environmentObject(SandSG_TSBC4)
                    .environmentObject(SandSG_TSColorantC4)
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
                    IndustrialSandSGSysSummary()
                        .environmentObject(TSA_QuartzTS)
                        .environmentObject(TSB_QuartzTS)
                        .environmentObject(BroadcastQuartz)
            }
            

            }
        }
    }
}

    
    



struct CoatChoicesSandSG_Previews: PreviewProvider {
    static var previews: some View {
        CoatChoicesGarage()
    }
}
