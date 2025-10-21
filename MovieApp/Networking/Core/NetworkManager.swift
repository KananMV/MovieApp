//
//  NetworkManager.swift
//  Networking
//
//  Created by Shamkhal Guliyev on 30.09.25.
//

import Foundation
import Alamofire

class NetworkManager {
    func request<T: Codable>(url: String,
                             method: HTTPMethod = .get,
                             parameters: Parameters? = nil,
                             encoding: EncodingType = .url,
                             completion: @escaping ((T?, String?) -> Void)) {
        
        AF.request(url,
                   method: method,
                   parameters: parameters,
                   encoding: encoding == .url ? URLEncoding.default : JSONEncoding.default,
                   headers: NetworkingHelper.shared.headers)
          .responseDecodable(of: T.self) { response in
            switch response.result {
            case .success(let data):
                completion(data, nil)
            case .failure(let error):
                completion(nil, error.localizedDescription)
            }
        }
    }
    
    func request<T: Codable>(url: String,
                             method: HTTPMethod = .get,
                             parameters: Parameters? = nil,
                             encoding: EncodingType = .url,
                             completion: @escaping ((CoreModel<T>?, String?) -> Void)) {
        
        AF.request(url,
                   method: method,
                   parameters: parameters,
                   encoding: encoding == .url ? URLEncoding.default : JSONEncoding.default, headers: NetworkingHelper.shared.headers).responseDecodable(of: CoreModel<T>.self) { response in
            switch response.result {
            case .success(let data):
                completion(data, nil)
            case .failure(let error):
                completion(nil, error.localizedDescription)
            }
        }
        
    }
}
