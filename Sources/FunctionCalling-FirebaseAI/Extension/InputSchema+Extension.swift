//
//  InputSchema+Extension.swift
//  
//
//  Created by Fumito Ito on 2024/09/07.
//

import FunctionCalling
import FirebaseAI

extension FunctionCalling.InputSchema {
    var toSchema: Schema {
        switch type {
        case .string:
            return .string(
                description: description,
                nullable: nullable ?? false,
                format: format.toStringFormat
            )
        case .number:
            return .double(
                description: description,
                nullable: nullable ?? false
            )
        case .integer:
            return .integer(
                description: description,
                nullable: nullable ?? false,
                format: format.toIntegerFormat
            )
        case .boolean:
            return .boolean(
                description: description,
                nullable: nullable ?? false
            )
        case .array:
            guard let items else {
                fatalError("array is set but items are not found")
            }

            return .array(
                items: items.toSchema,
                description: description,
                nullable: nullable ?? false
            )
        case .object:
            guard let properties else {
                fatalError("object is set but properties are note found")
            }

            return .object(
                properties: properties.mapValues { $0.toSchema },
                optionalProperties: [],
                description: description,
                nullable: nullable ?? false
            )
        }
    }
}

extension Optional<String> {
    var toStringFormat: Schema.StringFormat? {
        guard let format = self else {
            return nil
        }

        return .custom(format)
    }

    var toIntegerFormat: Schema.IntegerFormat? {
        guard let format = self else {
            return nil
        }

        return .custom(format)
    }
}
