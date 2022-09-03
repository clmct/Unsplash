import UIKit

final class AppCoordinator: CoordinatorProtocol {
  var navigationController: UINavigationController
  private var childCoordinators: [CoordinatorProtocol] = []
  private let appDependency: AppDependency

  init() {
    navigationController = UINavigationController()
    appDependency = AppDependency()
  }

  func start() {
    let coordinator = MainCoordinator(appDependency: appDependency,
                                      navigationController: navigationController)
    childCoordinators.append(coordinator)
    coordinator.start()
  }
}
