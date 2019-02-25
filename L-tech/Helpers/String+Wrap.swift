//
//  String+Wrap.swift
//  L-tech
//
//  Created by Admin on 25/02/2019.
//  Copyright © 2019 Admin. All rights reserved.
//

import Foundation

extension String {
    func wrap(leftSymbol: String, rightSymbol: String, using pattern: String) throws -> String {
        let str = self
        let length = (str as NSString).length
        var newStringArray = [String]()
        
        do {
            let regularExp = try NSRegularExpression(pattern: pattern, options: [])
            let results = regularExp.matches(in: str as String, options: [], range: NSMakeRange(0, length))
            
            results.forEach {
                if $0.range.location >= length {
                    return
                }
                if $0.range.length == 0  {
                    newStringArray.append(
                        (str as NSString).substring(with: NSRange(location: $0.range.location, length: 1))
                    )
                } else {
                    let text = (str as NSString).substring(with: $0.range)
                    newStringArray.append("\(leftSymbol)\(text)\(rightSymbol)")
                }
            }
        } catch {
            throw error
        }
        return newStringArray.joined()
    }
}
