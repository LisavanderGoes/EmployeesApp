//
//  Created by WebIQ Stagiaire on 19-09-18.
//  Copyright © 2018 Lisa van der Goes. All rights reserved.
//

import Foundation

extension Occupation {
    static func cases() -> AnySequence<Occupation> {
        typealias S = Occupation
        return AnySequence { () -> AnyIterator<S> in
            var raw = 0
            return AnyIterator {
                let current : S = withUnsafePointer(to: &raw) { $0.withMemoryRebound(to: S.self, capacity: 1) { $0.pointee }
                }
                guard current.hashValue == raw else { return nil }
                raw += 1
                return current
            }
        }
    }
    
    static func allCases() -> [Occupation] {
        var allCases: [Occupation] = []
        cases().forEach{ occupation in
            allCases.append(occupation)
        }
        return allCases
    }
    
    static func count() -> Int {
        return allCases().count
    }
    
}
