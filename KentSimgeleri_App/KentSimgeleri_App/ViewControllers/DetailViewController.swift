//
//  DetailViewController.swift
//  KentSimgeleri_App
//
//  Created by Taha Turan on 26.04.2023.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var kentImageView: UIImageView!
    
    
    var kent:KentModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let kentModel = kent {
            kentImageView.image = UIImage(named: kentModel.resim!)
        }
    }
    



}
