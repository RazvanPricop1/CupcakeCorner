//
//  AddressView.swift
//  CupcakeCorner
//
//  Created by Razvan Pricop on 04.11.24.
//

import SwiftUI

struct AddressView: View {
    @Bindable var order: Order
    
    var body: some View {
        Form {
            Section {
                TextField("Name", text: $order.name)
                TextField("Street Address", text: $order.streetAddress)
                TextField("City", text: $order.city)
                TextField("Zip", text: $order.zip)
            }
            
            Section {
                NavigationLink(destination: {
                    saveAddress()
                    return CheckoutView(order: order)
                }) {
                    Text("Order now")
                }
            }
            .disabled(!hasValidAddress)
        }
        .navigationTitle("Delivery details")
        .navigationBarTitleDisplayMode(.inline)
    }
    
    var hasValidAddress: Bool {
        order.name.trimmingCharacters(in: .whitespaces).count > 0 && order.streetAddress.trimmingCharacters(in: .whitespaces).count > 0 && order.city.trimmingCharacters(in: .whitespaces).count > 0 && order.zip.trimmingCharacters(in: .whitespaces).count > 0
    }
    
    func saveAddress() {
        order.saveToDefaults()
    }
}

#Preview {
    AddressView(order: Order())
}
