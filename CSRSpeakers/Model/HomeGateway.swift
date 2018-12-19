//
//  SpeakersGateway.swift
//  CSRSpeakers
//
//  Created by apple on 8/6/18.
//  Copyright © 2018 Hesham. All rights reserved.
//

import Foundation
import Moya
import Moya_Gloss

public enum NetworkReply {
    case success
    case failure
}
public typealias GetSpeakersHandler = (NetworkReply, Int, SpeakersResponse?) -> Void

protocol homeGateway: class {
    func getSpeakers(completion: @escaping GetSpeakersHandler)
}

public class HomeGateway: homeGateway {

    private var provider :MoyaProvider<HomeService>!
    
    init() {
        let endpointClosure = { (target: HomeService) -> Endpoint<HomeService> in
            let defaultEndpoint = MoyaProvider.defaultEndpointMapping(for: target).adding(newHTTPHeaderFields: ["Content-Type":"application/json"])
            return defaultEndpoint
        }
        provider = MoyaProvider<HomeService>(endpointClosure: endpointClosure)
    }
    
    func getSpeakers(completion: @escaping GetSpeakersHandler) {
        provider.request(.getSpeakers) { (result) in
            switch result {
            case .success(let response):
                do {
                    let apiResponse = try response.mapObject(SpeakersResponse.self)
                    
                    if response.statusCode == 200 {
                        completion(.success, response.statusCode, apiResponse)
                    } else{
                        completion(.failure, response.statusCode , nil)
                    }
                } catch {
                    completion(.failure , 400, nil)
                }
            case .failure( _):
                
                completion(.failure , 404, nil)
            }
        }
    }
}
