import Foundation
import Alamofire

public enum HTTPError: Equatable {
    case statusCode(Int)
    case invalidResponse
}

protocol NetworkServiceProtocol {
  func getPhotos() async throws -> [Photo]
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
  // MARK: - URLRequestConvertible
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

class NetworkService: NetworkServiceProtocol {
  func performRequest<T: Codable>(urlRequestConvertible: URLRequestConvertible) async throws -> T {
    let dataTask = AF.request(urlRequestConvertible).serializingDecodable(T.self)
    await print(dump(dataTask.response))
    let value = try await dataTask.value // Returns the TestResponse or throws the AFError as an Error

    return value
  }

  func getPhotos() async throws -> [Photo] {
    let request = GetBooks(path: "photos", method: .get, parameters: ["page": 1], encoding: URLEncoding.queryString)
    return try await AF.request(request).serializingDecodable([Photo].self).value
//    return try await performRequest(urlRequestConvertible: request)
  }
}
