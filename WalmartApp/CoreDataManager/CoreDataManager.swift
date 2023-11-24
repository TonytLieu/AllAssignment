//
//  CoreDataManager.swift
//  WalmartApp
//
//  Created by Tony Lieu on 11/23/23.
//

import Foundation
import CoreData
protocol CoreDataActions{
    func saveDataIntoDatabase(list:[Product]) async throws
    func DeleteDataIntoDatabase(entry:ProductEntity) async throws
    func GetDataIntoDatabase() async throws ->[ProductEntity]
}
class CoreDataManage:CoreDataActions{
    func DeleteDataIntoDatabase(entry: ProductEntity) async throws {
        self.context.delete(entry)

        do {
            try save()
        } catch {
            throw error
        }
    }
    
    func save() throws {
        do {
            try self.context.save()
        } catch {
            throw error
        }
    }
    
    func GetDataIntoDatabase() async throws -> [ProductEntity] {
        let request:NSFetchRequest<ProductEntity> = ProductEntity.fetchRequest()
        let allRecords = try self.context.fetch(request)
        return  allRecords
    }
    
    let context:NSManagedObjectContext
    init(context: NSManagedObjectContext) {
        self.context = context
    }
    func saveDataIntoDatabase(list: [Product]) async throws {
        try await clearAllRecord()
        
        list.forEach{listProduct in
            let product = ProductEntity(context: context)
            product.title = listProduct.title
            product.desc = listProduct.description
            product.price = Int64(listProduct.price)
        }
        do{
            try self.context.save()
        }catch{
            print(error.localizedDescription)
            throw error
        }
    }
    func clearAllRecord() async throws {
        let request: NSFetchRequest<ProductEntity> = ProductEntity.fetchRequest()
        let allRecords = try self.context.fetch(request)
        allRecords.forEach { self.context.delete($0) }
        try self.context.save()
    }
}
