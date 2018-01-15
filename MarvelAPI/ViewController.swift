//
//  ViewController.swift
//  MarvelAPI
//
//  Created by Jorge MR on 13/01/18.
//  Copyright © 2018 jorge_a_mtz_r. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import Kingfisher

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var tableView: UITableView!
    
    var mySuperHeroes : [SuperHero] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        DispatchQueue.global(qos: .userInteractive).async {
            self.getCharacters()
        }
    }

    func getCharacters() {

        let parameters: Parameters = [
            "ts": 1,
            "apikey": "f8a2d5522ca5c023e32cd10478b814a7",
            "hash": "027ba2a734e16c9246144100ee5fceb9"
        ]

        Alamofire.request("https://gateway.marvel.com:443/v1/public/characters", parameters: parameters, encoding: URLEncoding.default).responseJSON { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                print("JSON: \(json["data"]["results"][6]["thumbnail"]["path"])")
                for (_,subJson) in json["data"]["results"] {
                    let imageLink = subJson["thumbnail"]["path"].stringValue + "." + subJson["thumbnail"]["extension"].stringValue
                    let name = subJson["name"].stringValue
                    let descripcion = subJson["description"].stringValue
                    let superHeroe = SuperHero(name: name, imageLink: imageLink, description: descripcion, image : nil)
                    self.mySuperHeroes.append(superHeroe)
                    print("name:",imageLink)
                }
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            case .failure(let error):
                print("👒")
                print(error)
            }
        }
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mySuperHeroes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "superCell", for: indexPath) as! SuperTableViewCell
        cell.titleLabelCell?.text = mySuperHeroes[indexPath.row].name
        let url = URL(string: mySuperHeroes[indexPath.row].imageLink)
        cell.imageViewCell.kf.setImage(with: url)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detailSegue" {
            guard let indexPath = tableView.indexPathForSelectedRow else { return }
            let destinationVC = segue.destination as! DetailViewController
            destinationVC.name = mySuperHeroes[indexPath.row].name
            destinationVC.descriptionTV = mySuperHeroes[indexPath.row].description
            destinationVC.image = mySuperHeroes[indexPath.row].imageLink
        }
    }

}

