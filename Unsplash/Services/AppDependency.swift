import Foundation

protocol HasNetworkService {
  var networkService: NetworkServiceProtocol { get }
}

final class AppDependency: HasNetworkService {
  var networkService: NetworkServiceProtocol = NetworkService()
}
