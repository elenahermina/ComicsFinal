//
//  HeroesDetailViewController.swift
//  ComicsFinal
//
//  Created by elena hermina barbullushi on 06.03.21.
//

import UIKit
import Kingfisher

//MARK: Delegate protocol

protocol HeroesViewControllerDelegate: AnyObject {
    func didPowerChanged()
}

class HeroesDetailViewController: UIViewController {
    
//    MARK: Properties
    
    weak var delegate: HeroesViewControllerDelegate?
    var superheroe: Heroe?
    var battles: [Battle] = []
    
//    MARK: Lifecycle methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        delegate?.didPowerChanged()
    }
    
    convenience init(withHeroe heroe: Heroe ){
        self.init(nibName: "HeroesDetailViewController", bundle: nil)
        self.superheroe = heroe
//        return battles sorted
        guard let battles = heroe.battles?.allObjects.sorted(by: { ($0 as AnyObject).id < ($1 as AnyObject).id } ) as? [Battle] else {return}
        self.battles = battles
        self.title = heroe.heroeName
    }
    
//    MARK: IBOutlet

    @IBOutlet weak var detailHeroeImage: UIImageView!
    @IBOutlet weak var detailHeroePower: UIImageView!
    @IBOutlet weak var superPowerLabel: UILabel!
   
    @IBOutlet weak var biographyLabel: UILabel!
    @IBOutlet weak var biographyContentLabel: UILabel!
    
//    MARK: IBActions
    
    @IBAction func editPowerButton(_ sender: Any) {
        guard let he = superheroe else {return}
        let heroesPowerVC = HeroesPowerViewController.init(withHeroe: he)
        heroesPowerVC.delegate = self
        heroesPowerVC.modalPresentationStyle = .overCurrentContext
        self.present(heroesPowerVC, animated: true, completion: nil)
    }
    
//    MARK: ConfigureView
    
    func setupUI() {
        
        detailHeroeImage.image = UIImage.init(named: superheroe?.heroeImage ?? "")
        self.setPowerImage()
        biographyContentLabel.text = superheroe?.heroeBio ?? ""
        detailHeroeImage.layer.cornerRadius = 15
        
//        CollectionView
        
      
    }
    
    
   
    
    func setPowerImage () {
        let powerImage: String
        
        
        let power = superheroe?.heroePower
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
        
        detailHeroePower.image = UIImage.init(named: powerImage)
    }

}


//MARK: Delegate methods

extension HeroesDetailViewController: HeroesPowerDelegate {
    func didPowerChanged(forHeroe heroe: Heroe) {
        self.superheroe = heroe
        self.setupUI()
        delegate?.didPowerChanged()
    }
    
}
