//
//  ExampleDocument.swift
//  TPPDFAsync
//
//  Created by Philip Niedertscheider on 02.07.20.
//  Copyright © 2023 techprimate GmbH. All rights reserved.
//

import TPPDF

class ExampleDocument {
    static func create() -> PDFDocument {
        let document = PDFDocument(format: .a4)
        for _ in 0 ... 1_000 {
            document.add(.contentCenter, text: "Hello Async World!")
        }
        return document
    }
}
