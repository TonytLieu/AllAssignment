//
//  Monsters.swift
//  DNDEncounter
//
//  Created by Tony Lieu on 11/28/23.
//
//https://gist.githubusercontent.com/tkfu/9819e4ac6d529e225e9fc58b358c3479/raw/d4df8804c25a662efc42936db60cfbc0a5b19db8/srd_5e_monsters.json
import Foundation

struct Monsters: Codable, Identifiable{
    let id = UUID()
    let name, meta, armorClass, hitPoints: String
    let speed, str: String
    let strMod: Mod
    let dex: String
    let dexMod: Mod
    let con: String
    let conMod: Mod
    let int: String
    let intMod: Mod
    let wis: String
    let wisMod: Mod
    let cha: String
    let chaMod: Mod
    let savingThrows, skills: String?
    let senses, languages, challenge: String
    let traits, actions, legendaryActions: String?
    let imgURL: String
    let damageImmunities, conditionImmunities, damageResistances, damageVulnerabilities: String?
    let reactions: String?

    enum CodingKeys: String, CodingKey {
        case name, meta
        case armorClass = "Armor Class"
        case hitPoints = "Hit Points"
        case speed = "Speed"
        case str = "STR"
        case strMod = "STR_mod"
        case dex = "DEX"
        case dexMod = "DEX_mod"
        case con = "CON"
        case conMod = "CON_mod"
        case int = "INT"
        case intMod = "INT_mod"
        case wis = "WIS"
        case wisMod = "WIS_mod"
        case cha = "CHA"
        case chaMod = "CHA_mod"
        case savingThrows = "Saving Throws"
        case skills = "Skills"
        case senses = "Senses"
        case languages = "Languages"
        case challenge = "Challenge"
        case traits = "Traits"
        case actions = "Actions"
        case legendaryActions = "Legendary Actions"
        case imgURL = "img_url"
        case damageImmunities = "Damage Immunities"
        case conditionImmunities = "Condition Immunities"
        case damageResistances = "Damage Resistances"
        case damageVulnerabilities = "Damage Vulnerabilities"
        case reactions = "Reactions"
    }
}

enum Mod: String, Codable {
    case mod1 = "(+1)"
    case mod2 = "(-2)"
    case mod3 = "(-3)"
    case mod4 = "(-4)"
    case mod5 = "(-5)"
    case the0 = "(+0)"
    case the1 = "(-1)"
    case the10 = "(+10)"
    case the2 = "(+2)"
    case the3 = "(+3)"
    case the4 = "(+4)"
    case the5 = "(+5)"
    case the6 = "(+6)"
    case the7 = "(+7)"
    case the8 = "(+8)"
    case the9 = "(+9)"
}
