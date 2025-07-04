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
        
        let config = UIImage.SymbolConfiguration(pointSize: 24 , weight: .medium)
        let image = UIImage(systemName: "wallet.bifold.fill", withConfiguration: config)
        btn.setImage(image, for: .normal)
        return btn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSomeTabItems()
        btnMiddle.frame = CGRect(x: Int(self.tabBar.bounds.width)/2 - 30, y: -20, width: 60, height: 60)
    }
    
    override func loadView() {
        super.loadView()
        self.tabBar.addSubview(btnMiddle)
        setupCustomTabBar()
    }
 
    func setupCustomTabBar() {
        let path: UIBezierPath = getPathForTabBar()
        let shape = CAShapeLayer()
        shape.path = path.cgPath
        shape.lineWidth = 3
        shape.strokeColor = UIColor.clear.cgColor
        shape.fillColor = UIColor.tabBarBackgroundColor?.cgColor
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
        items[1].image = UIImage(systemName: "person.fill")
    }

    
    
    func getPathForTabBar() -> UIBezierPath {
        let frameWidth = self.tabBar.bounds.width
        let frameHeight = self.tabBar.bounds.height + 49
        let holeWidth = 150
        let holeHeight = 50
        let leftXUntilHole = Int(frameWidth/2) - Int(holeWidth/2)

        let path: UIBezierPath = UIBezierPath()
        path.move(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: leftXUntilHole, y: 0)) //line.1
        path.addCurve(to: CGPoint(x: leftXUntilHole + (holeWidth/3), y: holeHeight/2), controlPoint1: CGPoint(x: leftXUntilHole + ((holeWidth/3)/8)*6, y: 0), controlPoint2: CGPoint(x: leftXUntilHole + ((holeWidth/3)/8)*8, y: holeHeight/2)) // part 1
        
        path.addCurve(to: CGPoint(x: leftXUntilHole + (2*holeWidth)/3, y: holeHeight/2), controlPoint1: CGPoint(x: leftXUntilHole + (holeWidth/3) + (holeWidth/3)/3*2/5, y: (holeHeight/2)*6/4), controlPoint2: CGPoint(x: leftXUntilHole + (holeWidth/3) + (holeWidth/3)/3*2 + (holeWidth/3)/3*3/5, y: (holeHeight/2)*6/4)) // part II

        path.addCurve(to: CGPoint(x: leftXUntilHole + holeWidth, y: 0), controlPoint1: CGPoint(x: leftXUntilHole + (2*holeWidth)/3,y: holeHeight/2), controlPoint2: CGPoint(x: leftXUntilHole + (2*holeWidth)/3 + (holeWidth/3)*2/8, y: 0)) // part III
        path.addLine(to: CGPoint(x: frameWidth, y: 0)) // 2. Line
        path.addLine(to: CGPoint(x: frameWidth, y: frameHeight)) // 3. Line
        path.addLine(to: CGPoint(x: 0, y: frameHeight)) // 4. Line
        path.addLine(to: CGPoint(x: 0, y: 0)) // 5. Line
        path.close()
        
        return path
    }

}



