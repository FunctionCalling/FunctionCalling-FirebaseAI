//
//  Extensions.swift
//  FunctionCalling-FirebaseVertexAI
//
//  Created by 伊藤史 on 2024/09/20.
//

@testable import FirebaseVertexAI

extension FirebaseVertexAI.Tool {
    var functions: [FirebaseVertexAI.FunctionDeclaration]? {
        functionDeclarations
    }
}

extension FirebaseVertexAI.FunctionDeclaration {
    func getName() -> String {
        name
    }

    func getDescription() -> String {
        description
    }
}
