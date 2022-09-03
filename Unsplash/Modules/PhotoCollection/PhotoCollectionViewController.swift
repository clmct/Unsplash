import UIKit

final class PhotoCollectionViewController: UIViewController {
  // MARK: - Properties
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
    view.backgroundColor = .red
    setup()
  }
  
  // MARK: - Public Methods
  
  // MARK: - Actions
  
  // MARK: - Private Methods
  private func bindToViewModel() {
  }

  private func setup() {
    setupNavigationItem()
    setupCollectionView()
  }

  private func setupCollectionView() {
    collectionView.delegate = self
    collectionView.dataSource = self
//    collectionViewLayout.delegate = self
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
    100
  }

  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotoCollectionViewCell.identifier,
                                                        for: indexPath) as? PhotoCollectionViewCell else {
      return UICollectionViewCell()
    }
    cell.backgroundColor = .gray
//    cell.configure(image: images[indexPath.row] ?? UIImage())
    return cell
  }

}

extension PhotoCollectionViewController: UICollectionViewDelegate {
}

extension PhotoCollectionViewController: PinterestLayoutDelegate {
  func collectionView( _ collectionView: UICollectionView,
                       heightForCellAtIndexPath indexPath: IndexPath) -> CGFloat {
    let height: CGFloat
    switch indexPath.item {
    case 0, 4, 8:
      height = 210
    case 1, 5, 9:
      height = 170
    case 2, 6, 10:
      height = 170
    case 3, 7, 11:
      height = 210
    default:
      height = 170
    }
    return height
  }
}

// MARK: UISearchResultsUpdating
extension PhotoCollectionViewController: UISearchResultsUpdating {
  func updateSearchResults(for searchController: UISearchController) {
    guard let text = searchController.searchBar.text else { return }
    let index = searchController.searchBar.selectedScopeButtonIndex
//    viewModel?.updateSearchResults(text: text, index: index)
  }
}
