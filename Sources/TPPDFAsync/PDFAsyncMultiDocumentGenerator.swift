import Foundation
import TPPDF
import Combine

public class PDFAsyncMultiDocumentGenerator {

    internal let generator: PDFMultiDocumentGenerator

    public init(documents: [PDFDocument]) {
        self.generator = PDFMultiDocumentGenerator(documents: documents)
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

    public var progresses: [Progress] {
        generator.progresses
    }
}
