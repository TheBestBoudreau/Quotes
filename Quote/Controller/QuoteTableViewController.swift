//
//  ViewController.swift
//  Quotes
//
//  Created by Tyler Boudreau on 2018-05-23.
//  Copyright © 2018 Tyler Boudreau. All rights reserved.
//

import UIKit
import RealmSwift

class QuoteTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    //MARK: PROPERTIES
    
    @IBOutlet var quotesTableView: UITableView!
    var quotes: Results<QuoteImageObject>?
    
    //MARK: VIEW
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let realm = try! Realm()
        quotes = realm.objects(QuoteImageObject.self)
        quotesTableView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: TABLEVIEW METHODS
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return quotes?.count ?? 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = quotesTableView.dequeueReusableCell(withIdentifier: "quotescell", for: indexPath) as? QuotesCell {
            
            guard let quote = quotes?[indexPath.row] else { return cell }
            
            guard let image = quote.realmImage else {return cell}
            
            cell.quotesImageView.image = UIImage(data: image)
            cell.authorLabel.text = quote.realmAuthor
            cell.quoteTextLabel.text = quote.realmText
            
            return cell
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: "quotecell", for: indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "detailview", sender: self)
    }
    
    //MARK: ACTIONS
    @IBAction func createNewQuoteObject(_ sender: Any) {
        performSegue(withIdentifier: "createNewQuotes", sender: self)
    }
    
    //MARK: SEGUE
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let quotes = quotes else {return}
        guard let index = quotesTableView.indexPathForSelectedRow?.row else {return}
        let quote = quotes[index]
        let destination = segue.destination as? QuoteDetailViewController
        destination?.detailQuotes = quote
    }
    
    
}

