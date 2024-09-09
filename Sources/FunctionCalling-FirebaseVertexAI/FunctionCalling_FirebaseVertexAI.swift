//
//  FunctionCalling_FirebaseVertexAI.swift
//
//
//  Created by Fumito Ito on 2024/09/07.
//

import FunctionCalling
import FirebaseVertexAI
import Foundation

typealias FunctionCallingTool = FunctionCalling.Tool

extension ToolContainer {
    public var firebaseVertexAITools: [FirebaseVertexAI.Tool] {
        get throws {
            let data = allTools.data(using: .utf8)!
            let functionCallingTools = try JSONDecoder().decode([FunctionCallingTool].self, from: data)
            let firebaseVertexAITools = functionCallingTools.map { $0.toFunctionDeclaration }

            return [FirebaseVertexAI.Tool(functionDeclarations: firebaseVertexAITools)]
        }
    }
}
