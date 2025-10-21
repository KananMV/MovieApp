//
//  Movie.swift
//  MovieApp
//
//  Created by Shamkhal Guliyev on 02.10.25.
//

import Foundation


struct MovieResult: Codable, TopImageBottomLabelCellProtocol, SimilarItemProtocol, SearchTableViewCellProtocol {
    
        
    var titleText: String {
        title ?? ""
    }
    
    var imageURL: String {
        posterPath ?? ""
    }
    
    let adult: Bool?
    let backdropPath: String?
    let genreIDS: [Int]?
    let id: Int?
    let originalLanguage, originalTitle, overview: String?
    let popularity: Double?
    let posterPath, releaseDate, title: String?
    let video: Bool?
    let voteAverage: Double?
    let voteCount: Int?

    enum CodingKeys: String, CodingKey {
        case adult
        case backdropPath = "backdrop_path"
        case genreIDS = "genre_ids"
        case id
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case overview, popularity
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case title, video
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
}
