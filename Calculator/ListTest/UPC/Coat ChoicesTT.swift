//
//  Coat Choices.swift
//  ListTest
//
//  Created by Kane Davidson on 12/9/20.
//

import SwiftUI
import Combine

class sysChoicesTT : ObservableObject {
    @Published var BCoatSelection  = 0 // for base coat picker
    @Published var PCoatSelection  = 0 // for prime coat picker
    @Published var TCoatSelection  = 0 // for top coat picker
    @Published var BCoatPtA : Int = 0 // The quantity of part A in base coat
    @Published var BCoatPtB : Int = 0 // The quantity of part B in base coat
    @Published var BCoatPtC : Int = 0 // The quantity of part C in base coat
    @Published var BCoatColorant : Int = 0 // The quantity of colorant in base coat
    @Published var BCoatWaste : Int = 0 // Waste in base coat 
    @Published var PCoatPtA : Int = 0 // The quantity of part A in prime coat
    @Published var PCoatPtB : Int = 0 // The quantity of part B in prime coat
    @Published var PCoatPtC : Int = 0 // The quantity of part C in prime coat
    @Published var PCoatColorant : Int = 0 // The quantity of colorant in prime coat
    @Published var PCoatWaste : Int = 0 // Waste in prime coat
    @Published var TCoatPtA : Int = 0 // The quantity of part A in top coat
    @Published var TCoatPtB : Int = 0 // The quantity of part B in top coat
    @Published var TCoatPtC : Int = 0 // The quantity of part C in top coat
    @Published var TCoatColorant : Int = 0 // The quantity of colorant in prime coat
    @Published var TCoatWaste : Int = 0 // Waste in top coat
    @Published var texture1 : Int = 0  // for texture 1 selection
    @Published var texture2 : Int = 0 // for texture 2 selection
    @Published var texture1Quant : Int = 0
    @Published var texture2Quant : Int = 0 
}



struct Coat_ChoicesTT: View {
    
    @EnvironmentObject var upcChoice : sysChoices //Used for coat selections
    @EnvironmentObject var upc : options //Used for coat checkboxes
    @EnvironmentObject var UPCA : stats //Used for system stats (mixRat,CovRate, etc)
    @EnvironmentObject var UPCB : stats //Used for system stats (mixRat,CovRate, etc)
    @EnvironmentObject var UPCC : stats //Used for system stats (mixRat,CovRate, etc)
    @EnvironmentObject var UPCColor : stats
    @EnvironmentObject var sf : SquareFeet //Square feet
    @EnvironmentObject var colorant : Colorant //colorant
    @State var showingPicker : Bool = false
    @State var showingBCoat : Bool = false
    @State var showingPCoat : Bool = false
    @State var showingTCoat : Bool = false
    @State var showingSysSummary : Bool = false
    @State var waste : Int = 0
    
    let thickness = ["5-7 mils" , "8-12 mils", "25-30 mils"]
        
    let types = ["Urethane Polymer Concrete RC /EZ", "Urethane Polymer Concrete RC /AP", "Urethane Polymer Concrete RC /FC"]
    
    
    let texture = ["Anti-Slip AO 60", "Anti-Slip AO 36", "Anti-Slip AO 24", "Industrial Sand #60", "Industrial Sand #30", "Industrial Sand #20"]
        
    let textAO2 = ["No Top Coat Texture 2","Anti-Slip AO 60", "Anti-Slip AO 36", "Anti-Slip AO 24"]
        
    let textSand2 = ["No Top Coat Texture 2","Industrial Sand #60", "Industrial Sand #30", "Industrial Sand #20"]
    
    func quant(product : stats) -> Int {
        let quantity : Float = (sf.squareF / product.covRate) * product.MixRat
         let kit = Int(ceil(Float(quantity / product.MixRat)))
         return kit
        } // returns number of kits required

    func BCoatQuantValues() {
        upcChoice.BCoatPtA = quant(product: UPCA) + upcChoice.BCoatWaste //The amount of part A in base coat
        upcChoice.BCoatPtB = quant(product: UPCB) + upcChoice.BCoatWaste //The amount of part B in base coat
        upcChoice.BCoatPtC = quant(product: UPCC) + upcChoice.BCoatWaste //The amount of part C in base coat
        upcChoice.BCoatColorant = quant(product: UPCColor ) + upcChoice.BCoatWaste // The amount of colorant in base coat
    }
    func PCoatQuantValues() {
        if upc.isPrimeCoat == true {
        upcChoice.PCoatPtA = quant(product: UPCA) + upcChoice.PCoatWaste //The amount of part A in prime coat
        upcChoice.PCoatPtB = quant(product: UPCB) + upcChoice.PCoatWaste //The amount of part B in prime coat
        upcChoice.PCoatPtC = quant(product: UPCC) + upcChoice.PCoatWaste //The amount of part C in prime coat
        upcChoice.PCoatColorant = quant(product: UPCColor ) + upcChoice.PCoatWaste // The amount of colorant in prime coat
            
        }
        else {
            upcChoice.PCoatPtA = 0
            upcChoice.PCoatPtB = 0
            upcChoice.PCoatPtC = 0
            upcChoice.PCoatColorant = 0
        }
    }
    
    func TCoatQuantValues() {
        if upc.isTopCoat == true {
        upcChoice.TCoatPtA = quant(product: UPCA) + upcChoice.TCoatWaste //The amount of part A in top coat
        upcChoice.TCoatPtB = quant(product: UPCB) + upcChoice.TCoatWaste //The amount of part B in top coat
        upcChoice.TCoatPtC = quant(product: UPCC) + upcChoice.TCoatWaste //The amount of part C in top coat
        upcChoice.TCoatColorant = quant(product: UPCColor ) + upcChoice.TCoatWaste // The amount of colorant in top coat
//        upcChoice.texture1Quant = quant(product: UPCA) + upcChoice.TCoatWaste // The amount of texture 1
//        upcChoice.texture2Quant = quant(product: UPCA) + upcChoice.TCoatWaste // The amount of texture 2

        }
        else {
            upcChoice.TCoatPtA = 0
            upcChoice.TCoatPtB = 0
            upcChoice.TCoatPtC = 0
            upcChoice.TCoatColorant = 0
            upcChoice.texture1Quant = 0
            upcChoice.texture2Quant = 0
        }
    }
    func CheckAllQuant() { // used to calculate quantity values 
        if upc.isPrimeCoat == true && upc.isTopCoat == true && (upcChoice.BCoatSelection == upcChoice.PCoatSelection) && (upcChoice.BCoatSelection != upcChoice.TCoatSelection) { // Base and Prime same 
        upcChoice.BCoatPtB = upcChoice.PCoatPtB + upcChoice.BCoatPtB
        }
        if upc.isPrimeCoat == true && upc.isTopCoat == true && (upcChoice.PCoatSelection == upcChoice.TCoatSelection) && (upcChoice.BCoatSelection != upcChoice.TCoatSelection) {  // Prime coat and top coat are the same
        upcChoice.TCoatPtB += upcChoice.BCoatPtB
        }
        if upc.isPrimeCoat == true && upc.isTopCoat == true && (upcChoice.BCoatSelection == upcChoice.TCoatSelection) && (upcChoice.BCoatSelection != upcChoice.PCoatSelection) && (upcChoice.PCoatSelection != upcChoice.TCoatSelection) {  // Base and top same 
        upcChoice.TCoatPtB += upcChoice.BCoatPtB
        }
        if upc.isPrimeCoat == true && upc.isTopCoat == true && (upcChoice.BCoatSelection == upcChoice.PCoatSelection) && (upcChoice.BCoatSelection == upcChoice.TCoatSelection) { //all same
        upcChoice.BCoatPtB = upcChoice.PCoatPtB + upcChoice.BCoatPtB + upcChoice.TCoatPtB
        }
        if upc.isPrimeCoat == true && upc.isTopCoat == false && upcChoice.BCoatSelection == upcChoice.PCoatSelection {
            upcChoice.BCoatPtB = upcChoice.PCoatPtB + upcChoice.BCoatPtB
        }
        if upc.isPrimeCoat == false && upc.isTopCoat == true && (upcChoice.BCoatSelection == upcChoice.TCoatSelection) {
            upcChoice.TCoatPtB += upcChoice.BCoatPtB
        }
    }
    
 
    
    func CheckTextureQuant() { // used to calculate quantity values
        if upcChoice.texture1 == upcChoice.texture2 {
            upcChoice.texture1Quant += upcChoice.texture2Quant
        }
        else if upcChoice.texture1 != upcChoice.texture2 {
            upcChoice.texture1Quant = quant(product: UPCA)  // The amount of texture 1
            upcChoice.texture2Quant = quant(product: UPCA)  // The amount of texture 2

        }
    }
    
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
        .padding()
        .onChange(of: upcChoice.BCoatWaste) { _ in
            BCoatQuantValues()
            PCoatQuantValues()
            TCoatQuantValues()
            CheckAllQuant()
        }
        .onChange(of: upcChoice.PCoatWaste) { _ in
            BCoatQuantValues()
            PCoatQuantValues()
            TCoatQuantValues()
            CheckAllQuant()
        }
        .onChange(of: upcChoice.TCoatWaste) { _ in
            BCoatQuantValues()
            PCoatQuantValues()
            TCoatQuantValues()
            CheckAllQuant()
        }
        .onChange(of: upc.ThicknessSelection) { _ in
            BCoatQuantValues()
            PCoatQuantValues()
            TCoatQuantValues()
            CheckAllQuant()
        }
        .onChange(of: upcChoice.BCoatSelection) { _ in
            BCoatQuantValues()
            PCoatQuantValues()
            TCoatQuantValues()
            CheckAllQuant()
        }
        .onChange(of: upcChoice.PCoatSelection) { _ in
            BCoatQuantValues()
            PCoatQuantValues()
            TCoatQuantValues()
            CheckAllQuant()
        }
        .onChange(of: upcChoice.TCoatSelection) { _ in
            BCoatQuantValues()
            PCoatQuantValues()
            TCoatQuantValues()
            CheckAllQuant()
        }
        .onChange(of: upc.isUVRes) { _ in
            BCoatQuantValues()
            PCoatQuantValues()
            TCoatQuantValues()
            CheckAllQuant()
        }
        .onChange(of: upc.isPrimeCoat) { _ in
            BCoatQuantValues()
            PCoatQuantValues()
            TCoatQuantValues()
            CheckAllQuant()
        }
        .onChange(of: upc.isTopCoat) { _ in
            BCoatQuantValues()
            PCoatQuantValues()
            TCoatQuantValues()
            CheckAllQuant()
        }
        
        if showingPicker == true && upc.isPrimeCoat == true {  // Base coat + prime coat
            Toggle(isOn: $showingPCoat) {
                Text("Prime Coat")
                    .fontWeight(.bold)
            }
            .toggleStyle(DropDownToggle())
            .padding()
            .background(Color(red:239.0/255.0, green: 243.0/255.0, blue: 244.0/250, opacity: 1.0))
//            .onAppear(perform: BCoatQuantValues)
//            .onAppear(perform: PCoatQuantValues)
            if showingPCoat == true {
                PCoatTT()
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
//            .onAppear(perform: BCoatQuantValues)
//            .onAppear(perform: getThickness)
        }
        if showingBCoat == true {
            BCoatTT()
        }
        if (showingPicker == true && upc.isTopCoat == true) && upc.isPrimeCoat == false {  // Base coat + top coat
            Toggle(isOn: $showingTCoat) {
                Text("Top Coat")
                    .fontWeight(.bold)
            }
            .toggleStyle(DropDownToggle())
            .padding()
            .background(Color(red:239.0/255.0, green: 243.0/255.0, blue: 244.0/250, opacity: 1.0))
//            .onAppear(perform: BCoatQuantValues)
//            .onAppear(perform: TCoatQuantValues)
//            .onAppear(perform: CheckAllQuant)
//
            if showingTCoat == true {
                TCoatTT()
            }
        }
        if showingPicker == true && upc.isTopCoat == true && upc.isPrimeCoat == true { // Base coat + top coat + prime coat
            Toggle(isOn: $showingTCoat) {
                Text("Top Coat")
                    .fontWeight(.bold)
            }
            .toggleStyle(DropDownToggle())
            .padding()
            .background(Color(red:239.0/255.0, green: 243.0/255.0, blue: 244.0/250, opacity: 1.0))

        if showingTCoat == true {
            TCoatTT()
            
        }
        
        }
        if showingPicker == true {
            Toggle(isOn: $showingSysSummary) {
                Text("Total KRETUS® Products")
                    .fontWeight(.bold)
            }
            
            .toggleStyle(DropDownToggle())
            .padding()
            .background(Color(red:239.0/255.0, green: 243.0/255.0, blue: 244.0/250, opacity: 1.0))
            if showingSysSummary == true {
                SysSummaryTT()
                    .onAppear(perform: BCoatQuantValues)
                    .onAppear(perform: TCoatQuantValues)
                    .onAppear(perform: PCoatQuantValues)
                    .onAppear(perform: CheckAllQuant)

            }
        }
    }
    
}
    
struct Coat_ChoicesTT_Previews: PreviewProvider {
    static let choice = sysChoices()
    static let upc = options()
    static var previews: some View {
        Coat_Choices().environmentObject(choice).environmentObject(upc)
    }
}


