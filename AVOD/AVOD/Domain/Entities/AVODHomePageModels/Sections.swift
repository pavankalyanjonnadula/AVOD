//
//  Sections.swift
//
//  Generated using https://jsonmaster.github.io
//  Created on May 22, 2026
//
import Foundation

struct Sections: Codable {

	let id: String?
	let name: String?
	let type: String?
	let priority: String?
	let displayType: String?
	let platformDisplayType: String?
	let destination: String?
	let collection: Collection?
	let items: [Items]?

	private enum CodingKeys: String, CodingKey {
		case id = "id"
		case name = "name"
		case type = "type"
		case priority = "priority"
		case displayType = "displayType"
		case platformDisplayType = "platformDisplayType"
		case destination = "destination"
		case collection = "collection"
		case items = "items"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		id = try values.decodeIfPresent(String.self, forKey: .id)
		name = try values.decodeIfPresent(String.self, forKey: .name)
		type = try values.decodeIfPresent(String.self, forKey: .type)
		priority = try values.decodeIfPresent(String.self, forKey: .priority)
		displayType = try values.decodeIfPresent(String.self, forKey: .displayType)
		platformDisplayType = try values.decodeIfPresent(String.self, forKey: .platformDisplayType)
		destination = try values.decodeIfPresent(String.self, forKey: .destination)
		collection = try values.decodeIfPresent(Collection.self, forKey: .collection)
		items = try values.decodeIfPresent([Items].self, forKey: .items)
	}

}
