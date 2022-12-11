//
//  api_token.swift
//  mini-challenge-2
//
//  Created by Daffa Yagrariksa on 27/06/22.
//

import Foundation
struct APIToken: Codable, Hashable {
    var token: String

    static func getPath() -> URL {
        let documentsDirectory: URL = FileManager
            .default.urls(for: .documentDirectory, in: .userDomainMask).first!
        let archiveURL: URL = documentsDirectory
            .appendingPathComponent("api_token")
            .appendingPathExtension("plist")
        return archiveURL
    }

    static func saveToken(_ token: APIToken) {
        let propertyListEncoder = PropertyListEncoder()
        let encodedAccounts = try? propertyListEncoder.encode(token)
        try? encodedAccounts?.write(to: APIToken.getPath(), options: .noFileProtection)
    }

    static func loadToken() -> APIToken? {
        let propertyListDecoder = PropertyListDecoder()
        if let retrivedData = try? Data(contentsOf: getPath()) {
            if let decodedAccounts = try? propertyListDecoder
                .decode(APIToken.self, from: retrivedData)
            {
                return decodedAccounts
            }
        }
        return nil
    }
}
