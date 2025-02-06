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
        guard let declarations = allTools?.compactMap({ $0.toFunctionDeclaration }) else {
            return [.functionDeclarations([])]
        }

        return [FirebaseVertexAI.Tool.functionDeclarations(declarations)]
    }
}
