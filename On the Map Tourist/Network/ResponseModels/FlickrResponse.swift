//
//  FlickrResponse.swift
//  On the Map Tourist
//
//  Created by Abdulaziz Alsaloum on 15/02/2019.
//  Copyright © 2019 Abdulaziz Alsaloum. All rights reserved.
//

import Foundation

//MARK: Flick Response
struct FlickResponse: Codable {
    struct Photos: Codable {
        struct Photo: Codable {
            let farm, height_s: Int?
            let id: String?
            let isfamily, isfriend, ispublic: Int?
            let owner, secret, server, title: String?
            let url_s: String?
            let width_s: Int?
        }
            let page, pages, perpage: Int?
            let photo: [Photo]?
            let total: String?
    }
    var photos: Photos?
    var stat: String?
}
