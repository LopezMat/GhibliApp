//
//  FilmGetter.swift
//  Ghibli
//
//  Created by Stagiaire on 17/04/2025.
//

import SwiftUI
import Combine

class FilmGetter: ObservableObject {
    var didChange = PassthroughSubject<[Film], Never>()
    
    @Published var films:  [Film] = [] {
        didSet{
            didChange.send(films)
        }
    }
    
    func getFromAPI(){
        let urlString = "https://ghibliapi.vercel.app/films"
        guard let url = URL(string: urlString) else {return}
        
        URLSession.shared.dataTask(with: url){ (d, r, e) in
            if let error = e {
                print("here is error")
                print(error.localizedDescription) //recup message d'erreur
            }
            
            if let data = d {
                do{
                    let result: [Film] = try JSONDecoder().decode([Film].self, from: data)
                    DispatchQueue.main.sync{
                        self.films = result
                    }
                } catch {
                    print(error.localizedDescription)
                }
            }
        }.resume()
    }
}

