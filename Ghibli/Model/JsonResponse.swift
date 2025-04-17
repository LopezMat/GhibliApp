//
//  JsonResponse.swift
//  Ghibli
//
//  Created by Stagiaire on 17/04/2025.
//

import Foundation

struct Film: Decodable{
    var id: String
    var title: String
    var image: String
    var description: String
    var director: String
    var producer: String
    var release_date: String
}
