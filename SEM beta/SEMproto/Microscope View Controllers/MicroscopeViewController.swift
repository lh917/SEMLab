//
//  MicroscopeViewController.swift
//  SEMproto
//
//  Created by Han on 2020/8/5.
//  Copyright © 2020 Emyr . All rights reserved.
//

import UIKit

class MicroscopeViewController: UIViewController, UIScrollViewDelegate, TextProtocol {

    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var infoButton1: UIButton!
    @IBOutlet weak var contentScrollView: UIScrollView!
    
    @IBOutlet weak var pageControl: UIPageControl!
    
    var breakdownImageTapped = false
    var backIndex = false
    var slides:[Slide] = []
    
    var model = TextModel()
    var modelArray = [Text]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set up texts first
        
        model.delegate = self
        contentScrollView.delegate = self
        
        model.getLocalData()
        updateSlidesText()
        
        slides = createSlides()
        setupSlideScrollView(slides: slides)
        
        pageControl.numberOfPages = slides.count
        pageControl.currentPage = 0
        view.bringSubviewToFront(pageControl)
        
        
    }
    
    
    // MARK: - Segue Transition Method
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     let vc1 = segue.destination as! ViewController
        vc1.backIndex = self.backIndex
    }
    
    // MARK: - TextProtocol Method
    func textRetrived(_ text: [Text]) {
        self.modelArray = text
    }
    
    
    // MARK: - Page Control Methods
    func createSlides() -> [Slide] {

        let slide1:Slide = Bundle.main.loadNibNamed("Slide", owner: self, options: nil)?.first as! Slide
        slide1.slide1TextLabel.text = modelArray[0].paragraphCombined
        
        let slide2:Slide = Bundle.main.loadNibNamed("Slide2", owner: self, options: nil)?.first as! Slide
        slide2.slide2TextLabel.text = modelArray[1].paragraphCombined
        
//        let slide3:Slide = Bundle.main.loadNibNamed("Slide", owner: self, options: nil)?.first as! Slide
        
        return [slide1, slide2]
    }
    
    func updateSlidesText () {
        // Update the texts of each slide using cotents of modelArray
        for text in modelArray {
            
            if text.paragraph1 != nil && text.paragraph2 != nil {
                text.paragraphCombined = text.paragraph1! + "\n" + "\n" + text.paragraph2!
            } else {
                return
            }
            
//            if text.paragraph3 != nil {
//                text.paragraphCombined! += "\n" + "\n" + text.paragraph3!
//            } else {
//                return
//            }
//
//            if text.paragraph4 != nil {
//                text.paragraphCombined! += "\n" + "\n" + text.paragraph4!
//            } else {
//                return
//            }
//
//            if text.paragraph5 != nil {
//                text.paragraphCombined! += "\n" + "\n" + text.paragraph5!
//            }
            
        }
        
    }
    
    func setupSlideScrollView(slides : [Slide]) {
        contentScrollView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
        contentScrollView.contentSize = CGSize(width: view.frame.width * CGFloat(slides.count), height: view.frame.height)
        contentScrollView.isPagingEnabled = true
        
        for i in 0 ..< slides.count {
            slides[i].frame = CGRect(x: view.frame.width * CGFloat(i), y: 0, width: view.frame.width, height: view.frame.height)
            contentScrollView.addSubview(slides[i])
        }
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pageIndex = round(scrollView.contentOffset.x/view.frame.width)
        pageControl.currentPage = Int(pageIndex)
    }

    
    

    
    // MARK: - Button Action Methods
    @IBAction func backButtonTapped(_ sender: Any) {
        
        backIndex = true
        performSegue(withIdentifier: "microscopeBackTrans", sender: self)
        
    }
    
    // When info button 1 is pressed
    @IBAction func infoButton1Tapped(_ sender: Any) {
        
        
        
    }
    
    @IBAction func breakdownButtonTapped(_ sender: Any) {
        
        
        
    }
    
    
}
