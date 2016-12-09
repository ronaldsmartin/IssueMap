//
//  BitbucketAPIService.swift
//  Issue Map
//
//  Created by Ronald Martin on 12/9/16.
//  Copyright © 2016 Ronald Martin. All rights reserved.
//

import Foundation
import Moya


let bitbucketAPI = RxMoyaProvider<BitbucketAPIService>()

enum BitbucketAPIService {
    case issues
}


extension BitbucketAPIService : TargetType {
    
    var baseURL: URL {
        return URL(string: "https://api.bitbucket.org/1.0/repositories/tutorials/tutorials.bitbucket.org")!
    }
    
    var path: String {
        switch self {
        case .issues:
            return "/issues"
        }
    }
        
    var method: Moya.Method {
        switch self {
        case .issues:
            return .get
        }
    }
    
    var parameters: [String : Any]? {
        switch self {
        case .issues:
            return nil
        }
    }
    
    var sampleData: Data {
        switch self {
        case .issues:
            return Data()
        }
    }
    
    var task: Task {
        switch self {
        case .issues:
            return .request
        }
    }
}
