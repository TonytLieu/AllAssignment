//
//  MonsterListName.swift
//  DNDEncounter
//
//  Created by Tony Lieu on 11/28/23.
//

import SwiftUI

struct MonsterListName: View {
    @StateObject var monster = MonsterNameList()
    var urljson = "https://gist.githubusercontent.com/tkfu/9819e4ac6d529e225e9fc58b358c3479/raw/d4df8804c25a662efc42936db60cfbc0a5b19db8/srd_5e_monsters.json"
    var body: some View {
        List(monster.monsterList){monster in
            NavigationLink(monster.name){
                MonsterDetailView(name: monster.name, str: monster.str, dex: monster.dex, int: monster.int, con: monster.con, wis: monster.wis, hitpoints: monster.hitPoints, armorClass: monster.armorClass, meta: monster.meta, savingThrows: monster.savingThrows ?? "none", skills: monster.skills ?? "none", senses: monster.senses, traits: monster.traits ?? "none", actions: monster.actions ?? "none", legendaryActions: monster.legendaryActions  ?? "none", imgURL: monster.imgURL, damageImmunities: monster.damageImmunities ?? "none", conditionImmunities: monster.conditionImmunities ?? "none", damageVulnerabilities: monster.damageVulnerabilities ?? "none", damageResistances: monster.damageResistances ?? "none", reactions: monster.reactions ?? "none", languages: monster.languages , challenge:monster.challenge)
            }
        }.onAppear(){
            monster.populateLists(urlString: urljson)
        }
    }
}
#Preview {
    MonsterListName()
}
