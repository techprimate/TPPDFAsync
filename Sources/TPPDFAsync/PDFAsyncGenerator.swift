import Foundation
import TPPDF
import Combine

public class PDFAsyncGenerator {

    internal let generator: PDFGenerator

    public init(document: PDFDocument) {
        self.generator = PDFGenerator(document: document)
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
