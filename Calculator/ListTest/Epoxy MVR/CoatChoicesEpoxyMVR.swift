//
//  CoatChoicesGarage.swift
//  Calculator
//
//  Created by Kane Davidson on 5/18/21.
//

import SwiftUI
import Combine




class EpoxyMVRValues : ObservableObject {

    @Published var PCoatPtA : Int = 0
    @Published var PCoatPtB : Int = 0
    @Published var PCoatWaste : Int = 0 // Waste in prime coat
    @Published var MVRCoatPtA : Int = 0
    @Published var MVRCoatPtB : Int = 0
    @Published var QuantMVRPtA : Int = 0 // The quantity of part A in MVR coat
    @Published var QuantMVRPtB : Int = 0 // The quantity of part B in MVR coat
    @Published var MVRCoatWaste : Int = 0
}

struct CoatChoicesEpoxyMVR: View {
    
    @EnvironmentObject var sysOptions : OptionsEpoxyMVR
    @EnvironmentObject var PCoatTSA : stats2 //Used for system stats (mixRat,CovRate, etc)
    @EnvironmentObject var PCoatTSB : stats2 //Used for system stats (mixRat,CovRate, etc)

    @EnvironmentObject var MVRCoatTSA : stats
    @EnvironmentObject var MVRCoatTSB : stats
    @State var showingPicker : Bool = false
    @State var showingMVRCoat : Bool = false
    @State var showingPCoat : Bool = false
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
            if sysOptions.isPrimeCoat == true
            {
            Toggle(isOn: $showingPCoat) {
                Text("Prime Coat")
                    .fontWeight(.bold)
            }
            .toggleStyle(DropDownToggle())
            .padding()
            .background(Color(red:239.0/255.0, green: 243.0/255.0, blue: 244.0/250, opacity: 1.0))
            
            if showingPCoat == true {
                PCoatEpoxyMVR()
                    .environmentObject(PCoatTSA)
                    .environmentObject(PCoatTSB)

            }
            }
            Toggle(isOn: $showingMVRCoat) {
                Text("MVR Coat")
                    .fontWeight(.bold)
            }
            .toggleStyle(DropDownToggle())
            .padding()
            .background(Color(red:239.0/255.0, green: 243.0/255.0, blue: 244.0/250, opacity: 1.0))
            
            if showingMVRCoat == true {
                MVRCoatEpoxyMVR()
                    .environmentObject(MVRCoatTSA)
                    .environmentObject(MVRCoatTSB)
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
                    EpoxyMVRSysSummary()
            }
            

            }
        }
    }
}

    
    



struct CoatChoicesEpoxyMVR_Previews: PreviewProvider {
    static var previews: some View {
        CoatChoicesGarage()
    }
}
