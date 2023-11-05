//
//  PokemonViewController.swift
//  Digimon(Pokemon)
//
/*
 1. use pokemon app Use .Protocal Delegate to send data back from network manager and show it in the collection view
 2. create a new demo app to show use of tab bar controller. have mulitple screens in it.
 3.show use of async let and dispatch group in playground
 4.show use of storyboaard referencing, use of perform segues
 */
//  Created by Tony Lieu on 11/2/23.
//

import UIKit

class PokemonViewController : UIViewController {
    var name = String()
    var lvl = String()
    var pokeImg = String()
    @IBOutlet weak var pokemonNameLabel: UILabel!
    @IBOutlet weak var pokemonLevelLabel: UILabel!
    @IBOutlet weak var PokemonPic: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        pokemonNameLabel.text = name
        pokemonLevelLabel.text = lvl
        PokemonPic.toImage(urlString: pokeImg)
        print(pokeImg)
    }
}
