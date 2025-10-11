//
//  NetworkingHelper.swift
//  MovieApp
//
//  Created by Shamkhal Guliyev on 02.10.25.
//

import Foundation
import Alamofire


enum EncodingType {
    case json, url
}

final class NetworkingHelper {
    private let version = "3"
    private let baseURL = "https://api.themoviedb.org/"
    private let imageBaseURL = "https://image.tmdb.org/t/p/original"
    
    let headers: HTTPHeaders = ["Authorization": "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJjNGY3M2Q3ZTZhZDQ3NmJhNDQ0MDI1MzJiMWVkYWE0YiIsIm5iZiI6MTc2MDE3MDc1Ni4yODYsInN1YiI6IjY4ZWExMzA0OWRkN2JhM2E1MzhhYTVkNSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.YgSXGldgz9hrSLSZwyP-6DZ7LOUSfz8cj_VrQyNxScY"]
    
    static let shared = NetworkingHelper()
    
    private init() {}
    
    func configureURL(endpoint: String) -> String {
        baseURL + version + "/" + endpoint
    }
    
    func configureImageURL(path: String) -> String {
        imageBaseURL + path
    }
}
