import XCTest
@testable import FunctionCalling_FirebaseVertexAI
import FunctionCalling

// swiftlint:disable:next type_name
final class FunctionCalling_FirebaseVertexAITests: XCTestCase {
    @FunctionCalling(service: .claude)
        struct FunctionContainer {
            /// Return current weather of location that passed by the argument
            /// - Parameter location: location that I want to know how the weather
            /// - Returns: string of weather
            @CallableFunction
            func getWeather(location: String) -> String {
                return "Sunny"
            }

            @CallableFunction
            func getStock(args: String) -> Int {
                return 0
            }
        }

        func testConvertedResults() throws {
            guard let tool = FunctionContainer().firebaseVertexAITools.first else {
                XCTFail("Conainer should contain some functions")
                return
            }

            let encodedToolData = try JSONEncoder().encode(tool)
            let jsonObject = try JSONSerialization.jsonObject(with: encodedToolData)

            guard let toolDictionary = jsonObject as? [String: Any] else {
                XCTFail("Failed to convert to JSON object")
                return
            }

            guard let functions = toolDictionary["functionDeclarations"] as? [[String: Any]] else {
                XCTFail("Failed to convert to JSON object")
                return
            }

            XCTAssertEqual(functions.count, 2)

            let getWeather = try XCTUnwrap(functions.first(where: { $0["name"] as? String == "getWeather" }))
            // swiftlint:disable:next line_length
            XCTAssertEqual(getWeather["description"] as? String, "Return current weather of location that passed by the argument- Parameter location: location that I want to know how the weather- Returns: string of weather")

            let getStock = try XCTUnwrap(functions.first(where: { $0["name"] as? String == "getStock" }))
            XCTAssertEqual(getStock["description"] as? String, "")
        }
}
