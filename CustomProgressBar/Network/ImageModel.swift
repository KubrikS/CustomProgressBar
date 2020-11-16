//
//  ImageModel.swift
//  CustomProgressBar
//
//  Created by Stanislav on 16.11.2020.
//

import UIKit

struct ImageBreed: Decodable {
    let url: String
    
    enum CodingKeys: String, CodingKey {
        case url = "message"
    }
}
