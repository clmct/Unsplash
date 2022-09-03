import UIKit

protocol FavoritePhotosViewModelProtocol {
}

protocol FavoritePhotosViewModelDelegate: AnyObject {
}

final class FavoritePhotosViewModel: FavoritePhotosViewModelProtocol {
  // MARK: - Types
  typealias Dependencies = HasNetworkService
  
  // MARK: - Properties
  weak var delegate: FavoritePhotosViewModelDelegate?
  
  // MARK: - Init
  init(dependencies: Dependencies) {
  }
  
  // MARK: - Public Methods
  
  // MARK: - Actions
  
  // MARK: - Private Methods
}
