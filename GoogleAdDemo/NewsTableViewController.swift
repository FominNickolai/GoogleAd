//
//  NewsTableViewController.swift
//  GoogleAdDemo
//
//  Created by Simon Ng on 29/10/2016.
//  Copyright © 2016 AppCoda. All rights reserved.
//

import UIKit
import GoogleMobileAds

class NewsTableViewController: UITableViewController {
    
    //ADBannerView
    lazy var adBannerView: GADBannerView = {
        let adBannerView = GADBannerView(adSize: kGADAdSizeSmartBannerPortrait)
        adBannerView.adUnitID = "ca-app-pub-4078481930491067/3412814171"
        adBannerView.delegate = self
        adBannerView.rootViewController = self
        return adBannerView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        let request = GADRequest()
        request.testDevices = ["06350ca62503671d46e2f7a6a8c68e02"]
        adBannerView.load(request)

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // Return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Return the number of rows
        return 4
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! NewsTableViewCell
        
        // Configure the cell...
        if indexPath.row == 0 {
            cell.postImageView.image = UIImage(named: "red-lights-lisbon")
            cell.postTitle.text = "Red Lights, Lisbon"
            cell.postAuthor.text = "TOM EVERSLEY (@tomeversley)"
            cell.authorImageView.image = UIImage(named: "appcoda-fav-logo")
            
        } else if indexPath.row == 1 {
            cell.postImageView.image = UIImage(named: "val-throrens-france")
            cell.postTitle.text = "Val Thorens, France"
            cell.postAuthor.text = "BARA ART (bara-art.com)"
            cell.authorImageView.image = UIImage(named: "appcoda-fav-logo")
            
        } else if indexPath.row == 2 {
            cell.postImageView.image = UIImage(named: "summer-beach-huts")
            cell.postTitle.text = "Summer Beach Huts, England"
            cell.postAuthor.text = "TOM EVERSLEY (@tomeversley)"
            cell.authorImageView.image = UIImage(named: "appcoda-fav-logo")
            
        } else {
            cell.postImageView.image = UIImage(named: "taxis-nyc")
            cell.postTitle.text = "Taxis, NYC"
            cell.postAuthor.text = "TOM EVERSLEY (@tomeversley)"
            cell.authorImageView.image = UIImage(named: "appcoda-fav-logo")
            
        }
        
        return cell
    }

}

//MARK: - GADBannerViewDelegate
extension NewsTableViewController: GADBannerViewDelegate {
    func adViewDidReceiveAd(_ bannerView: GADBannerView) {
        print("Banner loaded successully")
        
        //Reposition the banner ad to create a slide down effect
        let translateTransform = CGAffineTransform(translationX: 0, y: bannerView.bounds.size.height)
        bannerView.transform = translateTransform
        
        UIView.animate(withDuration: 0.5) {
            self.tableView.tableHeaderView?.frame = bannerView.frame
            bannerView.transform = CGAffineTransform.identity
            self.tableView.tableHeaderView = bannerView
        }
    }
    
    func adView(_ bannerView: GADBannerView, didFailToReceiveAdWithError error: GADRequestError) {
        print("Fail to receive ads")
        print(error)
    }
}





















