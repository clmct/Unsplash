import UIKit

final class PhotoDetailViewController: UIViewController {
  // MARK: - Properties
  private let viewModel: PhotoDetailViewModelProtocol
  private let imageView = UIImageView()
  private let authorLabel = UILabel()
  private let locationLabel = UILabel()
  private let dateLabel = UILabel()
  private let downloadCountLabel = UILabel()

  // MARK: - Init
  init(viewModel: PhotoDetailViewModelProtocol) {
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
  }
  
  // MARK: - Public Methods
  
  // MARK: - Actions
  
  // MARK: - Private Methods
  private func bindToViewModel() {
  }

  private func setupAuthorLabel() {
  }

  private func setupLocationLabel() {
  }

  private func setupDateLabel() {
  }

  private func setupDownloadCountLabel() {
  }

  private func setupImageView() {
  }
}
