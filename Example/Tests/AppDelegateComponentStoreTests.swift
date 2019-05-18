import XCTest
import AppDelegateComponent
import UIKit

class AppDelegateComponentStoreTests: XCTestCase {
    // MARK: - performFetchWithCompletionHandler

    func test_performFetchWithCompletionHandler_returnsNewDataIfAvailable() {
        let component1 = FetchComponent(delay: 1, result: .failed)
        let component2 = FetchComponent(delay: 1.9, result: .noData)
        let component3 = FetchComponent(delay: 1.5, result: .newData)

        let store = Store(storedComponents: [component1, component2, component3])

        let newDataExpectation = expectation(description: "Completion with new data")
        var receivedResult: UIBackgroundFetchResult?

        AppDelegateComponentRunner().componentStore(store, app: UIApplication.shared) { result in
            receivedResult = result
            newDataExpectation.fulfill()
        }

        waitForExpectations(timeout: 10) { error in
            XCTAssert(receivedResult == .some(.newData), "Not new data")
        }
    }

    func test_performFetchWithCompletionHandler_returnsFailedIfNoNewDataAndFailed() {
        let component1 = FetchComponent(delay: 1, result: .failed)
        let component2 = FetchComponent(delay: 1.9, result: .noData)
        let component3 = FetchComponent(delay: 1.5, result: .noData)

        let store = Store(storedComponents: [component1, component2, component3])

        let newDataExpectation = expectation(description: "Completion with new data")
        var receivedResult: UIBackgroundFetchResult?

        AppDelegateComponentRunner().componentStore(store, app: UIApplication.shared) { result in
            receivedResult = result
            newDataExpectation.fulfill()
        }

        waitForExpectations(timeout: 10) { error in
            XCTAssert(receivedResult == .some(.failed), "Not new data")
        }
    }

    func test_performFetchWithCompletionHandler_returnsNoDataIfNoNewDataAndNotFailed() {
        let component1 = FetchComponent(delay: 1, result: .noData)
        let component2 = FetchComponent(delay: 1.9, result: .noData)
        let component3 = FetchComponent(delay: 1.5, result: .noData)

        let store = Store(storedComponents: [component1, component2, component3])

        let newDataExpectation = expectation(description: "Completion with new data")
        var receivedResult: UIBackgroundFetchResult?

        AppDelegateComponentRunner().componentStore(store, app: UIApplication.shared) { result in
            receivedResult = result
            newDataExpectation.fulfill()
        }

        waitForExpectations(timeout: 10) { error in
            XCTAssert(receivedResult == .some(.noData), "Not new data")
        }
    }
}

final class FetchComponent: AppDelegateComponent {
    private let delay: Double
    private let result: UIBackgroundFetchResult

    init(delay: Double, result: UIBackgroundFetchResult) {
        self.delay = delay
        self.result = result
    }

    func application(_ app: UIApplication, performFetchWithCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
        DispatchQueue.global(qos: .background).asyncAfter(deadline: .now() + delay) {
            completionHandler(self.result)
        }
    }
}

final class Store: AppDelegateComponentStore {
    let storedComponents: [AppDelegateComponent]

    init(storedComponents: [AppDelegateComponent]) {
        self.storedComponents = storedComponents
    }
}
