//
//	Data.swift
//
//	Create by Waleed Ghalwash on 6/8/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

//	The "Swift - Struct - Gloss" support has been made available by CodeEagle
//	More about him/her can be found at his/her website: https://github.com/CodeEagle

import Foundation 
import Gloss

//MARK: - Data
public struct SpeakerEntity: Glossy {

	public let bio : String!
	public let id : Int!
	public let imageUrl : String!
	public let name : String!
	public let title : String!



	//MARK: Decodable
	public init?(json: JSON){
		bio = "bio" <~~ json
		id = "id" <~~ json
		imageUrl = "image_url" <~~ json
		name = "name" <~~ json
		title = "title" <~~ json
	}


	//MARK: Encodable
	public func toJSON() -> JSON? {
		return jsonify([
		"bio" ~~> bio,
		"id" ~~> id,
		"image_url" ~~> imageUrl,
		"name" ~~> name,
		"title" ~~> title,
		])
	}

}
