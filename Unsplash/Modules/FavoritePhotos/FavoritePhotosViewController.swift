import UIKit

final class FavoritePhotosViewController: UIViewController {
  // MARK: - Properties
  private let viewModel: FavoritePhotosViewModelProtocol
  private let tableView = UITableView()
  
  // MARK: - Init
  init(viewModel: FavoritePhotosViewModelProtocol) {
    self.viewModel = viewModel
    super.init(nibName: nil, bundle: nil)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  // MARK: - Lifecycle
  override func viewDidLoad() {
    super.viewDidLoad()
    setup()
  }
  
  // MARK: - Public Methods
  
  // MARK: - Actions
  
  // MARK: - Private Methods
  private func setup() {
    bindToViewModel()
    setupTableView()
    view.backgroundColor = .green
  }

  private func bindToViewModel() {
  }

  private func setupTableView() {
    tableView.delegate = self
    tableView.dataSource = self
    tableView.register(FavoritePhotoTableViewCell.self, forCellReuseIdentifier: FavoritePhotoTableViewCell.identifier)
  }
}

extension FavoritePhotosViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 10
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: FavoritePhotoTableViewCell.identifier,
                                                   for: indexPath) as? FavoritePhotoTableViewCell else {
      return UITableViewCell()
    }
    return cell
  }
}

extension FavoritePhotosViewController: UITableViewDelegate {
}
