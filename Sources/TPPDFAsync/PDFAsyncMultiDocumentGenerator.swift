import Foundation
import TPPDF
import Combine

public class PDFAsyncMultiDocumentGenerator {

    internal let generator: PDFMultiDocumentGenerator

    public init(documents: [PDFDocument]) {
        self.generator = PDFMultiDocumentGenerator(documents: documents)
    }

    public var debug: Bool {
        set {
            generator.debug = newValue
        }
        get {
            generator.debug
        }
    }

    public var progress: Progress {
        generator.progress
    }

    public var progresses: [Progress] {
        generator.progresses
    }
}
