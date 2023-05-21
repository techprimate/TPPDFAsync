import Foundation
import TPPDF

public extension PDFAsyncGenerator {

    // MARK: - Closure Completion Handlers

    func generateAsync(to url: URL,
                       info: PDFInfo? = nil,
                       workQueue: DispatchQueue = .global(qos: .background),
                       notifyQueue: DispatchQueue = .main,
                       completion: @escaping (Error?) -> Void) {
        let dispatchGroup = DispatchGroup()
        var failureError: Error?
        workQueue.async { [ weak self ] in
            guard let strongSelf = self else {
                return
            }
            dispatchGroup.enter()
            do {
                try strongSelf.generator.generate(to: url, info: info)
            } catch {
                failureError = error
            }
            dispatchGroup.leave()
        }
        dispatchGroup.notify(queue: notifyQueue) {
            completion(failureError)
        }
    }

    func generateDataAsync(info: PDFInfo? = nil,
                           workQueue: DispatchQueue = .global(qos: .background),
                           notifyQueue: DispatchQueue = .main,
                           completion: @escaping (Data?, Error?) -> Void) {
        let dispatchGroup = DispatchGroup()
        var resultData: Data?
        var failureError: Error?
        workQueue.async { [ weak self ] in
            guard let strongSelf = self else {
                return
            }
            dispatchGroup.enter()
            do {
                resultData = try strongSelf.generator.generateData(info: info)
            } catch {
                failureError = error
            }
            dispatchGroup.leave()
        }
        dispatchGroup.notify(queue: notifyQueue) {
            completion(resultData, failureError)
        }
    }

    func generateURLAsync(filename: String,
                          info: PDFInfo? = nil,
                          workQueue: DispatchQueue = .global(qos: .background),
                          notifyQueue: DispatchQueue = .main,
                          completion: @escaping (URL?, Error?) -> Void) {
        let dispatchGroup = DispatchGroup()
        var resultURL: URL?
        var failureError: Error?
        workQueue.async { [ weak self ] in
            guard let strongSelf = self else {
                return
            }
            dispatchGroup.enter()
            do {
                resultURL = try strongSelf.generator.generateURL(filename: filename, info: info)
            } catch {
                failureError = error
            }
            dispatchGroup.leave()
        }
        dispatchGroup.notify(queue: notifyQueue) {
            completion(resultURL, failureError)
        }
    }
}
