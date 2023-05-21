import Foundation
import TPPDF
import Combine

public extension PDFAsyncGenerator {

    // MARK: - Combine Tasks

    func generateAsyncTask(
        to url: URL,
        info: PDFInfo? = nil,
        workQueue: DispatchQueue = .global(qos: .background)
    ) -> Future<Void, Error> {
        Future<Void, Error> { [weak self] promise in
            workQueue.async {
                guard let strongSelf = self else {
                    return
                }
                do {
                    try strongSelf.generator.generate(to: url, info: info)
                    promise(.success(()))
                } catch {
                    promise(.failure(error))
                }
            }
        }
    }

    func generateDataAsyncTask(
        info: PDFInfo? = nil,
        workQueue: DispatchQueue = .global(qos: .background)
    ) -> Future<Data, Error> {
        Future<Data, Error> { [weak self] promise in
            workQueue.async {
                guard let strongSelf = self else {
                    return
                }
                do {
                    let data = try strongSelf.generator.generateData(info: info)
                    promise(.success(data))
                } catch {
                    promise(.failure(error))
                }
            }
        }
    }

    func generateURLAsyncTask(
        filename: String,
        info: PDFInfo? = nil,
        workQueue: DispatchQueue = .global(qos: .background)
    ) -> Future<URL, Error> {
        Future<URL, Error> { [weak self] promise in
            workQueue.async {
                guard let strongSelf = self else {
                    return
                }
                do {
                    let url = try strongSelf.generator.generateURL(filename: filename, info: info)
                    promise(.success(url))
                } catch {
                    promise(.failure(error))
                }
            }
        }
    }
}
