//
//  CoatChoicesGarage.swift
//  Calculator
//
//  Created by Kane Davidson on 5/18/21.
//

import SwiftUI
import Combine


struct CoatChoicesEpoxyCoveChip: View {
    
    @EnvironmentObject var Chip : ChipOptions
    @EnvironmentObject var TSColorant : stats //Used for system stats (mixRat,CovRate, etc)
    @EnvironmentObject var sf : SquareFeet //Square feet
    @EnvironmentObject var Broadcast : stats
    @EnvironmentObject var bCoatCoveChipTSA : stats2
    @EnvironmentObject var bCoatCoveChipTSB : stats2
    @EnvironmentObject var bCoatCoveChipTSColorant : stats2
    @EnvironmentObject var bCoatCoveChipTexture : stats2
    
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

       
        if showingPicker == true { // Only base coat selected
            Toggle(isOn: $showingCoat1) {
                Text("Prime Coat")
                    .fontWeight(.bold)
            }
            .toggleStyle(DropDownToggle())
            .padding()
            .background(Color(red:239.0/255.0, green: 243.0/255.0, blue: 244.0/250, opacity: 1.0))
            
            if showingCoat1 == true {
                EpoxyCoveChipPCoat()
                    .environmentObject(coveChipTSA)
                    .environmentObject(coveChipTSB)
                    .environmentObject(coveChipTSColorant)
            }
            
            Toggle(isOn: $showingCoat2) {
                Text("Body Coat")
                    .fontWeight(.bold)
            }
            .toggleStyle(DropDownToggle())
            .padding()
            .background(Color(red:239.0/255.0, green: 243.0/255.0, blue: 244.0/250, opacity: 1.0))
            
            if showingCoat2 == true {
                EpoxyCoveChipBCoat()
                    .environmentObject(bCoatCoveChipTSA)
                    .environmentObject(bCoatCoveChipTSB)
                    .environmentObject(bCoatCoveChipTSColorant)
                    .environmentObject(bCoatCoveChipTexture)

            }

            Toggle(isOn: $showingCoat3) {
                Text("Cap Coat")
                    .fontWeight(.bold)
            }
            .toggleStyle(DropDownToggle())
            .padding()
            .background(Color(red:239.0/255.0, green: 243.0/255.0, blue: 244.0/250, opacity: 1.0))
            if showingCoat3 == true {
                EpoxyCoveChipCCoat()

            }
            
            Toggle(isOn: $showingBroadcast) {
                Text("Broadcast")
                    .fontWeight(.bold)
            }
            .toggleStyle(DropDownToggle())
            .padding()
            .background(Color(red:239.0/255.0, green: 243.0/255.0, blue: 244.0/250, opacity: 1.0))
            if showingBroadcast == true {
                EpoxyCoveChipBroadcast()
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
                    EpoxyCoveColorChipSysSummary()

            }
            

            }
        }
    }
}

    
    



struct CoatChoicesEpoxyCoveChip_Previews: PreviewProvider {
    static var previews: some View {
        CoatChoicesGarage()
    }
}
