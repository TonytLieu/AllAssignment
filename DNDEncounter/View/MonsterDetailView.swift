//
//  MonsterDetailView.swift
//  DNDEncounter
//
//  Created by Tony Lieu on 11/29/23.
//

import SwiftUI

struct MonsterDetailView: View {
    var name:String
    var str:String
    var dex:String
    var int:String
    var con:String
    var wis:String
    var hitpoints:String
    var armorClass:String
    var meta:String
    var savingThrows:String
    var skills:String
    var senses:String
    var traits:String
    var actions:String
    var legendaryActions:String
    var imgURL:String
    var damageImmunities:String
    var conditionImmunities:String
    var damageVulnerabilities:String
    var damageResistances:String
    var reactions:String
    var languages:String
    var challenge:String
    
    var body: some View {
        AsyncImage(url: URL(string: imgURL), scale: 3)
    }
}

#Preview {
    MonsterDetailView(name: "", str: "", dex: "", int: "", con: "", wis: "", hitpoints: "", armorClass: "", meta: "", savingThrows: "", skills: "", senses: "", traits: "", actions: "", legendaryActions: "", imgURL: "", damageImmunities: "", conditionImmunities: "", damageVulnerabilities: "", damageResistances: "", reactions: "", languages: "", challenge: "")
}
