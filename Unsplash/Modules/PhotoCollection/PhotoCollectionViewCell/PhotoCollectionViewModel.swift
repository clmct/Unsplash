import UIKit
import Combine

protocol PhotoCollectionViewModelProtocol {
  var numberOfItemsInSection: Int { get }
  var tableViewPublisher: AnyPublisher<Void, Never> { get }
  func loadPhotos()
  func cellViewModel(at indexPath: IndexPath) -> PhotoCollectionCellViewModel?
  func updateSearchResults(with text: String)
}

protocol PhotoCollectionViewModelDelegate: AnyObject {
}

final class PhotoCollectionViewModel: PhotoCollectionViewModelProtocol {
  // MARK: - Types
  typealias Dependencies = HasNetworkService
  
  // MARK: - Properties

  var tableViewPublisher: AnyPublisher<Void, Never> {
    updateTableViewEvent.eraseToAnyPublisher()
  }

  var numberOfItemsInSection: Int {
    return photos.count
  }

  var photos: [Photo] = []

  weak var delegate: PhotoCollectionViewModelDelegate?
  private let networkService: NetworkServiceProtocol
  private let updateTableViewEvent = PassthroughSubject<Void, Never>()
  
  // MARK: - Init
  init(dependencies: Dependencies) {
    networkService = dependencies.networkService
  }
  
  // MARK: - Public Methods
  func loadPhotos() {
    Task {
      do {
        photos = try await networkService.getPhotos()
        updateTableViewEvent.send()
        print(photos)
      } catch {
        print(error)
      }
    }
  }

  func cellViewModel(at indexPath: IndexPath) -> PhotoCollectionCellViewModel? {
    guard let photo = photos[safe: indexPath.row] else { return nil }
    let url = photo.urls[URLKing.regular.rawValue] ?? ""
    let viewModel = PhotoCollectionCellViewModel(imageURL: url)
    return viewModel
  }

  func updateSearchResults(with text: String) {
    guard !text.isEmpty else {
      loadPhotos()
      return
    }
    Task {
      do {
        photos = try await networkService.searchPhotos(with: text)
        updateTableViewEvent.send()
        print(photos)
      } catch {
        print(error)
      }
    }
  }
  
  // MARK: - Actions
  
  // MARK: - Private Methods

    }
