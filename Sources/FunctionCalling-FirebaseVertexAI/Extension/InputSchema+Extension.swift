//
//  InputSchema+Extension.swift
//  
//
//  Created by Fumito Ito on 2024/09/07.
//

import FunctionCalling
import FirebaseVertexAI

extension FunctionCalling.InputSchema {
    var toSchema: FirebaseVertexAI.Schema {
        Schema(
            type: type.toDataType,
            format: format,
            description: description,
            nullable: nullable,
            enumValues: enumValues,
            items: items?.toSchema,
            properties: properties?.mapValues { $0.toSchema },
            requiredProperties: requiredProperties
        )
    }
}

extension FunctionCalling.InputSchema.DataType {
    var toDataType: FirebaseVertexAI.DataType {
        switch self {
        case .string:
            return .string
        case .number:
            return .number
        case .integer:
            return .integer
        case .boolean:
            return .boolean
        case .array:
            return .array
        case .object:
            return .object
        }
    }
}
