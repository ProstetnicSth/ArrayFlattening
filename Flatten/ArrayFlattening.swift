//
//  ArrayFlattening.swift
//  Flatten
//
//  Created by Seyithan Teymur on 28/07/15.
//  Copyright © 2015 Brokoli. All rights reserved.
//

import Foundation

extension Array where Element: NSObject {
    func flattened() -> [NSObject] {
        var flattenedArray = [NSObject]()
        for member in self {
            
            if let memberArray = member as? [NSObject] {
                for nestedMember in memberArray.flattened() {
                    flattenedArray.append(nestedMember)
                }
            } else {
                flattenedArray.append(member)
            }
        }
        return flattenedArray
    }
}