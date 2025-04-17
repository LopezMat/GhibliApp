//
//  CellView.swift
//  Ghibli
//
//  Created by Stagiaire on 17/04/2025.
//

import SwiftUI

struct CellView: View {
    
    var film: Film
    
    @ObservedObject var imageLoader = LoadImage()
    
    var body: some View {
        NavigationLink(destination: DetailFilmView(film: film)) {
            HStack{
                //image si le lien existe
                
                if imageLoader.image != nil {
                    Image(uiImage: imageLoader.image!)
                        .resizable()
                        .frame(width: 55, height: 55, alignment: .center)
                        .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                        .overlay(Circle().stroke(Color.purple, lineWidth: 2))
                }
                
                Spacer()
                VStack(alignment: .trailing) {
                    Text(film.title)
                        .font(.title2)
                        .foregroundColor(.brown)
                    Text ("Anne : \(film.release_date)")
                        .font(.subheadline)
                        .foregroundColor(.orange)
                        .italic()
                }
            }
            .padding()
            .onAppear(){
                imageLoader.load(film.image)
        }
        }
    }
}

#Preview {
    let film:Film = Film(id: "1", title: "la grand illusion", image: "https://imgs.search.brave.com/WFwOPwAP7JVyXP0jm2LvlEv9iHvO1JQPfchcsTyJVDo/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly93d3cu/c3R1ZGlvZ2hpYmxp/LmZyL3dwLWNvbnRl/bnQvdXBsb2Fkcy8y/MDIwLzA5L3Bvbnlv/LXN0dWRpby1naGli/bGkuanBn", description: "ceci est un test", director: "Joe la rue", producer: "Ma grand mere sous alzheimer", release_date: "16/04/1964")
    return CellView(film: film)
}
