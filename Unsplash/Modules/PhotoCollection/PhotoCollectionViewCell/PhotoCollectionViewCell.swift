import UIKit
import Kingfisher

final class PhotoCollectionViewCell: UICollectionViewCell {
  static let identifier = "PhotoCollectionViewCell"

  private let imageView = UIImageView()

  override init(frame: CGRect) {
    super.init(frame: frame)
    setup()
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  private func setup() {
    setupImageView()
  }

  private func setupImageView() {
    contentView.addSubview(imageView)
    imageView.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
      imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
      imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
      imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
    ])

    imageView.contentMode = .center
    imageView.layer.cornerRadius = 10
    imageView.layer.masksToBounds = true
    imageView.contentMode = .scaleAspectFill
  }

  public func configure(with viewModel: PhotoCollectionCellViewModel) {
    let url = URL(string: viewModel.imageURL)
    imageView.kf.setImage(with: url)
  }
}
