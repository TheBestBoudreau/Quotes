//
//  DetailQuotesView.swift
//  Quotes
//
//  Created by Tyler Boudreau on 2018-05-23.
//  Copyright © 2018 Tyler Boudreau. All rights reserved.
//

import UIKit
import RealmSwift
class NewQuotesViewController: UIViewController{
    //MARK: PROPERTIES
    @IBOutlet weak var quoteImage: UIImageView!
    @IBOutlet weak var quoteLabel: UILabel!
    
    var quoteStruct = Quotes()
    var imageStruct = Images()
    
    let apiManager = APIManager()
    
    //MARK: ACTIONS
    
    @IBAction func getNewQuotes(_ sender: Any) {
        newQuotes()
    }
    
    @IBAction func getNewImage(_ sender: Any) {
        newImage()
    }


    @IBAction func saveQuote(_ sender: Any) {
        let quotes = QuoteImageObject()
        let realm = try! Realm()
        
        quotes.realmAuthor = quoteStruct.quoteAuthor
        quotes.realmImage = imageStruct.data
        quotes.realmLink = quoteStruct.quoteLink
        quotes.realmSenderLink = quoteStruct.senderLink
        quotes.realmSenderName = quoteStruct.senderName
        quotes.realmText = quoteStruct.quoteText
        
        try! realm.write {
            realm.add(quotes)
        }
        dismiss(animated: true, completion: nil)
    }

    
    
    
    //MARK: CUSTOM FUNCTIONS
    
    func newQuotes(){
        let endPoint = "https://api.forismatic.com/api/1.0/?method=getQuote&lang=en&format=json"
        
        apiManager.fetchQuote(endPoint: endPoint) { (data, error) -> (Void) in
            guard let data = data else {return}
            let decoder = JSONDecoder()
            
            do{
                let quoteJSON = try decoder.decode(Quotes.self, from: data)
                self.quoteStruct = quoteJSON
                
                DispatchQueue.main.async {
                    self.quoteLabel.text = quoteJSON.quoteText
            }
            }catch{
                print("error")
            }
        }
    }
    func newImage(){
        let endPoint = "https://lorempixel.com/400/400/"
        
        apiManager.fetchQuote(endPoint: endPoint) { (data, error) -> (Void) in
            guard let data = data else {return}
            
            self.imageStruct.data = data
            
            DispatchQueue.main.async {
                let image = UIImage(data:data)
                self.quoteImage.image = image
            }
        }
    }
    
}
