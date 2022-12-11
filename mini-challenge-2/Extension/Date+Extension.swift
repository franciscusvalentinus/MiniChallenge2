//
//  Date+Extension.swift
//  mini-challenge-2
//
//  Created by Clarence on 23/06/22.
//  https://gist.github.com/alexpaul/58d068bcc9c11b2a66954ff0cea87587

import Foundation

enum DateFormat: String {
    case fullDate = "EEEE, d MMMM yyyy"
    case date = "d MMMM yyyy"
}

extension Date {
    static func getStringFromDate(date: Date, _ format: DateFormat) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format.rawValue
        dateFormatter.locale = Locale(identifier: "id_ID")
        let dateString = dateFormatter.string(from: date)
        return dateString
    }

    static func getDateFromString(dateString: String) -> Date? {
        let formatter = ISO8601DateFormatter()
        formatter.formatOptions = [.withInternetDateTime,
                                   .withDashSeparatorInDate,
                                   .withFullDate,
                                   .withFractionalSeconds,
                                   .withColonSeparatorInTimeZone]
        guard let date = formatter.date(from: dateString) else {
            return nil
        }
        return date
    }

    // get an ISO timestamp
    static func getISOTimestamp() -> String {
        let isoDateFormatter = ISO8601DateFormatter()
        let timestamp = isoDateFormatter.string(from: Date())
        return timestamp
    }
}
