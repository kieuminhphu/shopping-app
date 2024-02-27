//
//  LocalRepository.swift
//  ShoppingApp
//
//  Created by Kieu Phu on 27/02/2024.
//

import Foundation

protocol LocalRepository {
    associatedtype DomainModel
    
    func fetch() async throws -> [DomainModel]
    func save(items: [DomainModel]) async throws -> Void
}
