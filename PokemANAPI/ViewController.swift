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
    
    @IBOutlet var mainScreenView: UIView!
    @IBOutlet weak var pokemanImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
let pokemonURLCompnent = "https://pokeapi.co/api/v2/pokemon/"
    func backgroundColor() {
    enum types {
        case normal
        case fire
        case water
        case fighting
        case poison
        case ground
        case rock
        case bug
        case ghost
        case steel
        case grass
        case electric
        case psychic
        case ice
        case dragon
        case dark
        case fairy
    }
        var color = types.normal
    
    switch color {
    case .normal:
        self.mainScreenView.backgroundColor = UIColor(displayP3Red: 168, green: 167, blue: 122, alpha: 1)
    case .water:
        self.mainScreenView.backgroundColor = UIColor(displayP3Red: 238, green: 129, blue: 48, alpha: 1)
    case .fighting:
        self.mainScreenView.backgroundColor = UIColor(displayP3Red: 194, green: 46, blue: 40, alpha: 1)
    case .poison:
        self.mainScreenView.backgroundColor = UIColor(displayP3Red: 163, green: 62, blue: 161, alpha: 1)
    case .ground:
        self.mainScreenView.backgroundColor = UIColor(displayP3Red: 206, green: 191, blue: 101, alpha: 1)
    case .rock:
        self.mainScreenView.backgroundColor = UIColor(displayP3Red: 182, green: 161, blue: 54, alpha: 1)
    
 
    default:
    break
    }
    }
    
  
    
    

    
    
    
    
    
    
    
    
    
    
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

