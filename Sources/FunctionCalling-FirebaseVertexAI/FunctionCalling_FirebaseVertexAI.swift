//
//  FunctionCalling_FirebaseVertexAI.swift
//
//
//  Created by Fumito Ito on 2024/09/07.
//

import FunctionCalling
import FirebaseVertexAI
import Foundation

extension ToolContainer {
    public var firebaseVertexAITools: [FirebaseVertexAI.Tool] {
        get {
            [
                FirebaseVertexAI.Tool(
                    functionDeclarations: allTools?.compactMap { $0.toFunctionDeclaration }
                )
            ]
        }
    }
}
