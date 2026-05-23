//
//  Metadata.swift
//
//  Generated using https://jsonmaster.github.io
//  Created on May 22, 2026
//
import Foundation

struct Metadata: Codable {

	let id: String?
	let privateField: Bool?
	let createdAt: String?
	let name: String?

	private enum CodingKeys: String, CodingKey {
		case id = "id"
		case privateField = "private"
		case createdAt = "createdAt"
		case name = "name"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		id = try values.decodeIfPresent(String.self, forKey: .id)
		privateField = try values.decodeIfPresent(Bool.self, forKey: .privateField)
		createdAt = try values.decodeIfPresent(String.self, forKey: .createdAt)
		name = try values.decodeIfPresent(String.self, forKey: .name)
	}

}