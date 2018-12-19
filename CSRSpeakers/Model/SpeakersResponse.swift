//
//	RootClass.swift
//
//	Create by Waleed Ghalwash on 6/8/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

//	The "Swift - Struct - Gloss" support has been made available by CodeEagle
//	More about him/her can be found at his/her website: https://github.com/CodeEagle

import Foundation 
import Gloss

//MARK: - RootClass
public struct SpeakersResponse: Glossy {

	public let currentPage : Int!
	public let data : [SpeakerEntity]!
	public let from : Int!
	public let lastPage : Int!
	public let nextPageUrl : String!
	public let perPage : Int!
	public let prevPageUrl : AnyObject!
	public let to : Int!
	public let total : Int!



	//MARK: Decodable
	public init?(json: JSON){
		currentPage = "current_page" <~~ json
		data = "data" <~~ json
		from = "from" <~~ json
		lastPage = "last_page" <~~ json
		nextPageUrl = "next_page_url" <~~ json
		perPage = "per_page" <~~ json
		prevPageUrl = "prev_page_url" <~~ json
		to = "to" <~~ json
		total = "total" <~~ json
	}


	//MARK: Encodable
	public func toJSON() -> JSON? {
		return jsonify([
		"current_page" ~~> currentPage,
		"data" ~~> data,
		"from" ~~> from,
		"last_page" ~~> lastPage,
		"next_page_url" ~~> nextPageUrl,
		"per_page" ~~> perPage,
		"prev_page_url" ~~> prevPageUrl,
		"to" ~~> to,
		"total" ~~> total,
		])
	}

}
