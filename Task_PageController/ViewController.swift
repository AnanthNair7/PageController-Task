//
//  ViewController.swift
//  Task_PageController
//
//  Created by Ananth Nair on 04/08/23.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var firstLabel: UILabel!
    @IBOutlet weak var secondLabel: UILabel!
    @IBOutlet weak var thirdlabel: UILabel!
    @IBOutlet weak var fourthlabel: UILabel!
    @IBOutlet weak var imageWaterCan: UIImageView!
    @IBOutlet weak var pageControllerSwipe: UIPageControl!
    
    @IBOutlet weak var skipBtn: UIButton!
    @IBOutlet weak var previousButtonTapped: UIButton!
    @IBOutlet weak var nextButtonTapped: UIButton!
    @IBOutlet weak var donebuttonTapped: UIButton!
    
    
    var firstLabelArray = ["24 Hours Delivery", "purity","success"]
    var secondLabelArray = ["Water 24 reach you within ","water 24 cares your health","thanks for your order"]
    var thirsLabelArray = ["24 Hours" , " we provide pure and mineral rich water", " Health is wealth"]
    var fourthlabelArray = ["your order will be deilvered within 24 hours", " one of the best care ogf hygiene no cans are used more than 20 times  ", "Stay healthy"]
    var imageArray = [#imageLiteral(resourceName: "watercan 1"), #imageLiteral(resourceName: "water"), #imageLiteral(resourceName: "waterglass") ]
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pageControllerSwipe.currentPage = 0
        previousButtonTapped.isHidden = true
        donebuttonTapped.isHidden = true
        firstPageCondition()
        
        // MARK: - Color in text
        
        
        
//        let txt = firstLabelArray[0]
//        print(txt)
//        let colorchange = NSMutableAttributedString(string: txt)
//        let termsRange = (txt as NSString).range(of: "24 Hours")
//        colorchange.addAttribute(.foregroundColor, value: UIColor.red, range: termsRange)
//        firstLabel.attributedText = colorchange
//        print(firstLabel.attributedText!)
        
        //        firstLabelArray[0] = firstLabel.attributedText!.string
        //        print("array \(firstLabelArray[0])"  )
        
        
        //MARK: - SwipeGesture
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(self.responseToSwipeGesture))
        swipeRight.direction = UISwipeGestureRecognizer.Direction.right
        swipeRight.view?.backgroundColor = .brown
        self.view.addGestureRecognizer(swipeRight)
        
        
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(self.responseToSwipeGesture))
        swipeLeft.direction = UISwipeGestureRecognizer.Direction.left
        swipeLeft.view?.backgroundColor = .green
        self.view.addGestureRecognizer(swipeLeft)
        
        
        
        // MARK: - Condition for SwipeGesture
        
        if pageControllerSwipe.currentPage == 0 {
            //            firstLabel.text = firstLabelArray[0]
            //            secondLabel.text =  secondLabelArray[0]
            //            thirdlabel.text = thirsLabelArray[0]
            //            fourthlabel.text = fourthlabelArray[0]
            //            imageWaterCan.image = imageArray[0]
            firstPageCondition()
            
        } else if pageControllerSwipe.currentPage == 1 {
            firstLabel.text =  firstLabelArray[1]
            secondLabel.text =  secondLabelArray[1]
            thirdlabel.text = thirsLabelArray[1]
            fourthlabel.text = fourthlabelArray[1]
            imageWaterCan.image = imageArray[1]
        }  else if pageControllerSwipe.currentPage == 2  {
            firstLabel.text = firstLabelArray[2]
            secondLabel.text =  secondLabelArray[2]
            thirdlabel.text = thirsLabelArray[2]
            fourthlabel.text = fourthlabelArray[2]
            imageWaterCan.image = imageArray[2]
        }
        
    }
    
    
    
    
    
    @objc func responseToSwipeGesture(gesture: UIGestureRecognizer){
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            
            if swipeGesture.direction == UISwipeGestureRecognizer.Direction.right {
                pageControllerSwipe.currentPage = pageControllerSwipe.currentPage - 1
                firstLabel.text = firstLabelArray[pageControllerSwipe.currentPage]
                secondLabel.text = secondLabelArray[pageControllerSwipe.currentPage]
                thirdlabel.text = thirsLabelArray[pageControllerSwipe.currentPage]
                fourthlabel.text = fourthlabelArray[pageControllerSwipe.currentPage]
                imageWaterCan.image = imageArray[pageControllerSwipe.currentPage]
                 
                if   pageControllerSwipe.currentPage == 1 || pageControllerSwipe.currentPage == 0 {
                    skipBtn.isHidden = false
                    nextButtonTapped.isHidden = false
                    donebuttonTapped.isHidden = true
                }
                if pageControllerSwipe.currentPage == 0 {
                    previousButtonTapped.isHidden = true
                    firstPageCondition()
                }
                
            }  else  if  swipeGesture.direction == UISwipeGestureRecognizer.Direction.left {
                if pageControllerSwipe.numberOfPages > pageControllerSwipe.currentPage {
                    print(pageControllerSwipe.currentPage)
                    print(pageControllerSwipe.numberOfPages)
                    pageControllerSwipe.currentPage = pageControllerSwipe.currentPage + 1
                    print(pageControllerSwipe.currentPage)
                    firstLabel.text = firstLabelArray[pageControllerSwipe.currentPage]
                    secondLabel.text = secondLabelArray[pageControllerSwipe.currentPage]
                    thirdlabel.text = thirsLabelArray[pageControllerSwipe.currentPage]
                    fourthlabel.text = fourthlabelArray[pageControllerSwipe.currentPage]
                    imageWaterCan.image = imageArray[pageControllerSwipe.currentPage]
                    
                }
                if   pageControllerSwipe.currentPage == 2 {
                    skipBtn.isHidden = true
                    nextButtonTapped.isHidden = true
                    donebuttonTapped.isHidden = false
                }
                if pageControllerSwipe.currentPage == 1 || pageControllerSwipe.currentPage == 2 {
                    previousButtonTapped.isHidden = false
                    
                }
            }
            
            
        }
        
    }
    
    
    
    @IBAction func skipButtonPressed(_ sender: Any) {
        
        let vc = self.storyboard?.instantiateViewController(identifier: "second") as! SecondViewController
        
        self.present(vc, animated: true)
    }
    
    @IBAction func doneButtonTapped(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(identifier: "second") as! SecondViewController
        
        self.present(vc, animated: true)
        
    }
    
    
    @IBAction func nextbuttonTapped(_ sender: Any) {
        if pageControllerSwipe.numberOfPages > pageControllerSwipe.currentPage {
            pageControllerSwipe.currentPage = pageControllerSwipe.currentPage + 1
            firstLabel.text = firstLabelArray[pageControllerSwipe.currentPage]
            secondLabel.text = secondLabelArray[pageControllerSwipe.currentPage]
            thirdlabel.text = thirsLabelArray[pageControllerSwipe.currentPage]
            fourthlabel.text = fourthlabelArray[pageControllerSwipe.currentPage]
            imageWaterCan.image = imageArray[pageControllerSwipe.currentPage]
            
            if   pageControllerSwipe.currentPage == 2 {
                skipBtn.isHidden = true
                nextButtonTapped.isHidden = true
                donebuttonTapped.isHidden = false
            }
            if pageControllerSwipe.currentPage == 1 || pageControllerSwipe.currentPage == 2 {
                previousButtonTapped.isHidden = false
                
            }
            
        }
        
        
        
    }
    
    
    
    @IBAction func prvButtonTapped(_ sender: Any) {
        if pageControllerSwipe.numberOfPages > pageControllerSwipe.currentPage {
            pageControllerSwipe.currentPage = pageControllerSwipe.currentPage - 1
            firstLabel.text = firstLabelArray[pageControllerSwipe.currentPage]
            secondLabel.text = secondLabelArray[pageControllerSwipe.currentPage]
            thirdlabel.text = thirsLabelArray[pageControllerSwipe.currentPage]
            fourthlabel.text = fourthlabelArray[pageControllerSwipe.currentPage]
            imageWaterCan.image = imageArray[pageControllerSwipe.currentPage]
            
            if   pageControllerSwipe.currentPage == 1 || pageControllerSwipe.currentPage == 0 {
                skipBtn.isHidden = false
                nextButtonTapped.isHidden = false
                donebuttonTapped.isHidden = true
            }
            if pageControllerSwipe.currentPage == 0 {
                previousButtonTapped.isHidden = true
                firstPageCondition()
            }
        }
    }
    func firstPageCondition()  {
        
        // MARK: - Color in text
        
        
        
        let txt = firstLabelArray[0]
      //  print(txt)
        let colorchange = NSMutableAttributedString(string: txt)
        let termsRange = (txt as NSString).range(of: "24 Hours")
        colorchange.addAttribute(.foregroundColor, value: UIColor.red, range: termsRange)
        firstLabel.attributedText = colorchange
       // print(firstLabel.attributedText!)
        
        let txt1 = fourthlabelArray[0]
        print(txt1)
        let colorchange1 = NSMutableAttributedString(string: txt1)
        let termsRange1 = (txt1 as NSString).range(of: "24 hours")
        colorchange1.addAttribute(.foregroundColor, value: UIColor.blue, range: termsRange1)
        fourthlabel.attributedText = colorchange1
        print("fourth :----  \(fourthlabel.attributedText!)")
        
        
        //firstLabel.text = firstLabelArray[0]
        firstLabel.attributedText
        secondLabel.text =  secondLabelArray[0]
        thirdlabel.text = thirsLabelArray[0]
        //fourthlabel.text = fourthlabelArray[0]
        fourthlabel.attributedText
        imageWaterCan.image = imageArray[0]
        
        
    }
    
}
