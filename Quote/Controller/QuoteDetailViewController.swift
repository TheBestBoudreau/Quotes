//
//  QuoteDetailViewController.swift
//  Quotes
//
//  Created by Tyler Boudreau on 2018-05-23.
//  Copyright © 2018 Tyler Boudreau. All rights reserved.
//

import UIKit

class QuoteDetailViewController: UIViewController{
    
    //MARK: PROPERTIES
    @IBOutlet weak var quoteImageView: UIImageView!
    @IBOutlet weak var quoteText: UILabel!
    @IBOutlet weak var authorText: UILabel!
    @IBOutlet weak var linkText: UILabel!
    
    var detailQuotes = QuoteImageObject()
    
    //MARK: VIEW
    override func viewDidLoad() {
        super.viewDidLoad()
        
        authorText.text = detailQuotes.realmAuthor
        quoteText.text = detailQuotes.realmText
        linkText.text = detailQuotes.realmLink
        
        guard let image = detailQuotes.realmImage else {return}
        quoteImageView.image = UIImage(data: image)
        
    }
    
    //MARK CUSTOM FUNCTIONS
    
    func shareQuote(){
        let image = snapShot()
        
        guard let jpeg = UIImageJPEGRepresentation(image, 1.0) else {return}
        let activityViewController = UIActivityViewController(activityItems: [jpeg], applicationActivities: [])
        present(activityViewController, animated: true, completion: nil)
    }
    
    
    func snapShot() -> UIImage {
        var image = UIImage()
        
        UIGraphicsBeginImageContextWithOptions(view.bounds.size, true, 0)
        self.view.drawHierarchy(in: view.bounds, afterScreenUpdates: true)
        guard let newImage = UIGraphicsGetCurrentContext()?.makeImage() else {return image}
        UIGraphicsEndImageContext()
        
        image = UIImage(cgImage: newImage)
        return image
    }
    
    //MARK: ACTION

    @IBAction func shareButton(_ sender: Any) {
        shareQuote()
    }
    
    
    
}
