import UIKit

protocol PhotoDetailViewModelProtocol {
}

protocol PhotoDetailViewModelDelegate: AnyObject {
}

final class PhotoDetailViewModel: PhotoDetailViewModelProtocol {
  // MARK: - Types
  typealias Dependencies = HasNetworkService
  
  // MARK: - Properties
  weak var delegate: PhotoDetailViewModelDelegate?
  
  // MARK: - Init
  init(dependencies: Dependencies) {
  }
  
  // MARK: - Public Methods
  
  // MARK: - Actions
  
  // MARK: - Private Methods
}
