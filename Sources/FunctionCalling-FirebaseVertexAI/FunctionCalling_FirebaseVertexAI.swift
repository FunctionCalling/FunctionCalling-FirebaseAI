//
//  FunctionCalling_FirebaseVertexAI.swift
//
//
//  Created by Fumito Ito on 2024/09/07.
//

import FunctionCalling
import FirebaseAI

extension ToolContainer {
    public var firebaseVertexAITools: [FirebaseAITool] {
        guard let declarations = allTools?.compactMap({ $0.toFunctionDeclaration }) else {
            return [.functionDeclarations([])]
        }

        return [FirebaseAITool.functionDeclarations(declarations)]
    }
}
