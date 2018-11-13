//
//  ViewController.swift
//  PokemANAPI
//
//  Created by Zachary Harper on 11/12/18.
//  Copyright © 2018 Zachary Harper. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import SDWebImage

class ViewController: UIViewController {
    @IBOutlet weak var pokemanTextField: UITextField!
    @IBOutlet weak var pokemanInformationTextView: UITextView!
    
    @IBOutlet weak var pokemanImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
let pokemonURLCompnent = "https://pokeapi.co/api/v2/pokemon/"
    
    @IBAction func submitButtonTapped(_ sender: Any) {
        pokemanTextField.resignFirstResponder()
        
        
        //Checking to make sure the name has a value
        
        guard let pokemanName = pokemanTextField.text else {
            return
        }
        //clearing out text field
        pokemanTextField.text = ""
     
        //clearing out image view
        pokemanImageView.image = nil
        
        //replacing spaces with +'s so that it will be an  URL
        let pokemanNameURLComponent = pokemanName.replacingOccurrences(of: " ", with: "+")
        
        
        //Building complete URL
        let requestURL = pokemonURLCompnent + pokemanNameURLComponent + "/"

    
        Alamofire.request(requestURL).responseJSON { (response) in
            switch response.result {
                
            case .success(let value):
                
                
                 
                var json = JSON(value)
                
                self.pokemanInformationTextView.text = json["name"].stringValue
                
                
                self.pokemanImageView.sd_setImage(with: URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/\(json["id"].stringValue).png" ), placeholderImage: UIImage(named: "placeholder.png"))
            
                
            case .failure(let error):
                
                self.pokemanInformationTextView.text = "Invalid selection entered or an error occured. Please Try Again 😁"
                
                print(error.localizedDescription)
                
            }
            
        }
        
    }
    
}

