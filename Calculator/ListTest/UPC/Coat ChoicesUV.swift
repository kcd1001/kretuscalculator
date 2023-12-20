//
//  Coat Choices.swift
//  ListTest
//
//  Created by Kane Davidson on 12/9/20.
//


import SwiftUI
import Combine




struct Coat_ChoicesUV: View {
    
    @EnvironmentObject var upcChoiceRC : sysChoices //Used for coat selections
    @EnvironmentObject var upc : options //Used for coat checkboxes
    @EnvironmentObject var UPCA : stats //Used for system stats (mixRat,CovRate, etc)
    @EnvironmentObject var UPCB : stats //Used for system stats (mixRat,CovRate, etc)
    @EnvironmentObject var UPCC : stats //Used for system stats (mixRat,CovRate, etc)
    @EnvironmentObject var UPCColor : stats
    @EnvironmentObject var sf : SquareFeet //Square feet
    @EnvironmentObject var color : Colorant //colorant
    @State var showingPicker : Bool = false
    @State var showingBCoat : Bool = false
    @State var showingPCoat : Bool = false
    @State var showingTCoat : Bool = false
    @State var showingSysSummary : Bool = false
    @State var waste : Int = 0
    
    let thickness = [ "8-12 mils","15-20 mils", "25-30 mils"]

    let types = ["Urethane Polymer Concrete RC /EZ", "Urethane Polymer Concrete RC /AP", "Urethane Polymer Concrete RC /FC"]
    
    
    let texture = ["Anti-Slip AO 60", "Anti-Slip AO 36", "Anti-Slip AO 24", "Industrial Sand #60", "Industrial Sand #30", "Industrial Sand #20"]
        
    let textAO2 = ["No Top Coat Texture 2","Anti-Slip AO 60", "Anti-Slip AO 36", "Anti-Slip AO 24"]
        
    let textSand2 = ["No Top Coat Texture 2","Industrial Sand #60", "Industrial Sand #30", "Industrial Sand #20"]
    
    func quant(product : stats) -> Int {
        let quantity : Float = (sf.squareF / product.covRate) * product.MixRat
         let kit = Int(ceil(Float(quantity / product.MixRat)))
         return kit
        } // returns number of kits required
    
    func quantPT(product : stats) -> Int {
        let quantity : Float = (sf.squareF / 200) * product.MixRat
         let kit = Int(ceil(Float(quantity / product.MixRat)))
         return kit
        } // returns number of kits required
    

    func BCoatQuantValues() {
        upcChoiceRC.BCoatPtA = quant(product: UPCA) + upcChoiceRC.BCoatWaste //The amount of part A in base coat
        upcChoiceRC.BCoatPtB = quant(product: UPCB) + upcChoiceRC.BCoatWaste //The amount of part B in base coat
        upcChoiceRC.BCoatPtC = quant(product: UPCC) + upcChoiceRC.BCoatWaste //The amount of part C in base coat
        upcChoiceRC.BCoatColorant = quant(product: UPCColor ) + upcChoiceRC.BCoatWaste // The amount of colorant in base coat
    }
    func PCoatQuantValues() {
        if upc.isPrimeCoat == true {
        upcChoiceRC.PCoatPtA = quantPT(product: UPCA) + upcChoiceRC.PCoatWaste //The amount of part A in prime coat
        upcChoiceRC.PCoatPtB = quantPT(product: UPCB) + upcChoiceRC.PCoatWaste //The amount of part B in prime coat
        upcChoiceRC.PCoatPtC = quantPT(product: UPCC) + upcChoiceRC.PCoatWaste //The amount of part C in prime coat
        upcChoiceRC.PCoatColorant = quantPT(product: UPCColor ) + upcChoiceRC.PCoatWaste // The amount of colorant in prime coat
            
        }
        else {
            upcChoiceRC.PCoatPtA = 0
            upcChoiceRC.PCoatPtB = 0
            upcChoiceRC.PCoatPtC = 0
            upcChoiceRC.PCoatColorant = 0
        }
    }
    
    func TCoatQuantValues() {
        if upc.isTopCoat == true {
        upcChoiceRC.TCoatPtA = quantPT(product: UPCA) + upcChoiceRC.TCoatWaste //The amount of part A in top coat
        upcChoiceRC.TCoatPtB = quantPT(product: UPCB) + upcChoiceRC.TCoatWaste //The amount of part B in top coat
        upcChoiceRC.TCoatPtC = quantPT(product: UPCC) + upcChoiceRC.TCoatWaste //The amount of part C in top coat
        upcChoiceRC.TCoatColorant = quantPT(product: UPCColor ) + upcChoiceRC.TCoatWaste // The amount of colorant in top coat


        }
        else {
            upcChoiceRC.TCoatPtA = 0
            upcChoiceRC.TCoatPtB = 0
            upcChoiceRC.TCoatPtC = 0
            upcChoiceRC.TCoatColorant = 0
            upcChoiceRC.texture1Quant = 0
            upcChoiceRC.texture2Quant = 0
        }
    }
    func CheckAllQuant() { // used to calculate quantity values 
        if upc.isPrimeCoat == true && upc.isTopCoat == true && (upcChoiceRC.BCoatSelection == upcChoiceRC.PCoatSelection) && (upcChoiceRC.BCoatSelection != upcChoiceRC.TCoatSelection) { // Base and Prime same
        upcChoiceRC.BCoatPtB = upcChoiceRC.PCoatPtB + upcChoiceRC.BCoatPtB
        }
        if upc.isPrimeCoat == true && upc.isTopCoat == true && (upcChoiceRC.PCoatSelection == upcChoiceRC.TCoatSelection) && (upcChoiceRC.BCoatSelection != upcChoiceRC.TCoatSelection) {  // Prime coat and top coat are the same
        upcChoiceRC.TCoatPtB += upcChoiceRC.BCoatPtB
        }
        if upc.isPrimeCoat == true && upc.isTopCoat == true && (upcChoiceRC.BCoatSelection == upcChoiceRC.TCoatSelection) && (upcChoiceRC.BCoatSelection != upcChoiceRC.PCoatSelection) && (upcChoiceRC.PCoatSelection != upcChoiceRC.TCoatSelection) {  // Base and top same
        upcChoiceRC.TCoatPtB += upcChoiceRC.BCoatPtB
        }
        if upc.isPrimeCoat == true && upc.isTopCoat == true && (upcChoiceRC.BCoatSelection == upcChoiceRC.PCoatSelection) && (upcChoiceRC.BCoatSelection == upcChoiceRC.TCoatSelection) { //all same
        upcChoiceRC.BCoatPtB = upcChoiceRC.PCoatPtB + upcChoiceRC.BCoatPtB + upcChoiceRC.TCoatPtB
        }
        if upc.isPrimeCoat == true && upc.isTopCoat == false && upcChoiceRC.BCoatSelection == upcChoiceRC.PCoatSelection {
            upcChoiceRC.BCoatPtB = upcChoiceRC.PCoatPtB + upcChoiceRC.BCoatPtB
        }
        if upc.isPrimeCoat == false && upc.isTopCoat == true && (upcChoiceRC.BCoatSelection == upcChoiceRC.TCoatSelection) {
            upcChoiceRC.TCoatPtB += upcChoiceRC.BCoatPtB
        }
        
    }
    
    func getThickness() -> Void {
        if upc.ThicknessSelection == 0 {
            upc.totalThickness = 12
        }
        else if upc.ThicknessSelection == 1 {
            upc.totalThickness = 20
        }
        else if upc.ThicknessSelection == 2 {
            upc.totalThickness = 30
        }
        if upc.isPrimeCoat == true {
                upc.totalThickness += 7
            }
        if upc.isTopCoat == true {
                upc.totalThickness += 12
            }
        if color.selection == 3 || color.selection == 8 {
            upc.ThicknessSelection = 3
        }
    }
    
    func CheckTextureQuant() { // used to calculate quantity values
        upcChoiceRC.texture1Quant = quant(product: UPCA)
        upcChoiceRC.texture2Quant = quant(product: UPCA)
        
        if upcChoiceRC.texture1 == upcChoiceRC.texture2 {
            upcChoiceRC.texture1Quant += upcChoiceRC.texture2Quant
        }
        else if upcChoiceRC.texture1 != upcChoiceRC.texture2 {
            upcChoiceRC.texture1Quant = quant(product: UPCA)  // The amount of texture 1
            upcChoiceRC.texture2Quant = quant(product: UPCA)  // The amount of texture 2

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
        .onChange(of: upcChoiceRC.BCoatWaste) { _ in
            BCoatQuantValues()
            PCoatQuantValues()
            TCoatQuantValues()
            CheckAllQuant()
        }
        .onChange(of: upcChoiceRC.PCoatWaste) { _ in
            BCoatQuantValues()
            PCoatQuantValues()
            TCoatQuantValues()
            CheckAllQuant()
        }
        .onChange(of: upcChoiceRC.TCoatWaste) { _ in
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
        .onChange(of: upcChoiceRC.BCoatSelection) { _ in
            BCoatQuantValues()
            PCoatQuantValues()
            TCoatQuantValues()
            CheckAllQuant()
        }
        .onChange(of: upcChoiceRC.PCoatSelection) { _ in
            BCoatQuantValues()
            PCoatQuantValues()
            TCoatQuantValues()
            CheckAllQuant()
        }
        .onChange(of: upcChoiceRC.TCoatSelection) { _ in
            BCoatQuantValues()
            PCoatQuantValues()
            TCoatQuantValues()
            CheckAllQuant()
        }
        .onChange(of: upc.isPrimeCoat) { _ in
            getThickness()
        }
        .onChange(of: upc.isTopCoat) { _ in
            getThickness()
        }
        .onChange(of: color.selection) { _ in
          getThickness()
        }
        if showingPicker == true && upc.isPrimeCoat == true {  // Base coat + prime coat
            Toggle(isOn: $showingPCoat) {
                Text("Prime Coat (@ 5-7 mils)")
                    .fontWeight(.bold)
            }
            .toggleStyle(DropDownToggle())
            .padding()
            .background(Color(red:239.0/255.0, green: 243.0/255.0, blue: 244.0/250, opacity: 1.0))
            if showingPCoat == true {
                PCoatUV()
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

        }
        if showingBCoat == true {
            BCoatUV()
        }
        if (showingPicker == true && upc.isTopCoat == true) && upc.isPrimeCoat == false {  // Base coat + top coat
            Toggle(isOn: $showingTCoat) {
                Text("Top Coat (@ 8-12 mils)")
                    .fontWeight(.bold)
            }
            .toggleStyle(DropDownToggle())
            .padding()
            .background(Color(red:239.0/255.0, green: 243.0/255.0, blue: 244.0/250, opacity: 1.0))

            if showingTCoat == true {
                TCoatUV()
            }
        }
        if showingPicker == true && upc.isTopCoat == true && upc.isPrimeCoat == true { // Base coat + top coat + prime coat
            Toggle(isOn: $showingTCoat) {
                Text("Top Coat (@ 8-12 mils)")
                    .fontWeight(.bold)
            }
            .toggleStyle(DropDownToggle())
            .padding()
            .background(Color(red:239.0/255.0, green: 243.0/255.0, blue: 244.0/250, opacity: 1.0))

        if showingTCoat == true {
            TCoatUV()

            
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
                SysSummaryUV()
                    .onAppear(perform: getThickness)
                    .onAppear(perform: BCoatQuantValues)
                    .onAppear(perform: TCoatQuantValues)
                    .onAppear(perform: PCoatQuantValues)
                    .onAppear(perform: CheckAllQuant)
            } 
        }
    }
    
}
    
struct Coat_ChoicesUV_Previews: PreviewProvider {
    static let choice = sysChoices()
    static let upc = options()
    static var previews: some View {
        Coat_Choices().environmentObject(choice).environmentObject(upc)
    }
}


