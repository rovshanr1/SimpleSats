//
//  MainTabView.swift
//  SimpleSats
//
//  Created by Rovshan Rasulov on 23.06.25.
//

import UIKit

class MainTabView: UITabBarController {
    
    let btnMiddle: UIButton = {
        let btn = UIButton(frame: CGRect(x: 0, y: 0, width: 60, height: 60))
        btn.setTitle("", for: .normal)
        btn.backgroundColor = .tabBarBtnColor
        btn.layer.cornerRadius = 30
        btn.layer.shadowColor = UIColor.black.cgColor
        btn.layer.shadowOpacity = 0.2
        btn.layer.shadowOffset = CGSize(width: 4, height: 4)
        
        return btn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func loadView() {
        super.loadView()
    }
 
    func setupCustomTabBar() {
        let path: UIBezierPath = getPathForTabBar()
        let shape = CAShapeLayer()
        shape.path = path.cgPath
        shape.lineWidth = 3
        shape.strokeColor = UIColor.white.cgColor
        shape.fillColor = UIColor.white.cgColor
        self.tabBar.layer.insertSublayer(shape, at: 0)
        self.tabBar.itemWidth = 40
        self.tabBar.itemPositioning = .centered
        self.tabBar.itemSpacing = 180
        self.tabBar.tintColor = .nonSelectedTI
        
    }
    
    func addSomeTabItems(){
        let home = UINavigationController(rootViewController: HomeVC())
        let profile = UINavigationController(rootViewController: ProfileVC())
        
        setViewControllers([home, profile], animated: false)
        guard let items = tabBar.items else{ return }
        items[0].image = UIImage(systemName: "clock.arrow.trianglehead.counterclockwise.rotate.90")
        items[1].image = UIImage(systemName: "dollarsign.arrow.trianglehead.counterclockwise.rotate.90")
    }

    
    
    func getPathForTabBar() -> UIBezierPath {

    }

}



