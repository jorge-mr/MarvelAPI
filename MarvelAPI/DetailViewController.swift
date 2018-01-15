//
//  DetailViewController.swift
//  MarvelAPI
//
//  Created by Jorge MR on 13/01/18.
//  Copyright © 2018 jorge_a_mtz_r. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionTextView: UITextView!
    
    var name : String!
    var descriptionTV: String!
    var image : String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = name
        descriptionTextView.text = descriptionTV
        let url = URL(string: image)
        imageView.kf.setImage(with: url)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
