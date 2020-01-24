//
//  MemberDetailsViewController.swift
//  OctoTeams
//
//  Created by Sara on 10/22/18.
//  Copyright © 2018 Grne Dev. All rights reserved.
//

import UIKit

class MemberDetailsViewController: UITableViewController {

    var member: TeamMember!
    
    @IBOutlet weak var nameCell: UITableViewCell!
    @IBOutlet weak var teamCell: UITableViewCell!
    @IBOutlet weak var positionCell: UITableViewCell!
    @IBOutlet weak var titleCell: UITableViewCell!
    @IBOutlet weak var experienceCell: UITableViewCell!
    @IBOutlet weak var memberImage: UIImageView!
    @IBOutlet var memberInfo: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = member.name
        setPersonalInfo(for: member)
        memberInfo.tableFooterView = UIView(frame: CGRect.zero)
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped))
        memberImage.isUserInteractionEnabled = true
        memberImage.addGestureRecognizer(tapGestureRecognizer)
        memberInfo.reloadData()
    }
    
    func setImage(_ imageURL: String) {
        let url = URL(string: imageURL)
        let data = try? Data(contentsOf: url!)
        memberImage.image = UIImage(data: data!)
    }

    func setPersonalInfo(for member: TeamMember){
        nameCell.detailTextLabel?.text = member.name
        teamCell.detailTextLabel?.text = member.team
        titleCell.detailTextLabel?.text = member.title
        positionCell.detailTextLabel?.text = member.position
        experienceCell.detailTextLabel?.text = member.experience
        if let imageUrl = member.imageURL, let url = URL(string: imageUrl), let data = try? Data(contentsOf: url) {
            memberImage.image = UIImage(data: data)
        }
        
    }
    
    @IBAction func imageTapped(sender: UITapGestureRecognizer) {
        let imageView = sender.view as! UIImageView
        let newImageView = UIImageView(image: imageView.image)
        newImageView.frame = UIScreen.main.bounds
        newImageView.backgroundColor = .black
        newImageView.contentMode = .scaleAspectFit
        newImageView.isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissFullscreenImage))
        newImageView.addGestureRecognizer(tap)
        self.view.addSubview(newImageView)
        self.navigationController?.isNavigationBarHidden = true
        self.tabBarController?.tabBar.isHidden = true
    }
    
    @objc func dismissFullscreenImage(sender: UITapGestureRecognizer) {
        self.navigationController?.isNavigationBarHidden = false
        self.tabBarController?.tabBar.isHidden = false
        sender.view?.removeFromSuperview()

    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int ) -> String? {
        let title = "Personal info"
        return title
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }


}
