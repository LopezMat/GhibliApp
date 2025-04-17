//
//  ImageLoader.swift
//  Ghibli
//
//  Created by Stagiaire on 17/04/2025.
//

import SwiftUI
import Combine

class LoadImage: ObservableObject {
    var didChange = PassthroughSubject<UIImage?, Never>()
    
    @Published var image: UIImage? {
        didSet{
            didChange.send(image)
        }
    }
    
    func load(_ urlString: String){
        guard let url = URL(string: urlString) else {return} //validation URL
        
        URLSession.shared.dataTask(with: url){ (d, _, _) in
            if let data = d {
                DispatchQueue.main.sync {
                    self.image = UIImage(data: data)
                }
            }
        }.resume()
    }
}
