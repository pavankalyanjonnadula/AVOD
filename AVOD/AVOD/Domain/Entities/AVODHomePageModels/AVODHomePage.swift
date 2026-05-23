//
//  AVODHomePage.swift
//
//  Created on May 22, 2026
//
import Foundation

struct AVODHomePage: Codable {

	let record: Record?
	let metadata: Metadata?

	private enum CodingKeys: String, CodingKey {
		case record = "record"
		case metadata = "metadata"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		record = try values.decodeIfPresent(Record.self, forKey: .record)
		metadata = try values.decodeIfPresent(Metadata.self, forKey: .metadata)
	}

}
