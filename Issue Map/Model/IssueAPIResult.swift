//
//  IssueAPIResult.swift
//  Issue Map
//
//  Created by Ronald Martin on 12/9/16.
//  Copyright © 2016 Ronald Martin. All rights reserved.
//

import Foundation
import ObjectMapper

struct IssueAPIResult : ImmutableMappable {
    let issues: [Issue]
    
    init(map: Map) throws {
        issues = try map.value("issues")
    }
}
