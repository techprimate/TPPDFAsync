import Combine
import Foundation
import TPPDF

public extension PDFAsyncMultiDocumentGenerator {
    // MARK: - Combine Tasks

    func generateAsyncTask(to url: URL, info: PDFInfo? = nil) -> Future<Void, Error> {
        Future<Void, Error> { [weak self] promise in
            assert(!Thread.isMainThread, "Are you sure you want to run the asynchronous task on the main thread?")
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

    func generateDataAsyncTask(info: PDFInfo? = nil) -> Future<Data, Error> {
        Future<Data, Error> { [weak self] promise in
            assert(!Thread.isMainThread, "Are you sure you want to run the asynchronous task on the main thread?")
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

    func generateURLAsyncTask(filename: String, info: PDFInfo? = nil) -> Future<URL, Error> {
        Future<URL, Error> { [weak self] promise in
            assert(!Thread.isMainThread, "Are you sure you want to run the asynchronous task on the main thread?")
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
