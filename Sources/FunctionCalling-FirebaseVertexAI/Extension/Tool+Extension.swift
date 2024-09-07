//
//  Tool+Extension.swift
//  
//
//  Created by Fumito Ito on 2024/09/07.
//

import FunctionCalling
import FirebaseVertexAI

extension FunctionCalling.Tool {
    var toFunctionDeclaration: FirebaseVertexAI.FunctionDeclaration {
        FunctionDeclaration(
            name: name,
            description: description,
            parameters: inputSchema.properties?.mapValues { $0.toSchema },
            requiredParameters: inputSchema.requiredProperties
        )
    }
}
