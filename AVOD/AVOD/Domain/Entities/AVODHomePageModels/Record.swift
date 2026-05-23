//
//  Record.swift
//
//  Generated using https://jsonmaster.github.io
//  Created on May 22, 2026
//
import Foundation

struct Record: Codable {

	let page: Page?
	let sections: [Sections]?

	private enum CodingKeys: String, CodingKey {
		case page = "page"
		case sections = "sections"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		page = try values.decodeIfPresent(Page.self, forKey: .page)
		sections = try values.decodeIfPresent([Sections].self, forKey: .sections)
	}

}