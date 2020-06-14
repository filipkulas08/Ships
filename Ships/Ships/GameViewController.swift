//
//  GameViewController.swift
//  Ships
//
//  Created by Sebastian Matyszewski on 12/06/2020.
//  Copyright © 2020 Sebastian Matyszewski. All rights reserved.
//

import UIKit
    var a = 0
var countShipShootedByMe = 0
var countShipShootedByEnemy = 0
var countShipShooted = 0
var percentageShipShooted:Float = 0
var countEnemyShipShooted = 0
var percentageEnemyShipShooted:Float = 0
var winner = ""
class GameViewController: UIViewController {
   
    @IBOutlet weak var exitButton: UIButton!
    @IBOutlet weak var boardOwn: UIImageView!
    @IBOutlet weak var statusPutShips: UILabel!
    @IBOutlet weak var infoEnemyBoard: UILabel!
    @IBOutlet weak var textPutShips: UILabel!
    @IBOutlet weak var boardEnemy: UIImageView!
    @IBOutlet weak var buttonPutShips: UIButton!
    
    @IBOutlet weak var statButton: UIButton!
    var status = 0
    var ships = 0
    //var ownBoard = [0,0,0,0,0,0,0,0,0,0 ]
    var ownBoard = Array(repeating: 0, count: 101)
    var enemyBoard = Array(repeating: 0, count: 101)
    //var numbers = [1,2,3,4,5,6,7,8,9]
    var numbers = [Int](1...100)
    
    
    func losujRozstawienieStatkow(n:Int,max:Int){
        
        var wylosowane = [Int]()
        while wylosowane.count<n{
            var liczba:Int?
            repeat{ liczba = Int(arc4random()) % max + 1
                
            }while wylosowane.contains(liczba!)
            wylosowane.append(liczba!)
        }
        for liczba in wylosowane{
            //print (liczba)
            enemyBoard[liczba] = 1;
        }
    }
    
    
    @IBAction func buttonPutShips(_ sender: Any) {
        status = 1
        losujRozstawienieStatkow(n:10, max:100)
        buttonPutShips.isHidden = true
        textPutShips.isHidden = true
        boardEnemy.isHidden = false
        statusPutShips.isHidden=true
        infoEnemyBoard.isHidden = false
        
        for n in 101...200{
            let tempButton = self.view.viewWithTag(Int(n)) as? UIButton
            tempButton?.isHidden = false
        }
        
        for n in 1...100{
            if ownBoard[n] == 1{
                let tempButton = self.view.viewWithTag(Int(n)) as? UIButton
                tempButton?.isEnabled = false
            }
            
        }
        //wypisanie wartości tablic
//        for n in 1...9{
//            print(ownBoard[n])
//        }
        print(" ")
        for n in 1...10{
            print(enemyBoard[(n*10)-9], enemyBoard[(n*10)-8], enemyBoard[(n*10)-7], enemyBoard[(n*10)-6], enemyBoard[(n*10)-5], enemyBoard[(n*10)-4], enemyBoard[(n*10)-3], enemyBoard[(n*10)-2], enemyBoard[(n*10)-1], enemyBoard[(n*10)])
            

        }
        
        
    }
    
    
    @IBAction func shipsAction(_ sender: AnyObject) {
        if status == 0{
            
            a = sender.tag
            print(a)
            if ownBoard[a] == 1{
                let tempButton = self.view.viewWithTag(Int(a)) as? UIButton
                tempButton?.backgroundColor = UIColor.white.withAlphaComponent(1)
                ownBoard[a] = 0
                ships = ships - 1
                statusPutShips.text = String(ships) + "/10"
                
                for n in 1...100{
                    if ownBoard[n] == 0{
                        let tempButton = self.view.viewWithTag(Int(n)) as? UIButton
                        tempButton?.isEnabled = true
                    }
                    
                }
                buttonPutShips.isEnabled = false
                
            }else{
                ownBoard[a] = 1
                let tempButton = self.view.viewWithTag(Int(a)) as? UIButton
                tempButton?.backgroundColor = UIColor.blue.withAlphaComponent(0.6)
                ships = ships + 1
                statusPutShips.text = String(ships) + "/10"
                
                if ships == 10{
                    for n in 1...100{
                        if ownBoard[n] == 0{
                            let tempButton = self.view.viewWithTag(Int(n)) as? UIButton
                            tempButton?.isEnabled = false
                        }
                        
                    }
                    buttonPutShips.isEnabled = true
                }
            }
            
            
        }else if status == 1{
            
            var temp = Int(arc4random_uniform(UInt32(numbers.count)))
            
            var number = numbers[temp]
            numbers.remove(at: temp)
            
            
            
            
            a = sender.tag
            let aa = a - 100
            
            print(a)
            print(" ")
            //let getRandom = losujPolozenieStatkow(min: 1, max: 9)
            print("Rand", number)
            //let tmp = Int(getRandom)
            if enemyBoard[aa] == 1{
                let tempButton = self.view.viewWithTag(Int(a)) as? UIButton
                tempButton?.backgroundColor = UIColor.red.withAlphaComponent(0.6)
                countShipShootedByMe = countShipShootedByMe + 1
                tempButton?.isEnabled = false
                countShipShooted = countShipShooted + 1
                if countShipShootedByMe == 10{
                    
                    for n in 1...200{
                        let tempButton = self.view.viewWithTag(Int(n)) as? UIButton
                        tempButton?.isEnabled = false
                        
                    }
                    percentageShipShooted = ((Float(countShipShootedByMe)/Float(countShipShooted))*100)
                    //percentageShipShooted = (4/6)*100
                    print("Oddane strzały:", countShipShooted)
                    print("Celne strzały:", countShipShootedByMe)
                    print("% celności strzałów:", percentageShipShooted)
                    //self.exitButton.textInputMode = "Powrót do menu"
                    exitButton.setTitle("Powrót do menu", for: .normal)
                    winner = name
                    statButton.isHidden = false
                    
                }
                
            }else{
                let tempButton = self.view.viewWithTag(Int(a)) as? UIButton
                tempButton?.backgroundColor = UIColor.gray.withAlphaComponent(0.6)
                tempButton?.isEnabled = false
                countShipShooted = countShipShooted + 1
                 percentageShipShooted = ((Float(countShipShootedByMe)/Float(countShipShooted))*100)
                
            }
            sleep(1)
            if ownBoard[number] == 1{
                let tempButton = self.view.viewWithTag(number) as? UIButton
                tempButton?.backgroundColor = UIColor.red.withAlphaComponent(0.6)
                countShipShootedByEnemy = countShipShootedByEnemy + 1
                tempButton?.isEnabled = false
                countEnemyShipShooted = countEnemyShipShooted + 1
                if countShipShootedByEnemy == 10{
                    for n in 1...200{
                        let tempButton = self.view.viewWithTag(Int(n)) as? UIButton
                        tempButton?.isEnabled = false
                        
                    }
                    //percentageShipShooted = (Float((countShipShootedByMe/countShipShooted)*100))
                    percentageEnemyShipShooted = ((Float(countShipShootedByEnemy)/Float(countEnemyShipShooted))*100)
                    //percentageShipShooted = (4/6)*100
                    print("Oddane strzały:", countShipShooted)
                    print("Celne strzały:", countShipShootedByMe)
                    print("% celności strzałów:", percentageShipShooted)
                    exitButton.setTitle("Powrót do menu", for: .normal)
                    statButton.isHidden = false
                    winner = "bot"
                }
            }else{
                percentageEnemyShipShooted = ((Float(countShipShootedByEnemy)/Float(countEnemyShipShooted))*100)
                let tempButton = self.view.viewWithTag(number) as? UIButton
                tempButton?.backgroundColor = UIColor.gray.withAlphaComponent(0.6)
                tempButton?.isEnabled = false
                countEnemyShipShooted = countEnemyShipShooted + 1
            }
            
            
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.exitButton.backgroundColor = UIColor.gray
        self.statButton.backgroundColor = UIColor.gray
        boardEnemy.isHidden = true
        infoEnemyBoard.isHidden = true
        if status == 0{
            for n in 101...200{
                let tempButton = self.view.viewWithTag(Int(n)) as? UIButton
                tempButton?.isHidden = true
            }
        }
        buttonPutShips.isEnabled = false
        
        
        if (mapa == "Lod"){
            UIGraphicsBeginImageContext(self.view.frame.size)

            UIImage(named: "lod.png")?.draw(in: self.view.bounds)
            let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
            UIGraphicsEndImageContext()
            self.view.backgroundColor = UIColor(patternImage: image)
        }else if (mapa == "Ogien"){
            UIGraphicsBeginImageContext(self.view.frame.size)

            UIImage(named: "ogien.png")?.draw(in: self.view.bounds)
            let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
            UIGraphicsEndImageContext()
            self.view.backgroundColor = UIColor(patternImage: image)
            
        }else if (mapa == "Wulkan"){
            UIGraphicsBeginImageContext(self.view.frame.size)
            
            UIImage(named: "wulkan.png")?.draw(in: self.view.bounds)
            let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
            UIGraphicsEndImageContext()
            self.view.backgroundColor = UIColor(patternImage: image)
            
        } else if (mapa == "Trawa"){
            UIGraphicsBeginImageContext(self.view.frame.size)
            
            UIImage(named: "trawa.png")?.draw(in: self.view.bounds)
            let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
            UIGraphicsEndImageContext()
            self.view.backgroundColor = UIColor(patternImage: image)
            
        } else if (mapa == "Ksiezyc"){
            UIGraphicsBeginImageContext(self.view.frame.size)
            
            UIImage(named: "ksiezyc")?.draw(in: self.view.bounds)
            let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
            UIGraphicsEndImageContext()
            self.view.backgroundColor = UIColor(patternImage: image)
            
        }
        else {
            UIGraphicsBeginImageContext(self.view.frame.size)

             UIImage(named: "morze.png")?.draw(in: self.view.bounds)
            let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
            UIGraphicsEndImageContext()
            self.view.backgroundColor = UIColor(patternImage: image)
        }
        
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
