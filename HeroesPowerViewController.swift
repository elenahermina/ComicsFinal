//
//  HeroesPowerViewController.swift
//  ComicsFinal
//
//  Created by elena hermina barbullushi on 06.03.21.
//

import UIKit

//MARK: Delegate protocol

protocol HeroesPowerDelegate: AnyObject {
    func didPowerChanged(forHeroe superheroe: Heroe)
}

class HeroesPowerViewController: UIViewController {
    
//    MARK: Properties
    
    weak var delegate: HeroesPowerDelegate?
    var superheroe: Heroe?
    
//    MARK: Lifecycle methods
    
    override func viewDidLoad () {
        super.viewDidLoad()
        setupUI()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        guard let superheroe = self.superheroe else {return}
        delegate?.didPowerChanged(forHeroe: superheroe)
    }
    
    convenience init(withHeroe superheroe: Heroe){
        self.init(nibName: "HeroesPowerViewController", bundle: nil)
        self.superheroe = superheroe
    }
    
//    MARK: IBOutlet
    
    @IBOutlet weak var myView: UIView!
    @IBOutlet weak var powerLabel: UILabel!
    @IBOutlet weak var powerSlider: UISlider!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var confirmButton: UIButton!
    @IBOutlet weak var powerNumberLabel: UILabel!
    
//    MARK: IBActions

    @IBAction func cancelSetPower(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func confirmSetPower(_ sender: Any) {
        let dataProvider = DataProvider()
        guard let heroe = self.superheroe else {return}
        heroe.heroePower = Int16(powerSlider.value)
        dataProvider.saveChanges()
        delegate?.didPowerChanged(forHeroe: heroe)
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func setPower(_ sender: UISlider) {
        let rate = Int(sender.value)
        powerNumberLabel.text = "\(rate)"
    }
    
//    MARK: ConfigureView
    
    func setupUI() {
        myView.layer.cornerRadius = 8.0
        cancelButton.layer.cornerRadius = 8.0
        confirmButton.layer.cornerRadius = 8.0
        guard let power = superheroe?.heroePower else {return}
        powerSlider.value = Float(Int(power))
        powerNumberLabel.text = String(power)
        setupViewEffects()
    }
    
    func setupViewEffects () {
        let blurEffect = UIBlurEffect(style: .extraLight)
        let blurredEffectView = UIVisualEffectView(effect: blurEffect)
        blurredEffectView.frame = view.bounds
        view.addSubview(blurredEffectView)
        view.sendSubviewToBack(blurredEffectView)
    }
    
}
