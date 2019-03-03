//
//  DateParameter.swift
//  PunkAPI
//
//  Created by Andrea Altea on 02/03/2019.
//

import Foundation

struct DateParameter: RequestParameter {
    
    static var formatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.locale = Locale.current
        formatter.dateFormat = "MM-yyyy"
        return formatter
    }()
    
    var type: String
    var condition: Condition
    var dateValue: Date
    
    var key: String {
        return "\(type)_\(condition.time)"
    }
    
    var value: Any {
        return DateParameter.formatter.string(from: dateValue)
    }
}
