//
//  SampleViewController.swift
//  SEMproto
//
//  Created by Emyr  on 04/08/2020.
//  Copyright © 2020 Emyr . All rights reserved.
//

import UIKit

class SampleViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    let model = ZoomModel()
       
    //delaring variables to be used
       var zoomButtonList = [Zoom]()
       var backIndex = false
       var whichButton = Int()
       var whichSample = Int()
       var firstIndex:IndexPath = [0, 0]
       var whichPrev = 0
       
       
    @IBOutlet weak var zoomButtonCollectionView: UICollectionView!
    
    @IBOutlet weak var samplePicture: UIImageView!
    
    @IBOutlet weak var sampleInfoLabel: UILabel!
    
    @IBOutlet weak var backButton: UIButton!
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var hideButton: UIButton!
    
    @IBOutlet weak var scale: UIImageView!
    
    @IBOutlet weak var scaleLabel: UILabel!
    
    @IBOutlet weak var locatorImage: UIImageView!
    
    @IBOutlet weak var locatorTracker: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        zoomButtonList = model.getZooms(index: whichSample)
               
               //lets user tap on screen to undo hide button
               let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
               samplePicture.isUserInteractionEnabled = true
               samplePicture.addGestureRecognizer(tapGestureRecognizer)
               
               
               //initial view image based on sample that user selected
               samplePicture.image = UIImage(named: samplesFakeDB.sampleArray[whichSample][0]["image"]!)
               
               //initial info label based on sample that user selected. REMEMBER! initial view is most zoomed out one i.e. index 0
               sampleInfoLabel.text = "Sample: \(samplesFakeDB.sampleArray[whichSample][0]["name"]!). View: x\(samplesFakeDB.sampleArray[whichSample][0]["mag"]!)."
               
               //initial scale size
               scaleLabel.text = samplesFakeDB.sampleArray[whichSample][0]["scale"]!
               let sFactor = samplesFakeDB.sampleArray[whichSample][0]["scsz"]!
               let sF = Float(sFactor)
               let sF2 = CGFloat(sF!)
               scale.transform = CGAffineTransform.identity
               scale.transform = CGAffineTransform(scaleX: sF2, y: sF2)
               
               //initial locator background. Most zoomed out view of the sample
               locatorImage.image = UIImage(named: samplesFakeDB.sampleArray[whichSample][0]["image"]!)
               
               //initial locator tracker size. Should be 100% of locator image size
               locatorTracker.image = UIImage(named: "white background")
               locatorTracker.transform = CGAffineTransform.identity
               
               //set view controller as datasource and delegate of collection view
               zoomButtonCollectionView.dataSource = self
               zoomButtonCollectionView.delegate = self
               
               //add in initial icon labels and buttons for initial view
               self.addIcon(index: whichSample, index2: 0)
        
        // Style the buttons
        backButton.layer.cornerRadius = 20
        hideButton.layer.cornerRadius = 20
    }
    

   
    //MARK: - collection view fuckery
       func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
           //return number of zooms for the collection view
           return samplesFakeDB.sampleArray[whichSample].count
               
        }
       
       func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
           
               let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "zoomButton", for: indexPath) as! ZoomButtonCollectionViewCell
               
               //return it
               cell.layer.cornerRadius = 20
               return cell
         }
       
       func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
           
               //configure the state of the cell based on the properties of the button that it represents
               let zoomButton = cell as? ZoomButtonCollectionViewCell
               
               //get the button from the zoom array
               let thing = zoomButtonList[indexPath.row]
               
               //configure it
               zoomButton?.configureCell(zoom: thing, index: whichSample)
           
           
       }
       
       func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
           
               //get a reference to the cell that was tapped
               let selectedZoomButton = collectionView.cellForItem(at: indexPath) as? ZoomButtonCollectionViewCell
               
               //does some funky stuff when a button is tapped. Creates a variable to record which button was tapped
               for j in 0...(samplesFakeDB.sampleArray[whichSample].count-1) {
                   if (selectedZoomButton?.zoomButtonLabel.text == "x\(samplesFakeDB.sampleArray[whichSample][j]["mag"]!)") {
                       whichButton = j
                   }
               }
               
               //change info label for the new view
               sampleInfoLabel.text = "Sample: \(samplesFakeDB.sampleArray[whichSample][whichButton]["name"]!). View: x\(samplesFakeDB.sampleArray[whichSample][whichButton]["mag"]!)."
               
               //change image for the new view
               samplePicture.image = UIImage(named: samplesFakeDB.sampleArray[whichSample][whichButton]["image"]!)
               
               //change scale size
               scaleLabel.text = samplesFakeDB.sampleArray[whichSample][whichButton]["scale"]!
               let sFactor = samplesFakeDB.sampleArray[whichSample][whichButton]["scsz"]!
               let sF = Float(sFactor)
               let sF2 = CGFloat(sF!)
               scale.transform = CGAffineTransform.identity
               scale.transform = CGAffineTransform(scaleX: sF2, y: sF2)
               //change back image of locator
               self.changeLocatorImage()
               
               //change size and position of locator tracker
               if whichButton == 0 {
                   locatorTracker.transform = CGAffineTransform.identity
               }
               else if whichButton != 0 {
                   locatorTracker.transform = CGAffineTransform.identity
                   let mgNow = Float(samplesFakeDB.sampleArray[whichSample][whichButton]["mag"]!)
                   let mgPrev = Float(samplesFakeDB.sampleArray[whichSample][whichButton-1]["mag"]!)
                   let mgRatio = mgPrev! / mgNow!
                   let mgR = CGFloat(mgRatio)
                   locatorTracker.transform = CGAffineTransform(scaleX: mgR, y: mgR)
               }
               
               //change color of selected zoom button to indicate which zoom is viewed
               //one button should already be blue. Make new one blue and switch old one back
               let prevZoomButton = collectionView.cellForItem(at: firstIndex) as? ZoomButtonCollectionViewCell
               prevZoomButton?.zoomButtonLabel.backgroundColor = UIColor.white
               selectedZoomButton?.zoomButtonLabel.backgroundColor = UIColor(red: 0/255, green: 140/255, blue: 186/255, alpha: 1)
               firstIndex = indexPath
           
           
               //remove old icon labels/buttons and add new ones depending on which view was chosen
           self.removeIcon(index: whichSample, index2: whichPrev)
           self.addIcon(index: whichSample, index2: whichButton)
           
           
               //reset previous tracker so can be used to disable icons when next button tapped
               whichPrev = whichButton
         }
       
       
       
       
       
       
       
       
       // MARK: - tappy stuff
       
       //segue to return to menu screen
       
    @IBAction func returnToMenuScreen(_ sender: Any) {
        backIndex = true
        performSegue(withIdentifier: "backToMenu", sender: self)
    }
    
       
       override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc1 = segue.destination as! ViewController
           vc1.backIndex = self.backIndex
       }
       
       //triggers showing of elements when screen is tapped
       @objc func imageTapped(tapGestureRecognizer: UITapGestureRecognizer)
       {
        _ = tapGestureRecognizer.view as! UIImageView
           if sampleInfoLabel.isHidden == true {
               sampleInfoLabel.isHidden = false
               zoomButtonCollectionView.isHidden = false
               scale.isHidden = false
               scaleLabel.isHidden = false
               locatorImage.isHidden = false
               locatorTracker.isHidden = false
               backButton.isHidden = false
               hideButton.isHidden = false
               for i in 0...(samplesInfoDB.infoArray[whichSample][whichButton].count - 1) {
                   let newtag2 = i+200//for buttons. Have to do funny flow control with tags. Bit complicated lol
                   if let viewWithTag = self.scrollView.viewWithTag(newtag2) {
                       viewWithTag.isHidden = false
                   }
               }
           }
       }
       
       //triggers hiding of elements when hide button is tapped
    @IBAction func hideButtonTapped(_ sender: Any) {
        self.hideElements()
    }
    
       //hides elements so user can take a screenshot when they want
       func hideElements() {
           if sampleInfoLabel.isHidden == false {
               sampleInfoLabel.isHidden = true
               zoomButtonCollectionView.isHidden = true
               scale.isHidden = true
               scaleLabel.isHidden = true
               locatorImage.isHidden = true
               locatorTracker.isHidden = true
               backButton.isHidden = true
               hideButton.isHidden = true
               for i in 0...(samplesInfoDB.infoArray[whichSample][whichButton].count - 1) {
                   let newtag = i+100//for labels
                   if let viewWithTag = self.scrollView.viewWithTag(newtag) {
                       viewWithTag.isHidden = true
                   }
                   let newtag2 = i+200//for buttons
                   if let viewWithTag = self.scrollView.viewWithTag(newtag2) {
                       viewWithTag.isHidden = true
                   }
                   
               }
           }
           
       }
       
       
       
     
       //function to show next view out in the locator
       func changeLocatorImage() {
           if whichButton == 0 {
               locatorImage.image = UIImage(named: samplesFakeDB.sampleArray[whichSample][0]["image"]!)
           }
           else if whichButton != 0 {
               let whichLImage = whichButton-1
               locatorImage.image = UIImage(named: samplesFakeDB.sampleArray[whichSample][whichLImage]["image"]!)
           }
       }
       
       //function to add new info buttons and labels. Also sets style of labels and buttons. Very lengthy as it's essentially adding and styling storyboard elements programmatically!!!
       func addIcon(index:Int, index2:Int) {
           for i in 0...(samplesInfoDB.infoArray[index][index2].count - 1) {
               var newButton: UIButton!
               var newLabel: UILabel!
               newButton = UIButton()
               newLabel = UILabel()
               newLabel.translatesAutoresizingMaskIntoConstraints = true
               newLabel.textAlignment = .left
               newLabel.backgroundColor = UIColor .white
               newLabel.font = UIFont.systemFont(ofSize: 24.0)
               newLabel.numberOfLines = 0
               newLabel.text = samplesInfoDB.infoArray[whichSample][whichButton][i]["info"]!
               let width = CGFloat(200.0)
               let height = CGFloat(50.0)
               let X = Float(samplesInfoDB.infoArray[whichSample][whichButton][i]["X"]!)!
               let Y = Float(samplesInfoDB.infoArray[whichSample][whichButton][i]["Y"]!)!
               let frame = CGRect(x:CGFloat(X + 50) , y:CGFloat(Y + 50) , width:width, height:height)
               newLabel.frame = frame
               newLabel.sizeToFit()
               newLabel.setContentHuggingPriority(UILayoutPriority(rawValue: 1), for: .vertical)
               let newtag = i+100 //for labels
               newLabel.tag = newtag
               newLabel.isHidden = true
               let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissInfoLabel(tapGestureRecognizer:)))
               newLabel.isUserInteractionEnabled = true
               newLabel.addGestureRecognizer(tapGestureRecognizer)
               scrollView.addSubview(newLabel)
               newButton.translatesAutoresizingMaskIntoConstraints = true
               newButton.backgroundColor = UIColor .clear
               newButton.setTitle("INFO", for: .normal)
               newButton.setImage(UIImage(named: "icon"), for: .normal)
               newButton.imageView?.contentMode = .scaleAspectFit
               let w2 = CGFloat(50.0)
               let h2 = CGFloat(50.0)
               let f2 = CGRect(x:CGFloat(X) , y:CGFloat(Y) , width:w2, height:h2)
               newButton.frame = f2
               newLabel.setContentHuggingPriority(UILayoutPriority(rawValue: 1), for: .vertical)
               let newtag2 = i+200//for buttons
               newButton.tag = newtag2
               newButton.addTarget(self, action: #selector(toggleInfoLabel(_ :)), for: .touchUpInside)
               scrollView.addSubview(newButton)
           }
       }
       
       //function to remove info buttons and labels
       func removeIcon(index:Int, index2:Int) {
           for i in 0...(samplesInfoDB.infoArray[index][index2].count - 1) {
               let newtag = i+100//for labels
               if let viewWithTag = self.scrollView.viewWithTag(newtag) {
                   viewWithTag.removeFromSuperview()
               }
               let newtag2 = i+200//for buttons
               if let viewWithTag = self.scrollView.viewWithTag(newtag2) {
                   viewWithTag.removeFromSuperview()
               }
           }
       }
    
       //hides or shows icon info label to tell user information about the sample
       @objc func toggleInfoLabel(_ sender:UIButton!) {
           let buttonTag = sender.tag
           let newtag = buttonTag - 100
           if let viewWithTag = self.scrollView.viewWithTag(newtag) {
               if viewWithTag.isHidden == false {
                   viewWithTag.isHidden = true
               }
               else if viewWithTag.isHidden == true {
                   viewWithTag.isHidden = false
               }
           }
       }
       
       //alternative label hiding method via tapping on the label itself
       @objc func dismissInfoLabel(tapGestureRecognizer: UITapGestureRecognizer)
       {
           let tappedLabel = tapGestureRecognizer.view as! UILabel
           tappedLabel.isHidden = true
       }
       
       
       
       

       

    

}
