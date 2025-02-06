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
        let parameters: [String: FirebaseVertexAI.Schema] = {
            guard let properties = inputSchema.properties else {
                return [:]
            }

            return properties.mapValues { $0.toSchema }
        }()

        return FunctionDeclaration(
            name: name,
            description: description,
            parameters: parameters
        )
    }
}
