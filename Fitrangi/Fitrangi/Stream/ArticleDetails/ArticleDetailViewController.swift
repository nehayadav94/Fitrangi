//
//  ArticleDetailViewController.swift
//  Fitrangi
//
//  Created by Neha Yadav on 24/06/15.
//  Copyright (c) 2015 Fitrangi. All rights reserved.
//

import UIKit

class ArticleDetailViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var logoView : AsyncImageView!
    @IBOutlet weak var closeLabel : UILabel!
    @IBOutlet weak var tableView : UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        logoView.setImageWithUrl("http://www.fitrangi.com/images/logo.png", options: AsyncImageOptions.ShowAlways)
        logoView.imageView.backgroundColor = UIColor.whiteColor()
        
        closeLabel.text = String.fontAwesomeIconWithName("fa-close")
        closeLabel.font = UIFont.fontAwesomeOfSize(20)
        closeLabel.addSingleTapGestureRecognizer(target: self, action: "dismissView")
        
        tableView.registerNib(UINib(nibName: "ArticleDetailCard", bundle: nil), forCellReuseIdentifier: "ArticleDetailCard")
        tableView.registerNib(UINib(nibName: "ArticleContentView", bundle: nil), forCellReuseIdentifier: "ArticleContentView")
        tableView.registerNib(UINib(nibName: "ArticleCommentsView", bundle: nil), forCellReuseIdentifier: "ArticleCommentsView")
        tableView.registerNib(UINib(nibName: "ArticleCommentsHeaderView", bundle: nil), forHeaderFooterViewReuseIdentifier: "ArticleCommentsHeaderView")
        
        tableView.separatorStyle = UITableViewCellSeparatorStyle.SingleLine
        
        // Do any additional setup after loading the view.
    }
    
    func dismissView() {
        dismissViewControllerAnimated(true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 3
    }

    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 2 {
            return 4
        } else {
            return 1
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCellWithIdentifier("ArticleDetailCard", forIndexPath: indexPath) as! ArticleDetailCard
            return cell
        } else if indexPath.section == 1 {
            let cell = tableView.dequeueReusableCellWithIdentifier("ArticleContentView", forIndexPath: indexPath) as! ArticleContentView
            return cell
        } else {
            let cell = tableView.dequeueReusableCellWithIdentifier("ArticleCommentsView", forIndexPath: indexPath) as! ArticleCommentsView
            return cell
        }
        
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 300
        } else if indexPath.section == 1 {
            return 1200
        } else {
            return 130
        }
    }
    
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 2 {
            var articleHeaderView = tableView.dequeueReusableHeaderFooterViewWithIdentifier("ArticleCommentsHeaderView") as! ArticleCommentsHeaderView
            return articleHeaderView
        }
        return UIView()
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 2 {
            return 40
        } else {
            return 0
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
