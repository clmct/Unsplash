import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
  var window: UIWindow?
  let appCoordinator = MainCoordinator()

  func scene(_ scene: UIScene,
             willConnectTo session: UISceneSession,
             options connectionOptions: UIScene.ConnectionOptions) {
    guard let windowScene = (scene as? UIWindowScene) else { return }
    let window = UIWindow(windowScene: windowScene)
    window.rootViewController = appCoordinator.navigationController
    window.makeKeyAndVisible()
    self.window = window
    appCoordinator.start()
  }
}
