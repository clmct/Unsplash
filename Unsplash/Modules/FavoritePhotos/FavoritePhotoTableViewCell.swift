import UIKit

final class FavoritePhotoTableViewCell: UITableViewCell {
  static let identifier = "PhotoTableViewCell"
  private let imgView = UIImageView()
  private let nameLabel = UILabel()

  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    setup()
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  public func configure(image: UIImage) {
    imgView.image = image
  }

  private func setup() {
    setupImageView()
    setupNameLabel()
  }

  private func setupImageView() {
    contentView.addSubview(imgView)
    imgView.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      imgView.leadingAnchor.constraint(equalTo: leadingAnchor),
      imgView.trailingAnchor.constraint(equalTo: trailingAnchor),
      imgView.topAnchor.constraint(equalTo: topAnchor),
      imgView.bottomAnchor.constraint(equalTo: bottomAnchor)
    ])

    imgView.contentMode = .center
    imgView.layer.cornerRadius = 10
    imgView.layer.masksToBounds = true
    imgView.contentMode = .scaleAspectFill
  }

  private func setupNameLabel() {
  }
}
