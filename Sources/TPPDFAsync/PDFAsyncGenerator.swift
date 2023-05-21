import Combine
import Foundation
import TPPDF

public class PDFAsyncGenerator {
    internal let generator: PDFGenerator

    public init(document: PDFDocument) {
        generator = PDFGenerator(document: document)
    }

    public var debug: Bool {
        get {
            generator.debug
        }
        set {
            generator.debug = newValue
        }
    }

    public var progress: Progress {
        generator.progress
    }
}
