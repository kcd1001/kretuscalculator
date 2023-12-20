//
//  CoatChoicesGarage.swift
//  Calculator
//
//  Created by Kane Davidson on 5/18/21.
//

import SwiftUI
import Combine

struct CoatChoicesESDSLDiss: View {
    
    @EnvironmentObject var Chip : ChipOptions
    @EnvironmentObject var TSColorant : stats //Used for system stats (mixRat,CovRate, etc)
    @EnvironmentObject var sf : SquareFeet //Square feet
    @EnvironmentObject var BroadcastQuartz : stats
    @EnvironmentObject var BroadcastESDSL : statsBroadcast

    @State var showingPicker : Bool = false
    @State var showingMVR : Bool = false 
    @State var showingPCoat : Bool = false
    @State var showingBCoat : Bool = false
    @State var showingBroadcast : Bool = false
    @State var showingTCoat1 : Bool = false
    @State var showingTCoat2 : Bool = false
    @State var showingSysSummary : Bool = false
    @State var showingCapCoat : Bool = false
    @State var capCoatProd : Int = 0
    
    var capCoatProducts = ["UPC", "Epoxy"]

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
                Text("MVR Coat")
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
                MVRCoatESDSL()
                    .environmentObject(TSA_ESDSL)
                    .environmentObject(TSB_ESDSL)
            }
            
            Toggle(isOn: $showingBroadcast) {
                Text("Broadcast")
                    .fontWeight(.bold)
            }
            .toggleStyle(DropDownToggle())
            .padding()
            .background(Color(red:239.0/255.0, green: 243.0/255.0, blue: 244.0/250, opacity: 1.0))
            if showingBroadcast == true {
                BroadcastESDSLView()
                    .environmentObject(BroadcastESDSL)
                
            }

            
            Toggle(isOn: $showingCapCoat) {
                Picker(selection: $capCoatProd,
                       label: ZStack {
                    Text("\(capCoatProducts[capCoatProd])")
                        .opacity(1)
                    Rectangle()
                        .fill(Color.gray)
                        .opacity(0.2)
                        .cornerRadius(5)
                        .frame(width: 150, height: 25)
                    //   .padding()
                }) {
                    ForEach (0 ..< capCoatProducts.count, id: \.self) { index in
                        Text(self.capCoatProducts[index]).tag(index)
                    }
                }
                .background(Color.gray.opacity(0.2))
                .cornerRadius(5)
                Text("Cap Coat")
                    .fontWeight(.bold)
            }
            .toggleStyle(DropDownToggle())
            .padding()
            .background(Color(red:239.0/255.0, green: 243.0/255.0, blue: 244.0/250, opacity: 1.0))
            if showingCapCoat == true {
                if capCoatProd == 0
                {
                    CapCoatESDRC()
                        .environmentObject(PrimerA_RC)
                        .environmentObject(PrimerB_RC)
                }
                else
                {
                    ESDEpoxyCapCoat()
                        .environmentObject(TSA_ESDSLCap)
                        .environmentObject(TSB_ESDSLCap)
                        .environmentObject(TSColorant_ESDSLCap)
                }
            }
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
                    ESDSLDissSysSummary()
                        .environmentObject(TSA_QuartzTS)
                        .environmentObject(TSB_QuartzTS)
                        .environmentObject(BroadcastQuartz)
            }
            

            }
        }
    }
}

    
    



struct CoatChoicesESDSLDiss_Previews: PreviewProvider {
    static var previews: some View {
        CoatChoicesGarage()
    }
}
