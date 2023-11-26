//
//  MapModel.swift
//  Maps
//
//  Created by Tony Lieu on 11/25/23.
//

import Foundation

// MARK: - WelcomeElement
struct MapsList: Codable, Identifiable {
    let id: Int
    let name, username, email: String
    let address: Address
    let phone, website: String
    let company: Company
}

// MARK: - Address
struct Address: Codable {
    let street, suite, city, zipcode: String
    let geo: Geo
}

// MARK: - Geo
struct Geo: Codable {
    let lat, lng: String
}

// MARK: - Company
struct Company: Codable {
    let name, catchPhrase, bs: String
}

typealias Welcome = [MapsList]
