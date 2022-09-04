import UIKit

protocol PhotoCollectionCoordinatorDelegate: AnyObject {
}

final class PhotoCollectionCoordinator: CoordinatorProtocol {
  // MARK: - Properties
  weak var delegate: PhotoCollectionCoordinatorDelegate?
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
    let viewModel = PhotoCollectionViewModel(dependencies: appDependency)
    let viewController = PhotoCollectionViewController(viewModel: viewModel)
    viewController.navigationItem.title = "Photos"
    navigationController.pushViewController(viewController, animated: true)
  }
  
  // MARK: - Private Methods
}
