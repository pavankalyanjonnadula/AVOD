//
//  ModelExtensions+Testing.swift
//  AVODTests
//
//  Created for Testing
//

import Foundation
@testable import AVOD

// Simple test helpers - create models from JSON strings for testing
struct TestModelFactory {
    
    @MainActor
    static func createMockAVODHomePage(
        pageName: String = "Test Page",
        sectionsCount: Int = 0
    ) -> AVODHomePage? {
        let jsonString = """
        {
            "record": {
                "page": {
                    "id": "1",
                    "name": "\(pageName)",
                    "imageUrl": null,
                    "adServed": false
                },
                "sections": []
            },
            "metadata": {
                "id": "meta1",
                "private": false,
                "createdAt": "2026-05-23",
                "name": "Test Metadata"
            }
        }
        """
        
        guard let data = jsonString.data(using: .utf8) else { return nil }
        return try? JSONDecoder().decode(AVODHomePage.self, from: data)
    }
}

