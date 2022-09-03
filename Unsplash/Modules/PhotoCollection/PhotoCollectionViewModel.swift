import UIKit

protocol PhotoCollectionViewModelProtocol {
}

protocol PhotoCollectionViewModelDelegate: AnyObject {
}

final class PhotoCollectionViewModel: PhotoCollectionViewModelProtocol {
  // MARK: - Types
  typealias Dependencies = HasNetworkService
  
  // MARK: - Properties
  weak var delegate: PhotoCollectionViewModelDelegate?
  var photos: [Photo] = []
  private let networkService: NetworkServiceProtocol
  
  // MARK: - Init
  init(dependencies: Dependencies) {
    networkService = dependencies.networkService
    getPhotos()
  }
  
  // MARK: - Public Methods
  
  // MARK: - Actions
  
  // MARK: - Private Methods
  private func getPhotos() {
    Task {
      do {
        photos = try await networkService.getPhotos()
        print(photos)
      } catch {
        print(error)
      }
    }
  }
}
