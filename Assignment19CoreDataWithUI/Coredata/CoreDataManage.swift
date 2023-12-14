//
//  CoreDataManage.swift
//  Assignment19CoreDataWithUI
//
//  Created by Tony Lieu on 11/21/23.
//

import Foundation
import CoreData

class CoreDataManage:CoreDataActions{
    let context:NSManagedObjectContext
    init(context: NSManagedObjectContext) {
        self.context = context
    }
    func saveDataIntoDatabase(list: [Product]) async throws{
        list.forEach{product in
            let productEntity = ProductEnitiy(context: context)
            productEntity.title = product.title
            productEntity.descriptions = product.description
        }  
        do{
            try self.context.save()
        }catch{
            print(error.localizedDescription)
            throw error
        }
    }
    func DeleteDataIntoDatabase(entry: ProductEnitiy) async throws {
        self.context.delete(entry)
    }
    
    func GetDataIntoDatabase() async throws -> [ProductEnitiy]  {
        let request:NSFetchRequest<ProductEnitiy> = ProductEnitiy.fetchRequest()
        let allRecords = try self.context.fetch(request)
        return  allRecords
    }
    func clearAllRecords()async throws{
        let request:NSFetchRequest<ProductEnitiy> = ProductEnitiy.fetchRequest()
        let allRecords = try self.context.fetch(request)
        allRecords.forEach {productEntiy in
            self.context.delete(productEntiy)
        }
        try self.context.save()
        print("all data deleted")
    }
}

protocol CoreDataActions{
    func saveDataIntoDatabase(list:[Product]) async throws
    func DeleteDataIntoDatabase(entry:ProductEnitiy) async throws
    func GetDataIntoDatabase() async throws ->[ProductEnitiy]
}
