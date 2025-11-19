//
//  String+AppExtension.swift
//  HeavyWeightMigCoreData
//
//  Created by Orangebits iOS User on 18/11/25.
//

import Foundation


extension String {
    
    static func empty() -> String {return  ""}
    
    func toInt() -> Int {
        let result = NumberFormatter().number(from: self)?.intValue
        return result ?? 0
    }
    
}
