//
//  MemberDetailsViewController.swift
//  OctoTeams
//
//  Created by Sara on 10/22/18.
//  Copyright © 2018 Grne Dev. All rights reserved.
//

import UIKit

class MemberDetailsViewController: UITableViewController {

    var member: TeamMember?
    
    @IBOutlet weak var nameCell: UITableViewCell!
    @IBOutlet weak var teamCell: UITableViewCell!
    @IBOutlet weak var positionCell: UITableViewCell!
    @IBOutlet weak var titleCell: UITableViewCell!
    @IBOutlet weak var experienceCell: UITableViewCell!
    @IBOutlet weak var memberImage: UIImageView!
    @IBOutlet var memberInfo: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setPersonalInfo(member!)
        setImage(member!.MemberImageURL!)
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

    func setPersonalInfo(_ member: TeamMember){
        nameCell.detailTextLabel?.text = member.MemberName
        teamCell.detailTextLabel?.text = member.MemberTeam
        titleCell.detailTextLabel?.text = member.MemberTitle
        positionCell.detailTextLabel?.text = member.MemberPosition
        experienceCell.detailTextLabel?.text = member.MemberExperience
        
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
