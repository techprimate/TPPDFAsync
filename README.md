# TPPDFAsync

TPPDFAsync is an extension to the TPPDF framework that adds asynchronous capabilities using Combine. It allows you to generate PDF documents asynchronously by leveraging the power of Combine framework in iOS applications.

## Features

- Asynchronous PDF generation: Generate PDF documents without blocking the main thread by using Combine publishers and subscribers.
- Seamless integration: TPPDFAsync extends the existing TPPDF framework, allowing you to leverage all the features and customization options provided by TPPDF.
- Combine-powered: Utilizes the Combine framework, enabling you to handle PDF generation tasks in a reactive and declarative manner.
- Flexible and customizable: TPPDFAsync works with the existing TPPDF API, providing you with a familiar and intuitive way to generate PDFs with custom styling, layout, and content.

## Requirements

- iOS 13.0+
- Swift 5.0+

## Installation

TPPDFAsync can be easily integrated into your iOS project using Swift Package Manager. Simply add TPPDFAsync as a dependency in your Package.swift file:

```swift
dependencies: [
    .package(url: "https://github.com/techprimat/TPPDFAsync", from: "0.0.1")
]
```

Alternatively, you can also use CocoaPods by adding the following line to your `Podfile`:

```ruby
pod 'TPPDFAsync', '~> 0.0.1'
```

## Usage

Using TPPDFAsync is straightforward. Follow these steps to generate a PDF asynchronously:

1. Import the TPPDF and TPPDFAsync modules in your Swift file:

```swift
import TPPDF
import TPPDFAsync
```

2. Create an instance of `PDFDocument` as you would with TPPDF:

```swift
let document = PDFDocument(format: .a4)
```

3. Configure the document and add content using the TPPDF API:

```swift
document.add(text: "Hello, TPPDFAsync!")
document.add(image: UIImage(named: "exampleImage"))
// Customize layout, styling, headers, footers, etc.
```

4. Create a `PDFAsyncGenerator` and use the `generateAsyncTask()` method to generate the PDF asynchronously:

```swift
let generator = PDFAsyncGenerator(document: document)
generator.generateURLAsyncTask(filename: "document.pdf")
    .sink(receiveCompletion: { completion in
        switch completion {
        case .finished:
            // PDF generation completed successfully
            break
        case .failure(let error):
            // Handle any errors that occurred during PDF generation
            print("PDF generation failed: \(error)")
        }
    }, receiveValue: { url in
        // Handle the generated PDF file URL
        print("PDF generated successfully: \(url)")
    })
    .store(in: &cancellables)
```

For more detailed usage instructions, refer to the [TPPDF documentation](https://github.com/techprimate/TPPDF).

## License

TPPDFAsync is released under the MIT License. See the [LICENSE](https://github.com/techprimate/TPPDFAsync/blob/main/LICENSE) file for more information.

## Contributing

Contributions are welcome! If you find any issues or have suggestions for improvements, please open an issue or submit a pull request.

## Acknowledgements

TPPDFAsync is built upon the foundation of the TPPDF framework. Many thanks to the TPPDF contributors for their efforts in creating and maintaining the core library.
