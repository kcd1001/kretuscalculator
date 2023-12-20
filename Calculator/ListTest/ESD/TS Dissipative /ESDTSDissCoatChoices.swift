//
//  CoatChoicesGarage.swift
//  Calculator
//
//  Created by Kane Davidson on 5/18/21.
//

import SwiftUI
import Combine

struct CoatChoicesESDTSDiss: View {
    
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
               MVRCoatESDTS()
                    .environmentObject(TSA_ESDTS)
                    .environmentObject(TSB_ESDTS)
            }
        }
        
        if showingPicker == true && Chip.isMVR == true {  // Base coat + prime coat
            Toggle(isOn: $showingMVR) {
                Text("Conductive Primer")
                    .fontWeight(.bold)
            }
            .toggleStyle(DropDownToggle())
            .padding()
            .background(Color(red:239.0/255.0, green: 243.0/255.0, blue: 244.0/250, opacity: 1.0))
            
            if showingMVR == true {
                PrimerCoatESDTS()
                    .environmentObject(PrimerA_TS)
                    .environmentObject(PrimerB_TS)
            }
        }
       
        
        if showingPicker == true { // Only base coat selected
            Toggle(isOn: $showingBCoat) {
                Text("MVR Coat")
                    .fontWeight(.bold)
            }
            .toggleStyle(DropDownToggle())
            .padding()
            .background(Color(red:239.0/255.0, green: 243.0/255.0, blue: 244.0/250, opacity: 1.0))
            
            if showingBCoat == true {
                MVRCoatESDTS()
                    .environmentObject(TSA_ESDTS)
                    .environmentObject(TSB_ESDTS)
            }

            
//            Toggle(isOn: $showingCapCoat) {
//                Text("Conductive Primer")
//                    .fontWeight(.bold)
//            }
//            .toggleStyle(DropDownToggle())
//            .padding()
//            .background(Color(red:239.0/255.0, green: 243.0/255.0, blue: 244.0/250, opacity: 1.0))
//            if showingCapCoat == true {
//                PrimerCoatESDTS()
//                    .environmentObject(PrimerA_TS)
//                    .environmentObject(PrimerB_TS)
//            }
            Toggle(isOn: $showingTCoat1) {
                Text("Top Coat")
                    .fontWeight(.bold)
            }
            .toggleStyle(DropDownToggle())
            .padding()
            .background(Color(red:239.0/255.0, green: 243.0/255.0, blue: 244.0/250, opacity: 1.0))
            if showingTCoat1 == true {
                ESDTSTopCoat()
//                    .environmentObject(PAPUTC1)
//                    .environmentObject(PAPUTC2)
                    .environmentObject(ESDTS_TSAC4)
                    .environmentObject(ESDTS_TSBC4)
                    .environmentObject(ESDTS_TSColorantC4)
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
                    ESDTSDissSysSummary()
                        .environmentObject(TSA_QuartzTS)
                        .environmentObject(TSB_QuartzTS)
                        .environmentObject(BroadcastQuartz)
            }
            

            }
        }
    }
}

    
    



struct CoatChoicesESDTSDiss_Previews: PreviewProvider {
    static var previews: some View {
        CoatChoicesGarage()
    }
}
