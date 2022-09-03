import UIKit

protocol FavoritePhotosCoordinatorDelegate: AnyObject {
}

final class FavoritePhotosCoordinator: CoordinatorProtocol {
  // MARK: - Properties
  weak var delegate: FavoritePhotosCoordinatorDelegate?
  var navigationController: UINavigationController
  private var childCoordinators: [CoordinatorProtocol] = []
  private let appDependency: AppDependency
  
  // MARK: - Init
  init(appDependency: AppDependency,
       navigationController: UINavigationController) {
    self.appDependency = appDependency
    self.navigationController = navigationController
  }
  
  // MARK: - Public Methods
  func start() {
    let viewModel = FavoritePhotosViewModel(dependencies: appDependency)
    let viewController = FavoritePhotosViewController(viewModel: viewModel)
    navigationController.pushViewController(viewController, animated: true)
  }
  
  // MARK: - Private Methods
}
