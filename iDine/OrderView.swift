//
//  OrderView.swift
//  iDine
//
//  Created by Luis Francisco Piura Mejia on 8/13/20.
//  Copyright © 2020 Luis Francisco Piura Mejia. All rights reserved.
//

import SwiftUI

struct OrderView: View {
    
    @EnvironmentObject var order: Order
    
    var body: some View {
        Group {
            if order.canceled {
                ContentView()
            } else {
                NavigationView {
                    List {
                        Section {
                            ForEach(order.items) { item in
                                HStack {
                                    Text(item.name)
                                    Spacer()
                                    Text("$\(item.price)")
                                }
                            }
                            .onDelete(perform: removeItems(at:))
                        }
                        
                        Section {
                            NavigationLink(destination: CheckoutView()) {
                                Text("Order")
                            }
                        }.disabled(order.items.isEmpty)
                        
                        Section {
                            Button("Cancel") {
                                self.order.canceled.toggle()
                                self.order.items = []
                            }
                        }
                    }
                    .navigationBarTitle("Order")
                    .listStyle(GroupedListStyle())
                    .navigationBarItems(trailing: EditButton())
                }
            }
        }
    }
    
    func removeItems(at offsets: IndexSet) {
        order.items.remove(atOffsets: offsets)
    }
}

struct OrderView_Previews: PreviewProvider {
    static var previews: some View {
        OrderView()
            .environmentObject(Order())
    }
}
