//
//  Accessibility.swift
//
//  Generated using https://jsonmaster.github.io
//  Created on May 22, 2026
//
import Foundation

struct Accessibility: Codable {

	let subtitled: Bool?
	let audioDescribed: Bool?
	let signed: Bool?

	private enum CodingKeys: String, CodingKey {
		case subtitled = "subtitled"
		case audioDescribed = "audioDescribed"
		case signed = "signed"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		subtitled = try values.decodeIfPresent(Bool.self, forKey: .subtitled)
		audioDescribed = try values.decodeIfPresent(Bool.self, forKey: .audioDescribed)
		signed = try values.decodeIfPresent(Bool.self, forKey: .signed)
	}

}