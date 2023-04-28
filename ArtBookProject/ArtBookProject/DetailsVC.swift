//
//  DetailsVC.swift
//  ArtBookProject
//
//  Created by Taha Turan on 28.04.2023.
//

import UIKit

class DetailsVC: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var artistTextField: UITextField!
    
    @IBOutlet weak var yearTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        view.addGestureRecognizer(gestureRecognizer)
    }
    
    @objc func hideKeyboard()  {
        view.endEditing(true)
    }
    

    @IBAction func saveButtonClicked(_ sender: Any) {
    }
    

}
