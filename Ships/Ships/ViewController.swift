//
//  ViewController.swift
//  Ships
//
//  Created by Sebastian Matyszewski on 12/06/2020.
//  Copyright © 2020 Sebastian Matyszewski. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var buttonNewGame: UIButton!
    
    @IBOutlet weak var buttonStatistics: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.view.backgroundColor = UIColor(patternImage: UIImage(named: "plays.png")!)
        UIGraphicsBeginImageContext(self.view.frame.size)
        UIImage(named: "plays.png")?.draw(in: self.view.bounds)
        let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        self.view.backgroundColor = UIColor(patternImage: image)
        // Do any additional setup after loading the view, typically from a nib.
        self.buttonNewGame.backgroundColor = UIColor.brown
        self.buttonStatistics.backgroundColor = UIColor.brown
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

