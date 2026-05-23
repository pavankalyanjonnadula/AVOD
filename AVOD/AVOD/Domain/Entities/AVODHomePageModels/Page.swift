//
//  Page.swift
//  Created on May 22, 2026
//
import Foundation

struct Page: Codable {

	let id: String?
	let name: String?
	let imageUrl: String?
	let adServed: Bool?

	private enum CodingKeys: String, CodingKey {
		case id = "id"
		case name = "name"
		case imageUrl = "imageUrl"
		case adServed = "adServed"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		id = try values.decodeIfPresent(String.self, forKey: .id)
		name = try values.decodeIfPresent(String.self, forKey: .name)
		imageUrl = try values.decodeIfPresent(String.self, forKey: .imageUrl)
		adServed = try values.decodeIfPresent(Bool.self, forKey: .adServed)
	}
    
    init(id: String?, name: String?, imageUrl: String?, adServed: Bool?) {
        self.id = id
        self.name = name
        self.imageUrl = imageUrl
        self.adServed = adServed
    }

}
