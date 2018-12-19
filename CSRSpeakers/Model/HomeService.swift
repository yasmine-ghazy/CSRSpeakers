//
//  HomeService.swift
//  CSRSpeakers
//
//  Created by apple on 8/6/18.
//  Copyright © 2018 Hesham. All rights reserved.
//

import Foundation
import Moya

enum HomeService{
    case getSpeakers
}

extension HomeService: TargetType{
    

    var baseURL: URL {
        return URL(string: "http://csrdev.code95.info")!
    }
    
    var path: String {
        return "/speakers"
    }
    
    var method: Moya.Method {
        return .get
    }
    
    var parameters: [String: Any]? {
        return ["lang": "en", "per_page": "100"]
    }

    
    var parameterEncoding: ParameterEncoding {
        return URLEncoding.queryString
    }
    
    var task: Task {
        return .requestParameters(parameters: self.parameters!, encoding: self.parameterEncoding)
    }
    
    var headers: [String : String]? {
        return [:]
    }
    
    public var validate: Bool {
        return false
    }
    
    var sampleData: Data {
        return "".data(using: .utf8)!
    }
    
    
}
