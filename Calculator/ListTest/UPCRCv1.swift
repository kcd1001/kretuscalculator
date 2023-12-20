//
//  UPCCoat.swift
//  ListTest
//
//  Created by Kane Davidson on 10/21/20.




import SwiftUI
import Combine

class Order: ObservableObject{ // Used for picker in part B
    // @Published var didChange = PassthroughSubject <Void, Never>()
    
    static let types = ["RC AP", "RC EZ", "RC FC"]
    @Published var type = 0 // Need to use @Published on the var type because it is updating with user input.
    
}

#if canImport(UIKit)
extension View {
    func hideKeyboard()  {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil,  from: nil, for: nil)
        
    }
}
#endif



struct item { //Structure for Each Part in coats
    var product = ""
    var covRate : Float = 0
    var MixRat : Float = 0
    
    init(product: String, covRate: Float, MixRat: Float) {
        self.product = product
        self.covRate = covRate
        self.MixRat = MixRat
    }
    
}

var UPCA = item(product: "Urethane Polymer Concrete Part A:", covRate: 200.0, MixRat: 6.0)
var UPCB = item(product: "Urethane Polymer Concrete", covRate: 200.0, MixRat: 6.0)
var UPCC = item(product: "Urethane Polymer Concrete Part C:", covRate: 200.0, MixRat: 6.0)

struct UPCRC: View {
    @ObservedObject var order = Order() //order is the variable that is taking the values of the array and is being observed.

@State var sf : Float = 200.0
@State var newsf : Float = 0.0
    
func quant(product : item) -> Float {
     let quantity : Float = (sf / product.covRate) * product.MixRat
        return quantity
    }


    var body: some View {
            VStack {
                VStack(alignment: .leading){
                    Text("Total Square Feet")
                        .font(.title)
                        .fontWeight(.heavy)
                    HStack {
                        TextField("",value: $sf, formatter: NumberFormatter())
                            .padding(.all)
                            .background(Color(red:239.0/255.0, green: 243.0/255.0, blue: 244.0/250, opacity: 1.0))
                            .cornerRadius(5.0)
                    }

                }.padding(.horizontal, 15)

                /*Form{
                    VStack { //VStack for UPC Part A
                        HStack {
                            Text(UPCA.product)
                            Spacer()
                            Text("RC/TT")
                        }
                        HStack {
                            Text("Mixing Ratio:")
                                .font(.caption)
                            Text("\(UPCA.MixRat,specifier: "%.1f")  lbs")
                                .font(.caption)
                            
                        }
                        HStack{
                            Text("Coverage Rate: ")
                                .font(.caption)
                            Text("\(UPCA.covRate, specifier: "%.1f") sf/kit")
                                .font(.caption)
                        }
                        HStack{
                            Text("Quantity Needed: ")
                                .font(.caption)
                            Text(String(quant(product: UPCA)))
                                .font(.caption)
                            Text("lb")
                                .font(.caption)
                        
                            
                        }
                    } // End of UPCA VStack */
                    Picker(selection: $order.type,
                           label: VStack {
                            Text(UPCB.product)
                
                           }, //End of VStack
                           content: /*@START_MENU_TOKEN@*/{
                                ForEach (0 ..< Order.types.count)
                                    {
                                        Text(Order.types[$0]).tag($0)
                                    }
                           }/*@END_MENU_TOKEN@*/)
                        .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                    
                 /*   VStack { //VStack for Part C + Mixing Ratio + Coverage Rate
                        HStack {
                            Text(UPCC.product)
                            Spacer()
                            Text("RC/TT")
                            
                        }
                        HStack {
                            Text("Mixing Ratio:")
                                .font(.caption)
                            Text("\(UPCA.MixRat, specifier: "%.1f") lbs")
                                .font(.caption)
                            
                        }
                        HStack{
                            Text("Coverage Rate: ")
                                .font(.caption)
                            Text("\(UPCA.covRate, specifier: "%.1f") sf/kit")
                                .font(.caption)
                        }
                        HStack{
                            Text("Quantity Needed: ")
                                .font(.caption)
                            Text(String(quant(product: UPCC)))
                                .font(.caption)
                            Text("lb")
                                .font(.caption)
                        }
                    } */
                    
                }.navigationTitle("Base Coat")
                
            }
        }
    


struct UPCCoat_Previews: PreviewProvider {
    static var previews: some View {
        UPCRC()
    }
}
