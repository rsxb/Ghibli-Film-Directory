//
//  MovieService.swift
//  Ghibli Film Directory
//
//  Created by Ravneet Singh on 12/16/18.
//  Copyright © 2018 Ravneet Singh.  All rights reserved.
//

import Foundation

struct MovieService: Decodable {
    let results: [Movie]

    struct Movie: Decodable {
        let voteAverage, popularity: Float
        let title, posterPath, originalTitle, overview, releaseDate: String

        private enum CodingKeys: String, CodingKey {
            case voteAverage = "vote_average"
            case posterPath = "poster_path"
            case originalTitle = "original_title"
            case releaseDate = "release_date"
            case popularity, title, overview
        }
    }
}
