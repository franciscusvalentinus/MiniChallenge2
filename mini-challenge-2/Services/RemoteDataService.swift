//
//  RemoteDataService.swift
//  mini-challenge-2
//
//  Created by Dimas A. Prabowo on 29/10/21.
//  Modified by Clarence

import Foundation
import UIKit

class RemoteDataService {
    /// HTTP GET method to get data from remote directory. This method is call in async condition.
    ///
    /// - parameter url: An end-point url in `String` format.
    /// - returns: Data that have decoded to specific object/structure from remote directory.
    /// - throws: An error if url have wrong format or url is wrong.
    /// - throws: An error when server can't be reach for certains condition.
    /// - throws: An error if any value throws an error during decoding.
    func getData<T: Codable>(_: T.Type, url: String, token: String?) async throws -> T {
        guard let url = URL(string: url) else {
            throw RemoteServiceError.badURL
        }
        var request = URLRequest(url: url)
        let apiToken = token ?? ""
        request.setValue("Bearer \(apiToken)", forHTTPHeaderField: "Authorization")
        request.setValue("application/json", forHTTPHeaderField: "Accept")

        let (data, response) = try await URLSession.shared.data(for: request)

        guard let httpResponse = response as? HTTPURLResponse else {
            throw RemoteServiceError.badServerResponse
        }
        guard (200 ... 299).contains(httpResponse.statusCode) else {
            throw RemoteServiceError.badResponseID(status: httpResponse.statusCode)
        }

        let decodedData = try JSONDecoder().decode(T.self, from: data)
        return decodedData
    }

    /// HTTP POST method to upload data from remote directory. This method is call in async condition.
    ///
    /// - parameters:
    ///   - url: An end-point url in `String` format.
    ///   - parameter: An object that will uploaded to remote directory.
    /// - throws: An error if url have wrong format or url is wrong.
    /// - throws: An error when server can't be reach for certains condition.
    /// - throws: An error if any value throws an error during decoding.
    func postData<T: Codable>(_: T.Type, url: String, body: [String: String], useToken: Bool = true, header: [String: String]? = nil) async throws -> T {
        guard let url = URL(string: url) else {
            throw RemoteServiceError.badURL
        }
        let jsonData = try JSONEncoder().encode(body)

        var request = URLRequest(url: url)
        request.httpMethod = HTTPMethod.post.rawValue
        request.httpBody = jsonData
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json", forHTTPHeaderField: "Accept")

        if useToken {
            let token = "wkctKgTqds2KXBYOdqpLIKTY"
            request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        }

        if let header = header {
            for h in header {
                request.addValue(h.value, forHTTPHeaderField: h.key)
            }
        }

        let (data, response) = try await URLSession.shared.data(for: request)
        guard let httpResponse = response as? HTTPURLResponse else {
            throw RemoteServiceError.badServerResponse
        }
        guard (200 ... 299).contains(httpResponse.statusCode) else {
            throw RemoteServiceError.badResponseID(status: httpResponse.statusCode)
        }
        let decodedData = try JSONDecoder().decode(T.self, from: data)
        return decodedData
    }

    /// HTTP POST method to upload data from remote directory. This method is call in async condition.
    ///
    /// - parameters:
    ///   - url: An end-point url in `String` format.
    ///   - parameter: An object that will uploaded to remote directory.
    /// - throws: An error if url have wrong format or url is wrong.
    /// - throws: An error when server can't be reach for certains condition.
    /// - throws: An error if any value throws an error during decoding.
    func postProfileImage(url: String, fileName: String, imageData: UIImage, useToken: Bool = true, header: [String: String]? = nil) async throws -> Data {
        guard let url = URL(string: url) else {
            throw RemoteServiceError.badURL
        }
        let mpfd = MultiPartFormDataRequest(url: url, method: .post)
        mpfd.addDataField(named: fileName, data: imageData.jpegData(compressionQuality: 0.5) ?? Data(), fileName: "\(header?["userId"] ?? "profile").jpeg", mimeType: "image/jpeg")
        var request = mpfd.asURLRequest()

        if useToken {
            let token = "wkctKgTqds2KXBYOdqpLIKTY"
            request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        }

        if let header = header {
            for h in header {
                request.addValue(h.value, forHTTPHeaderField: h.key)
            }
        }

        let (data, response) = try await URLSession.shared.data(for: request)
        guard let httpResponse = response as? HTTPURLResponse else {
            throw RemoteServiceError.badServerResponse
        }
        guard (200 ... 299).contains(httpResponse.statusCode) else {
            throw RemoteServiceError.badResponseID(status: httpResponse.statusCode)
        }
        return data
    }
}
