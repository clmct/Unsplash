import UIKit
import Combine

protocol FavoritePhotosViewModelProtocol {
}

protocol FavoritePhotosViewModelDelegate: AnyObject {
}

final class FavoritePhotosViewModel: FavoritePhotosViewModelProtocol {
  // MARK: - Types
  typealias Dependencies = HasNetworkService
  
  // MARK: - Properties
  weak var delegate: FavoritePhotosViewModelDelegate?

  var tableViewPublisher: AnyPublisher<Void, Never> {
    updateTableViewEvent.eraseToAnyPublisher()
  }

  var numberOfItemsInSection: Int {
    return photos.count
  }

  var photos: [Photo] = []

  private let updateTableViewEvent = PassthroughSubject<Void, Never>()
  
  // MARK: - Init
  init(dependencies: Dependencies) {
  }
  
  // MARK: - Public Methods
  
  // MARK: - Actions
  
  // MARK: - Private Methods
}
