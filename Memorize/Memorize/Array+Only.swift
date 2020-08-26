//
//  Array+Only.swift
//  Memorize
//
//  Created by Gaurav Joshi on 6/26/20.
//  Copyright © 2020 Gaurav Joshi. All rights reserved.
//

import Foundation

extension Array{
    var only: Element?{
        count == 1 ? first: nil
    }
}
