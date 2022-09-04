import Foundation
import Alamofire

protocol NetworkServiceProtocol {
  func getPhotos() async throws -> [Photo]
  func searchPhotos(with query: String) async throws -> [Photo]
}

protocol APIRouteable: URLRequestConvertible {
    var baseURL: String { get }
    var path: String { get }
    var method: HTTPMethod { get }
    var parameters: Parameters? { get }
    var encoding: ParameterEncoding { get }
}

extension APIRouteable {
  var baseURL: String { return "https://api.unsplash.com/" }
  func asURLRequest() throws -> URLRequest {
    let url = try baseURL.asURL().appendingPathComponent(path)
    var urlRequest = URLRequest(url: url)
    urlRequest.httpMethod = method.rawValue
    urlRequest.headers = ["Authorization": "Client-ID UzbS6nwZ-iRXbSFgy-stSiW5NWkhlHQ66IVQaCkOYcY"]
    return try encoding.encode(urlRequest, with: parameters)
  }
}

struct GetBooks: APIRouteable {
  var path: String
  var method: HTTPMethod
  var parameters: Parameters?
  var encoding: ParameterEncoding
}

final  class NetworkService: NetworkServiceProtocol {
  private func performRequest<T: Codable>(urlRequestConvertible: URLRequestConvertible) async throws -> T {
    let dataTask = AF.request(urlRequestConvertible).serializingDecodable(T.self)
    let value = try await dataTask.value
    dump(value)
    return value
  }

  func getPhotos() async throws -> [Photo] {
    let request = GetBooks(path: "photos",
                           method: .get,
                           parameters: ["page": 1, "per_page": 100],
                           encoding: URLEncoding.queryString)
    return try await performRequest(urlRequestConvertible: request)
  }

  func searchPhotos(with query: String) async throws -> [Photo] {
    let request = GetBooks(path: "/search/photos",
                           method: .get,
                           parameters: ["page": 1, "per_page": 100, "query": query],
                           encoding: URLEncoding.queryString)
    return try await performRequest(urlRequestConvertible: request)
  }
}
