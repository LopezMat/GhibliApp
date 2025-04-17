//
//  ContentView.swift
//  Ghibli
//
//  Created by Stagiaire on 17/04/2025.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var filmGetter = FilmGetter()
    
    var body: some View {
        NavigationView{
            List(filmGetter.films, id: \.id){ film in
                CellView(film: film)
            }
            .navigationTitle("🍥 Hayao Miyazaki 🇯🇵")
            .onAppear(){
                self.filmGetter.getFromAPI()
            }
        }
    }
}

#Preview {
    ContentView()
}
