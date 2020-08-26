//
//  Array+Idenifiable.swift
//  Memorize
//
//  Created by Gaurav Joshi on 6/26/20.
//  Copyright © 2020 Gaurav Joshi. All rights reserved.
//

import Foundation

extension Array where Element: Identifiable{
    func firstIndex(matching: Element) -> Int?{
        for index in 0..<self.count{
            if self[index].id == matching.id{
                return index
            }
        }
        return nil
    }
}
