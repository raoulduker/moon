//
//  ContentView.swift
//  Moonshot
//
//  Created by Артем Петрюк on 31.01.2022.
//

import SwiftUI

struct ContentView: View {
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    
    @State private var showingGridView = false
    
    
    var body: some View {
        NavigationView {
            ScrollView {
                if showingGridView {
                    GridMissionsView(astronauts: astronauts, missions: missions)
                } else {
                    ListMissionsView(astronauts: astronauts, missions: missions)
                }
                
            }
            .navigationTitle("Moonshot")
            .background(.darkBackground)
            .preferredColorScheme(.dark)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        showingGridView.toggle()
                    } label: {
                        if showingGridView {
                            Image(systemName: "square.grid.2x2")
                        } else {
                            Image(systemName: "list.bullet")
                        }
                    }
                }
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
