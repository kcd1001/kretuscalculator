//
//  CoatChoicesGarage.swift
//  Calculator
//
//  Created by Kane Davidson on 5/18/21.
//

import SwiftUI
import Combine


struct CoatChoicesTSMetallic: View {
    
    @EnvironmentObject var Chip : ChipOptions
    @EnvironmentObject var TSColorant : stats //Used for system stats (mixRat,CovRate, etc)
    @EnvironmentObject var sf : SquareFeet //Square feet
    @EnvironmentObject var Broadcast : stats
    
    @EnvironmentObject var bCoatMetallicTSA : stats2
    @EnvironmentObject var bCoatMetallicTSB : stats2
    @EnvironmentObject var bCoatMetallicPigment : stats2
    
    @State var showingPicker : Bool = false
    @State var showingMVR : Bool = false 
    @State var showingPCoat : Bool = false
    @State var showingCoat1 : Bool = false
    @State var showingCoat2 : Bool = false
    @State var showingCoat3 : Bool = false
    @State var showingBroadcast : Bool = false
    @State var showingCoat4 : Bool = false
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
                TSMetallicPCoat()
                    .environmentObject(metallicTSA)
                    .environmentObject(metallicTSB)
                    .environmentObject(metallicPigment)
            }
            
            Toggle(isOn: $showingCoat2) {
                Text("Metallic Base Coat")
                    .fontWeight(.bold)
            }
            .toggleStyle(DropDownToggle())
            .padding()
            .background(Color(red:239.0/255.0, green: 243.0/255.0, blue: 244.0/250, opacity: 1.0))
            
            if showingCoat2 == true {
                TSMetallicBCoat()
                    .environmentObject(bCoatMetallicTSA)
                    .environmentObject(bCoatMetallicTSB)
                    .environmentObject(bCoatMetallicPigment)

            }
            
            Toggle(isOn: $showingCoat3) {
                Text("Metallic Accent Coat")
                    .fontWeight(.bold)
            }
            .toggleStyle(DropDownToggle())
            .padding()
            .background(Color(red:239.0/255.0, green: 243.0/255.0, blue: 244.0/250, opacity: 1.0))
            if showingCoat3 == true {
                TSMetallicAccentCoat()
                
            }

            Toggle(isOn: $showingCoat4) {
                Text("Top Coat")
                    .fontWeight(.bold)
            }
            .toggleStyle(DropDownToggle())
            .padding()
            .background(Color(red:239.0/255.0, green: 243.0/255.0, blue: 244.0/250, opacity: 1.0))
            if showingCoat4 == true {
                TSMetallicCCoat()
                    .environmentObject(cCoatmetallicTSA)
                    .environmentObject(cCoatmetallicTSB)
                    .environmentObject(cCoatmetallicPigment)
                    .environmentObject(cCoatmetallicTexture)


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
                    TSMetallicSysSumm()

            }
            

            }
        }
    }
}

    
    



struct CoatChoicesTSMetallic_Previews: PreviewProvider {
    static var previews: some View {
        CoatChoicesGarage()
    }
}
