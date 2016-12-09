//
//  Issue.swift
//  Issue Map
//
//  Created by Ronald Martin on 12/9/16.
//  Copyright © 2016 Ronald Martin. All rights reserved.
//

import Foundation
import ObjectMapper

struct Issue : ImmutableMappable {
    
    let title: String
    let content: String
    
    init(map: Map) throws {
        title = try map.value("title")
        content = try map.value("content")
    }
}
