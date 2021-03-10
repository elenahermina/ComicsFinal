//
//  HeroesViewController.swift
//  ComicsFinal
//
//  Created by elena hermina barbullushi on 06.03.21.
//
import UIKit

class HeroesViewController: UIViewController {
    
    //    MARK: IBOUTLET
    
    @IBOutlet weak var heroesTableView: UITableView!
    
    //    MARK: Properties
    
    private let dataProvider = DataProvider()
    private var heroes: [Heroe] = []
    
    //    MARK: Lifecycle methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.updateAllData()
        self.setupUI()
        
    }
    
    
    //  MARK: ConfigureView
    func setupUI() {
        self.title = "Heroes"
        let nib = UINib.init(nibName: "HeroesTableViewCell", bundle: nil)
        heroesTableView.register(nib, forCellReuseIdentifier: "HeroesTableViewCell")
        
        self.heroesTableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        
        heroesTableView.delegate = self
        heroesTableView.dataSource = self
    }
    
    private func updateAllData() {
        self.loadData()
        self.showData()
    }
    
    private func loadData () {
        self.heroes = dataProvider.loadAllHeroes()
    }
    
    private func showData() {
        heroesTableView.reloadData()
    }
    
}

// MARK: TableView Methods

extension HeroesViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 236
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return heroes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "HeroesViewCell", for: indexPath) as? HeroesViewCell {
            let heroe = heroes[indexPath.row]
            cell.setHeroe(heroe)
            return cell
        }
        
        fatalError("Could not create the Heroe cell")
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let heroe = heroes[indexPath.row]
        let heroesDetailVC = HeroesDetailViewController.init(withHeroe: heroe)
        heroesDetailVC.delegate = self
        self.navigationController?.pushViewController(heroesDetailVC, animated: true)
    }
}

//MARK: Delegate methods

extension HeroesViewController: HeroesViewControllerDelegate {
    func didPowerChanged() {
        updateAllData()
    }
}
