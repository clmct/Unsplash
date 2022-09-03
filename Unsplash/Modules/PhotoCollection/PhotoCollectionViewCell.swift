import UIKit

class PhotoCollectionViewCell: UICollectionViewCell {
  static let identifier = "PhotoCollectionViewCell"

  private let imageView = UIImageView()

  override init(frame: CGRect) {
    super.init(frame: frame)
    setupLayout()
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  private func setupLayout() {
    contentView.addSubview(imageView)
    imageView.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
      imageView.trailingAnchor.constraint(equalTo: trailingAnchor),
      imageView.topAnchor.constraint(equalTo: topAnchor),
      imageView.bottomAnchor.constraint(equalTo: bottomAnchor)
    ])
    setupImageView()
  }

  private func setupImageView() {
    imageView.contentMode = .center
    imageView.layer.cornerRadius = 10
    imageView.layer.masksToBounds = true
    imageView.contentMode = .scaleAspectFill
  }

  public func configure(image: UIImage) {
    imageView.image = image
  }
}
