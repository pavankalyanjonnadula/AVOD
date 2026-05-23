//
//  Items.swift
//
//  Generated using https://jsonmaster.github.io
//  Created on May 22, 2026
//
import Foundation

struct Items: Codable {

	let id: String?
	let type: String?
	let title: String?
	let strapline: String?
	let imageUrl: String?
	let categories: [String]?
	let genres: [String]?
	let subgenres: [String]?
	let badges: [String]?
	let accessibility: Accessibility?
	let tier: [String]?
	let contentOwner: String?
	let synopsis: String?
	let latestBroadcastDateTime: String?

	private enum CodingKeys: String, CodingKey {
		case id = "id"
		case type = "type"
		case title = "title"
		case strapline = "strapline"
		case imageUrl = "imageUrl"
		case categories = "categories"
		case genres = "genres"
		case subgenres = "subgenres"
		case badges = "badges"
		case accessibility = "accessibility"
		case tier = "tier"
		case contentOwner = "contentOwner"
		case synopsis = "synopsis"
		case latestBroadcastDateTime = "latestBroadcastDateTime"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		id = try values.decodeIfPresent(String.self, forKey: .id)
		type = try values.decodeIfPresent(String.self, forKey: .type)
		title = try values.decodeIfPresent(String.self, forKey: .title)
		strapline = try values.decodeIfPresent(String.self, forKey: .strapline)
		imageUrl = try values.decodeIfPresent(String.self, forKey: .imageUrl)
		categories = try values.decodeIfPresent([String].self, forKey: .categories)
		genres = try values.decodeIfPresent([String].self, forKey: .genres)
		subgenres = try values.decodeIfPresent([String].self, forKey: .subgenres)
		badges = try values.decodeIfPresent([String].self, forKey: .badges)
		accessibility = try values.decodeIfPresent(Accessibility.self, forKey: .accessibility)
		tier = try values.decodeIfPresent([String].self, forKey: .tier)
		contentOwner = try values.decodeIfPresent(String.self, forKey: .contentOwner)
		synopsis = try values.decodeIfPresent(String.self, forKey: .synopsis)
		latestBroadcastDateTime = try values.decodeIfPresent(String.self, forKey: .latestBroadcastDateTime)
	}

}
