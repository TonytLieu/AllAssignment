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
    func saveDataIntoDatabase(list: [Monsters]) async throws{
        list.forEach{monsters in
            let monsterEntity = MonsterEnitiy(context: context)
            monsterEntity.name = monsters.name
            monsterEntity.meta = monsters.meta
            monsterEntity.armorClass = monsters.armorClass
            monsterEntity.hitPoints = monsters.hitPoints
            monsterEntity.str = monsters.str
            monsterEntity.dex = monsters.dex
            monsterEntity.con = monsters.con
            monsterEntity.int = monsters.int
            monsterEntity.wis = monsters.wis
            monsterEntity.cha = monsters.name
            monsterEntity.speed = monsters.speed
            monsterEntity.savingThrows = monsters.savingThrows
            monsterEntity.skills = monsters.skills
            monsterEntity.senses = monsters.senses
            monsterEntity.traits = monsters.traits
            monsterEntity.actions = monsters.actions
            monsterEntity.legendaryActions = monsters.legendaryActions
            monsterEntity.imgURL = monsters.imgURL
            monsterEntity.damageImmunities = monsters.damageImmunities
            monsterEntity.conditionImmunities = monsters.conditionImmunities
            monsterEntity.damageResistances = monsters.damageResistances
            monsterEntity.damageVulnerabilities = monsters.damageVulnerabilities
            monsterEntity.reactions = monsters.reactions
            monsterEntity.languages = monsters.languages
            monsterEntity.challenge = monsters.challenge
            
            
        }
        do{
            try self.context.save()
        }catch{
            print(error.localizedDescription)
            throw error
        }
    }
    
    func DeleteDataIntoDatabase(entry: MonsterEnitiy) async throws {
        self.context.delete(entry)
    }
    
    func GetDataIntoDatabase() async throws -> [MonsterEnitiy]  {
        let request:NSFetchRequest<MonsterEnitiy> = MonsterEnitiy.fetchRequest()
        let allRecords = try self.context.fetch(request)
        return  allRecords
    }
    func clearAllRecords()async throws{
        let request:NSFetchRequest<MonsterEnitiy> = MonsterEnitiy.fetchRequest()
        let allRecords = try self.context.fetch(request)
        allRecords.forEach {monsterEntiy in
            self.context.delete(monsterEntiy)
        }
        try self.context.save()
        print("all data deleted")
    }
    
    
}
protocol CoreDataActions{
    func saveDataIntoDatabase(list:[Monsters]) async throws
    func DeleteDataIntoDatabase(entry:MonsterEnitiy) async throws
    func GetDataIntoDatabase() async throws ->[MonsterEnitiy]
}
