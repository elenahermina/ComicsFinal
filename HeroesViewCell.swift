//
//  HeroesTableViewCell.swift
//  ComicsFinal
//
//  Created by elena hermina barbullushi on 06.03.21.
//
import UIKit
import Kingfisher

class HeroesViewCell: UITableViewCell {
    
    private var heroe: Heroe?
    
    
//    MARK: Lifecycle methods
    
    override func awakeFromNib() {
        heroImage.layer.cornerRadius = 15
        heroImage.layer.borderColor = UIColor.white.withAlphaComponent(0.2).cgColor
        heroImage.layer.borderWidth = 1.0
    }
    
    override func prepareForReuse() {
        heroe = nil
       }
    
//    MARK: IBOUTLET
    
    @IBOutlet weak var heroImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var starImage: UIImageView!
    
    
//  MARK: ConfigureView
    
    func setHeroe (_ heroe: Heroe) {
        self.heroe = heroe
        heroImage.image = UIImage.init(named: heroe.heroeImage ?? "")
        nameLabel.text = heroe.heroeName ?? ""
        self.setPowerImage()
    }
    
    func setPowerImage () {
        let powerImage: String
        
        
        let power = heroe?.heroePower
        switch power {
        case 0:
            powerImage = "ic_stars_0"
        case 1:
            powerImage = "ic_stars_1"
        case 2:
        powerImage = "ic_stars_2"
        case 3:
        powerImage = "ic_stars_3"
        case 4:
        powerImage = "ic_stars_4"
        case 5:
        powerImage = "ic_stars_5"
            
        default:
            powerImage = "ic_stars_0"
        }
        
        starImage.image = UIImage.init(named: powerImage)
    }
    
    
    }

