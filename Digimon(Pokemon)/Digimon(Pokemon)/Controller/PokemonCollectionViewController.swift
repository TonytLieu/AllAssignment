//
//  PokemonCollectionViewController.swift
//  Digimon(Pokemon)
//
//  Created by Tony Lieu on 11/4/23.
//

import UIKit

class PokemonCollectionViewController: UIViewController {
    @IBOutlet weak var pokeCollection: UICollectionView!
    var pokeList: [PokemonModel] = []
    override func viewDidLoad() {
        getDataFromNetworkManagerUsingProtocolDelegate()
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    func getDataFromNetworkManagerUsingProtocolDelegate(){
           let nM = NetworkManager()
           guard let url = URL(string: "https://digimon-api.vercel.app/api/digimon") else {return}
            nM.getDataFromAPIusingNetworkProtocol(url: url)
       }
    func CallAPI(){
        let nM = NetworkManager()
        guard let url = URL(string:"https://digimon-api.vercel.app/api/digimon") else{return}
        nM.getDataFromAPI(url: url, modelType: [PokemonModel].self ) { results in
            switch results{
            case .success(let PokemonData):
                self.pokeList.append(contentsOf: PokemonData)
                DispatchQueue.main.async {
                    self.pokeCollection.reloadData()
                }
            case .failure(let error):
                print(String(describing: error))
            }
        }
    }
}
extension PokemonCollectionViewController:UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print(pokeList.count)
        return pokeList.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PokeCollectionViewCell", for: indexPath) as! PokeCollectionViewCell
        let number = pokeList[indexPath.row].name
        //let number2 = pokeList[indexPath.row].img
        cell.pokeLableCollection.text = number
        //cell.pokeImgCollection.toImage(urlString: number2)
        return cell
    }
}
extension PokemonCollectionViewController:UICollectionViewDelegate{
    internal func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath){
        print(pokeList[indexPath.row])
    }
}
