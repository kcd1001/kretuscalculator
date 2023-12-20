//
//  CoatChoicesGarage.swift
//  Calculator
//
//  Created by Kane Davidson on 5/18/21.
//

import SwiftUI
import Combine

var UPC_QuartzTT = stats(product: "Top Shelf® Epoxy Part A:", covRate: 24, MixRat: 6)
var UPCColorant_QuartzTT = stats(product: "Top Shelf® Epoxy Colorant:", covRate: 24, MixRat: 4)

struct CoatChoicesQuartzTT: View {
    
    @EnvironmentObject var Chip : ChipOptions
 //   @EnvironmentObject var TSColorant : stats //Used for system stats (mixRat,CovRate, etc)
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
                PCoatQuartzTT()
                    .environmentObject(UPC_QuartzTT)
                    .environmentObject(UPCColorant_QuartzTT)
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
                    .environmentObject(UPC_QuartzTT)
                    .environmentObject(UPCColorant_QuartzTT)
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
                BCoatQuartzTT()
                    .environmentObject(UPC_QuartzTT)
//                    .environmentObject(TSBBC_TS)
            }
            Toggle(isOn: $showingBroadcast) {
                Text("Broadcast")
                    .fontWeight(.bold)
            }
            .toggleStyle(DropDownToggle())
            .padding()
            .background(Color(red:239.0/255.0, green: 243.0/255.0, blue: 244.0/250, opacity: 1.0))
            if showingBroadcast == true {
                BroadcastQuartzTTView()
                    .environmentObject(QuartzTT_TSAC3)
                    .environmentObject(QuartzTT_TSBC3)
                    .environmentObject(QuartzTT_TSColorantC3)
 //                   .environmentObject(BroadcastQuartzTT)
            }
            
            Toggle(isOn: $showingCapCoat) {
                Text("Cap Coat")
                    .fontWeight(.bold)
            }
            .toggleStyle(DropDownToggle())
            .padding()
            .background(Color(red:239.0/255.0, green: 243.0/255.0, blue: 244.0/250, opacity: 1.0))
            if showingCapCoat == true {
                ColorQuartzRCCapCoat()

            }
            Toggle(isOn: $showingTCoat1) {
                Text("Top Coat")
                    .fontWeight(.bold)
            }
            .toggleStyle(DropDownToggle())
            .padding()
            .background(Color(red:239.0/255.0, green: 243.0/255.0, blue: 244.0/250, opacity: 1.0))
            if showingTCoat1 == true {
                ColorQuartzRCTopCoat()
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
                    ColorQuartzTTSysSummary()
                        .environmentObject(UPC_QuartzTT)
                        .environmentObject(UPCColorant_QuartzTT)
 //                       .environmentObject(BroadcastQuartz)
            }
            

            }
        }
    }
}

    
    



struct CoatChoicesQuartzTT_Previews: PreviewProvider {
    static var previews: some View {
        CoatChoicesGarage()
    }
}
