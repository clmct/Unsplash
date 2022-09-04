import UIKit

protocol PhotoDetailCoordinatorDelegate: AnyObject {
}

final class PhotoDetailCoordinator: CoordinatorProtocol {
  // MARK: - Properties
  weak var delegate: PhotoDetailCoordinatorDelegate?
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
  }
  
  // MARK: - Private Methods
}
