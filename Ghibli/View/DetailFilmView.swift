//
//  DetailFilmView.swift
//  Ghibli
//
//  Created by Stagiaire on 17/04/2025.
//

import SwiftUI

struct DetailFilmView: View {
    
    var film:Film
    
    @ObservedObject var imageLoader = LoadImage()
    
    var body: some View {
        VStack{
            Spacer(minLength: 80)
            HStack{
                if imageLoader.image != nil {
                    Image(uiImage: imageLoader.image!)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 170)
                        .clipped()
            }
            Spacer()
                VStack(alignment: .trailing){
                    Text(film.title)
                        .font(.title3)
                        .padding(.bottom, 45)
                    Text(film.release_date)
                        .font(.subheadline)
                    Text(film.producer)
                    Text(film.director)
                }
            }
            Spacer(minLength: 25)
            Text(film.description)
                .frame(minHeight: 50, idealHeight: 100, maxHeight: .greatestFiniteMagnitude, alignment: .top)
        }
        .padding(10)
        .onAppear(){
            imageLoader.load(film.image)
        }
    }
}

#Preview {
    let film:Film = Film(id: "1", title: "la grand illusion", image: "https://imgs.search.brave.com/WFwOPwAP7JVyXP0jm2LvlEv9iHvO1JQPfchcsTyJVDo/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly93d3cu/c3R1ZGlvZ2hpYmxp/LmZyL3dwLWNvbnRl/bnQvdXBsb2Fkcy8y/MDIwLzA5L3Bvbnlv/LXN0dWRpby1naGli/bGkuanBn", description: "ceci est un test", director: "Joe la rue", producer: "Ma grand mere sous alzheimer", release_date: "16/04/1964")
    return DetailFilmView(film: film)
}
