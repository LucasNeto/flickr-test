//
//  BaseService.swift
//  Flickr
//
//  Created by Lucas  N Santana on 01/04/25.
//
import Foundation

enum HTTPMethod : String {
    case GET = "GET"
    case PUT = "PUT"
    case POST = "POST"
    case DELETE = "DELETE"
    case OPTIONS = "OPTIONS"
}

protocol BaseService {
    var urlSessionShared: URLSession { get }
    func request<T:Codable>(url: URL, completion: @escaping (Result<T, Error>) -> Void)
    func request<T:Codable>(url: URL, method: HTTPMethod, body: Data?, completion: @escaping (Result<T, Error>) -> Void)
}

extension BaseService {
    
    var urlSessionShared: URLSession {
        return URLSession.shared
    }
    
    func request<T:Codable>(url: URL, completion: @escaping (Result<T, Error>) -> Void) {
        request(url: url, method: .GET, body: nil, completion: completion)
    }
    func request<T>(url: URL, method: HTTPMethod, body: Data?, completion: @escaping (Result<T, any Error>) -> Void) where T : Decodable, T : Encodable {
        Task {
            do {
                var request = URLRequest(url: url)
                request.httpMethod = method.rawValue
                request.httpBody = body
                let (data, _) = try await urlSessionShared.data(for: request)
                completion(.success(try JSONDecoder().decode(T.self, from: data)))
                return
                
            } catch {
                completion(.failure(error))
            }
        }
    }
}
