//
//  CoinData.swift
//  Challenge-06-Networking-API
//
//  Created by Dimitar Stefanovski on 5/8/20.
//  Copyright © 2020 Dimitar Stefanovski. All rights reserved.
//

import Foundation

struct CoinData: Decodable {
    let time: String
    let asset_id_base: String
    let asset_id_quote: String
    let rate: Double
}
