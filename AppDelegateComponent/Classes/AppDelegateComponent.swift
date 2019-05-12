//
//  Created by Martin Hartl on 12.05.19.
//

import UIKit

public protocol AppDelegateComponent {
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?)
}

extension AppDelegateComponent {
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) {
        // Empty default implementation
    }
}

public protocol AppDelegateComponentStore {
    var storedComponents: [AppDelegateComponent] { get }
}

final public class AppDelegateComponentRunner {
    public init() { }

    public func componentStore(_ componentStore: AppDelegateComponentStore,
                        application: UIApplication,
                        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) {
        componentStore.storedComponents.forEach {
            $0.application(application,
                           didFinishLaunchingWithOptions: launchOptions)
        }
    }
}
