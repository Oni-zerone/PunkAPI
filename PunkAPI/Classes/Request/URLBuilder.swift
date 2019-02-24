//
//  URLBuilder.swift
//  PunkAPI
//
//  Created by Andrea Altea on 24/02/2019.
//

import Foundation

extension URL {
    
    func url(request: Request) -> URL? {
        
        let url = self.appendingPathComponent(request.path)
        guard var components = URLComponents(url: url, resolvingAgainstBaseURL: true) else { return nil }
        components.queryItems = request.parameters?.map { URLQueryItem(name: $0, value: "\($1)") }
        return components.url
    }
}
