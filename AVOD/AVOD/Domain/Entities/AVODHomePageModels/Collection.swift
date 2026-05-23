//
//  Collection.swift
//
//  Generated using https://jsonmaster.github.io
//  Created on May 22, 2026
//
import Foundation

struct Collection: Codable {

	let id: String?
	let title: String?
	let itemCount: Int?
	let imageTreatment: String?
	let imageAspectRatio: String?
	let imageClass: String?
	let excludeTimeDependentTags: Bool?
	let adServed: Bool?
	let subsequentJourney: SubsequentJourney?

	private enum CodingKeys: String, CodingKey {
		case id = "id"
		case title = "title"
		case itemCount = "itemCount"
		case imageTreatment = "imageTreatment"
		case imageAspectRatio = "imageAspectRatio"
		case imageClass = "imageClass"
		case excludeTimeDependentTags = "excludeTimeDependentTags"
		case adServed = "adServed"
		case subsequentJourney = "subsequentJourney"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		id = try values.decodeIfPresent(String.self, forKey: .id)
		title = try values.decodeIfPresent(String.self, forKey: .title)
		itemCount = try values.decodeIfPresent(Int.self, forKey: .itemCount)
		imageTreatment = try values.decodeIfPresent(String.self, forKey: .imageTreatment)
		imageAspectRatio = try values.decodeIfPresent(String.self, forKey: .imageAspectRatio)
		imageClass = try values.decodeIfPresent(String.self, forKey: .imageClass)
		excludeTimeDependentTags = try values.decodeIfPresent(Bool.self, forKey: .excludeTimeDependentTags)
		adServed = try values.decodeIfPresent(Bool.self, forKey: .adServed)
        subsequentJourney = try values.decodeIfPresent(SubsequentJourney.self, forKey: .subsequentJourney)
	}

}

struct SubsequentJourney: Codable {
    let label: String?
        let destinationUrl: String?
        let name: String?

        private enum CodingKeys: String, CodingKey {
            case label = "label"
            case destinationUrl = "destinationUrl"
            case name = "name"
        }

        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            label = try values.decodeIfPresent(String.self, forKey: .label)
            destinationUrl = try values.decodeIfPresent(String.self, forKey: .destinationUrl)
            name = try values.decodeIfPresent(String.self, forKey: .name)
        }
}
