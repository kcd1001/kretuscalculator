//
//  UPC Colorant .swift
//  ListTest
//
//  Created by Kane Davidson on 10/21/20.
//

import SwiftUI


class Colorant : ObservableObject {
    @Published var selection : Int = 0
    @Published var colorant = ["No Color (Unpigmented)", "Black", "Blue", "Bone",  "Brown", "Clay", "Gray", "Green", "Mustard",  "Red"]
}


struct UPC_Colorant_: View {
    
    @EnvironmentObject var color : Colorant
    @EnvironmentObject var upc : options

    
    func getThickness() -> Void {
        
         if upc.ThicknessSelection == 0 {
            upc.totalThickness = 12
        }
        else if upc.ThicknessSelection == 1 {
            upc.totalThickness = 20
        }
        else if upc.ThicknessSelection == 2{
            upc.totalThickness = 30
        }
        if upc.isPrimeCoat == true {
                upc.totalThickness += 7
            }
        if upc.isTopCoat == true {
                upc.totalThickness += 7
            }
    }
    
    var body: some View {
            HStack {
                Text("Color: ")
                    .fontWeight(.heavy)
                Spacer()
                Picker(selection: $color.selection,
                    label: ZStack {
                        Text("\(color.colorant[color.selection])")
                            .opacity(1)
                        Rectangle()
                            .fill(Color.gray)
                            .opacity(0.2)
                            .cornerRadius(5)
                            .frame(width: 200, height: 25)
                }) {
                    ForEach (0 ..< color.colorant.count, id: \.self) { index in
                        Text(self.color.colorant[index]).tag(index)
                    }
                }
                .background(Color.gray.opacity(0.2))
                .cornerRadius(5)
                .onChange(of: color.selection) { _ in
                    getThickness()
                }.padding()
            }
    }


struct UPC_Colorant__Previews: PreviewProvider {
   
    static let test = Colorant()
    
    static var previews: some View {
        UPC_Colorant_().environmentObject(test)
    }
}
}
