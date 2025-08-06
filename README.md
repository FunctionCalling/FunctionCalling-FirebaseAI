# FunctionCalling-FirebaseAI

This library simplifies the integration of the [FunctionCalling](https://github.com/fumito-ito/FunctionCalling) macro into [FirebaseAI](https://github.com/firebase/firebase-ios-sdk/tree/main/FirebaseAI). By using this library, you can directly generate `Tool` objects from Swift native functions, which can then be specified as FunctionCalling when invoking FirebaseAI.

## Usage

```swift

import FunctionCalling
import FunctionCalling_FirebaseAI
import FirebaseAI

// MARK: Declare the container and functions for the tools to be called from FunctionCalling.

@FunctionCalling(service: .llamaOrGemini)
struct MyFunctionTools {
    @CallableFunction
    /// Get the current stock price for a given ticker symbol
    ///
    /// - Parameter: The stock ticker symbol, e.g. GOOG for Google Inc.
    func getStockPrice(ticker: String) async throws -> String {
        // code to return stock price of passed ticker
    }
}

// MARK: You can directly pass the tools generated from objects to the model in FirebaseAI.

let model = FirebaseAI.firebaseAI().generativeModel(
    modelName: "gemini-1.5-flash",
    tools: MyFunctionTools().firebaseVertexAITools
)
```

## Installation

### Swift Package Manager

```
let package = Package(
    name: "MyPackage",
    products: [...],
    targets: [
        .target(
            "YouAppModule",
            dependencies: [
                .product(name: "FunctionCalling-FirebaseAI", package: "FunctionCalling-FirebaseAI")
            ]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/FunctionCalling/FunctionCalling-FirebaseAI", from: "0.1.0")
    ]
)
```

## Contributing

Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

Please make sure to update tests as appropriate.

## License

The MIT License
