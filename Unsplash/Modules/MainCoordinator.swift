import UIKit

final class MainCoordinator: CoordinatorProtocol {
  // MARK: - Properties
  var navigationController = UINavigationController()
  private var childCoordinators: [CoordinatorProtocol] = []
  private let appDependency = AppDependency()
  
  // MARK: - Public Methods
  func start() {
    let tabBarController = UITabBarController()

    let photoCollectionNC = UINavigationController()
    photoCollectionNC.tabBarItem.title = "Photos"
    photoCollectionNC.tabBarItem.image = UIImage(systemName: "photo")
    let photoCollectionCoordinator = PhotoCollectionCoordinator(appDependency: appDependency,
                                                                navigationController: photoCollectionNC)

    let favoritePhotosNC = UINavigationController()
    favoritePhotosNC.tabBarItem.title = "Favorite photos"
    favoritePhotosNC.tabBarItem.image = UIImage(systemName: "star")
    let favoritePhotosCoordinator = FavoritePhotosCoordinator(appDependency: appDependency,
                                                              navigationController: favoritePhotosNC)

    tabBarController.viewControllers = [photoCollectionNC, favoritePhotosNC]
    childCoordinators.append(photoCollectionCoordinator)
    childCoordinators.append(favoritePhotosCoordinator)
    photoCollectionCoordinator.start()
    favoritePhotosCoordinator.start()
    tabBarController.modalPresentationStyle = .fullScreen
    navigationController.present(tabBarController, animated: false, completion: nil)
  }
}
