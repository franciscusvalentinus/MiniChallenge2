//
//  MultiPartFormDataRequest.swift
//  mini-challenge-2
//
//  Created by Dimas A. Prabowo on 02/11/21.
//

import Foundation

class MultiPartFormDataRequest {
    private let boundary: String = UUID().uuidString
    private var httpBody = NSMutableData()
    private let url: URL
    private let httpMethod: String
    
    init(url: URL, method: HTTPMethod) {
        self.url = url
        self.httpMethod = method.rawValue
    }
    
    /// Create `URLRequest` using MPFD request.
    ///
    /// - returns: Instance of `URLRequest` that follow MPFD rules.
    func asURLRequest() -> URLRequest {
        var request = URLRequest(url: url)
        request.httpMethod = httpMethod
        request.setValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")
        httpBody.append("--\(boundary)--")
        request.httpBody = httpBody as Data
        return request
    }
    
    /// Create text part of MPFD http body.
    ///
    ///  - parameters:
    ///     - name: A key parameter of information dictionary or a name category of specific information.
    ///     - value: A value that will send via http body in ASCII Field. This value contains information that will be send.
    func addASCIIField(named name: String, value: String) {
        httpBody.append(asciiFormField(named: name, value: value))
    }
    
    private func asciiFormField(named name: String, value: String) -> String {
        var fieldString = "--\(boundary)\r\n"
        fieldString += "Content-Disposition: form-data; name=\"\(name)\"\r\n"
        fieldString += "Content-Type: text/plain; charset=ISO-8859-1\r\n"
          fieldString += "Content-Transfer-Encoding: 8bit\r\n"
        fieldString += "\r\n"
        fieldString += "\(value)\r\n"
        
        print("fied \(fieldString)")
        return fieldString
    }
    
    /// Create data part of MPFD http body.
    ///
    ///  - parameters:
    ///     - name: A key parameter of information dictionary or a name category of specific information.
    ///     - data: `Data` that will be send via HTTP protocol with MPFD structure.
    ///     - mimeType:A content type of the `Data` that will be send.
    func addDataField(named name: String, data: Data, fileName: String, mimeType: String) {
        httpBody.append(dataFormField(named: name, data: data, fileName: fileName, mimeType: mimeType))
    }
    
    private func dataFormField(named name: String, data: Data, fileName: String, mimeType: String) -> Data {
        let fieldData = NSMutableData()
        fieldData.append("--\(boundary)\r\n")
        fieldData.append("Content-Disposition: form-data; name=\"\(name)\"; filename=\"\(fileName)\"\r\n")
        fieldData.append("Content-Type: \(mimeType)\r\n")
        fieldData.append("\r\n")
        fieldData.append(data)
        fieldData.append("\r\n")
        return fieldData as Data
    }
}

extension NSMutableData {
    func append(_ string: String) {
        if let data = string.data(using: .utf8) {
            append(data)
        }
    }
}
