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
    func backgroundColor(color: String) {
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
    case .bug:
        self.mainScreenView.backgroundColor = UIColor(displayP3Red: 166, green: 185, blue: 26, alpha: 1)
    case .ghost:
        self.mainScreenView.backgroundColor = UIColor(displayP3Red: 115, green: 87, blue: 151, alpha: 1)
    case .steel:
        self.mainScreenView.backgroundColor = UIColor(displayP3Red: 183, green: 183, blue: 206, alpha: 1)
    case .grass:
        self.mainScreenView.backgroundColor = UIColor(displayP3Red: 122, green: 199, blue: 76, alpha: 1)
    case .electric:
        self.mainScreenView.backgroundColor = UIColor(displayP3Red: 247, green: 208, blue: 44, alpha: 1)
    case .psychic:
        self.mainScreenView.backgroundColor = UIColor(displayP3Red: 249, green: 85, blue: 135, alpha: 1)
    case .ice:
        self.mainScreenView.backgroundColor = UIColor(displayP3Red: 150, green: 217, blue: 214, alpha: 1)
    case .dragon:
        self.mainScreenView.backgroundColor = UIColor(displayP3Red: 111, green: 53, blue: 252, alpha: 1)
    case .dark:
        self.mainScreenView.backgroundColor = UIColor(displayP3Red: 112, green: 87, blue: 87, alpha: 1)
    case .fairy:
        self.mainScreenView.backgroundColor = UIColor(displayP3Red: 214, green: 113, blue: 173, alpha: 1)
    
 
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
                
                let background = json["types"][0]["name"].stringValue
                
                self.mainScreenView.backgroundColor(color: ".\(background)")
                
                
                
            case .failure(let error):
                
                self.pokemanInformationTextView.text = "Invalid selection entered or an error occured. Please Try Again 😁"
                
                print(error.localizedDescription)
                
            }
            
        }
        
    }
    
}

