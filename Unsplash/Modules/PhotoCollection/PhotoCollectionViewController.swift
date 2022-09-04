import UIKit
import Combine

final class PhotoCollectionViewController: UIViewController {
  // MARK: - Properties
  private var subscriptions = Set<AnyCancellable>()
  private let viewModel: PhotoCollectionViewModelProtocol
  private let collectionViewLayout = CustomCollectionViewLayout()
  private lazy var collectionView = UICollectionView(frame: .zero,
                                                     collectionViewLayout: collectionViewLayout)
  private let searchController = UISearchController()

  // MARK: - Init
  init(viewModel: PhotoCollectionViewModelProtocol) {
    self.viewModel = viewModel
    super.init(nibName: nil, bundle: nil)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  // MARK: - Lifecycle
  override func viewDidLoad() {
    super.viewDidLoad()
    bindToViewModel()
    setup()
    viewModel.loadPhotos()
  }
  
  // MARK: - Public Methods
  
  // MARK: - Actions
  
  // MARK: - Private Methods
  private func bindToViewModel() {
    viewModel.tableViewPublisher
      .receive(on: DispatchQueue.main)
      .sink { [weak self] _ in
        self?.collectionView.reloadData()
      }
      .store(in: &subscriptions)
  }

  private func setup() {
    setupNavigationItem()
    setupCollectionView()
  }

  private func setupCollectionView() {
    collectionView.delegate = self
    collectionView.dataSource = self
    collectionView.register(PhotoCollectionViewCell.self,
                            forCellWithReuseIdentifier: PhotoCollectionViewCell.identifier)
    view.addSubview(collectionView)
    collectionView.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
      collectionView.topAnchor.constraint(equalTo: view.topAnchor),
      collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
    ])
  }

  private func setupNavigationItem() {
    navigationItem.searchController = searchController
    navigationItem.hidesSearchBarWhenScrolling = false
    searchController.searchResultsUpdater = self
    searchController.obscuresBackgroundDuringPresentation = false
  }
}

extension PhotoCollectionViewController: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return viewModel.numberOfItemsInSection
  }

  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let viewModel = viewModel.cellViewModel(at: indexPath),
          let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotoCollectionViewCell.identifier,
                                                        for: indexPath) as? PhotoCollectionViewCell else {
      return UICollectionViewCell()
    }
    cell.configure(with: viewModel)
    return cell
  }
}

extension PhotoCollectionViewController: UICollectionViewDelegate {
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
  }
}

// MARK: UISearchResultsUpdating
extension PhotoCollectionViewController: UISearchResultsUpdating {
  func updateSearchResults(for searchController: UISearchController) {
    guard let text = searchController.searchBar.text else { return }
    viewModel.updateSearchResults(with: text)
  }
}
