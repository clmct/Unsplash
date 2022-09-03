import UIKit

final class FavoritePhotosViewController: UIViewController {
  // MARK: - Properties
  private let viewModel: FavoritePhotosViewModelProtocol
  
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
    bindToViewModel()
    view.backgroundColor = .green
  }
  
  // MARK: - Public Methods
  
  // MARK: - Actions
  
  // MARK: - Private Methods
  private func bindToViewModel() {
  }
}
