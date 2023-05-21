//
//  ViewController.swift
//  TPPDFAsync
//
//  Created by Philip Niedertscheider on 02.07.20.
//  Copyright © 2023 techprimate GmbH. All rights reserved.
//

import UIKit
import PDFKit
import TPPDF
import TPPDFAsync
import Combine

class ViewController: UIViewController {

    static let progressFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .percent
        return formatter
    }()

    @IBOutlet weak var progressContainer: UIStackView!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var progressLabel: UILabel!

    var progressObserver: NSObjectProtocol!

    var pdfView: PDFView {
        // swiftlint:disable:next force_cast
        self.view as! PDFView
    }
    var workCancellable: AnyCancellable?

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        // Generate PDF
        print("Starting to generate...")
        self.progressLabel.text = ViewController.progressFormatter.string(from: 0)
        self.progressBar.progress = 0

        let document = ExampleDocument.create()
        let generator = PDFAsyncGenerator(document: document)

        // Observing progress
        progressBar.observedProgress = generator.progress
        progressObserver = generator.progress.observe(\.fractionCompleted) { (progress, _) in
            let percentage = ViewController.progressFormatter.string(from: NSNumber(value: progress.fractionCompleted))!
            DispatchQueue.main.async {
                guard self.progressLabel.text != percentage else {
                    return
                }
                self.progressLabel.text = percentage
            }
        }

        // Running task asynchronously
        self.workCancellable = generator.generateDataAsyncTask()
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { result in
                switch result {
                case .finished:
                    print("Finished creating PDF")
                case .failure(let error):
                    print("Failed to create PDF", error.localizedDescription)
                }
            }, receiveValue: { [weak self] data in
                guard let doc = PDFKit.PDFDocument(data: data) else {
                    fatalError()
                }
                self?.pdfView.document = doc
                self?.pdfView.autoScales = true
                self?.pdfView.goToFirstPage(nil)

                self?.progressContainer.isHidden = true
            })
    }
}
