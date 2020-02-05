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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpLabels()
        setUpPersonalInfo()
        setUpGestureRecognizer()
        self.tableView.tableFooterView = UIView(frame: CGRect.zero)
    }
    
    private func setUpLabels() {
        nameCell.textLabel?.text = NSLocalizedString("Common.Name", comment: "")
        titleCell.textLabel?.text = NSLocalizedString("Common.Occupation", comment: "")
        positionCell.textLabel?.text = NSLocalizedString("Common.Position", comment: "")
        experienceCell.textLabel?.text = NSLocalizedString("Common.Experience", comment: "")
    }

    private func setUpPersonalInfo(){
        navigationItem.title = member.name
        nameCell.detailTextLabel?.text = member.name
        titleCell.detailTextLabel?.text = member.title
        positionCell.detailTextLabel?.text = member.position
        experienceCell.detailTextLabel?.text = member.experience
        if let url = URL(string: member.imageURL), let data = try? Data(contentsOf: url) {
            memberImage.image = UIImage(data: data)
        }
    }
    
    private func setUpGestureRecognizer() {
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped))
        memberImage.isUserInteractionEnabled = true
        memberImage.addGestureRecognizer(tapGestureRecognizer)
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
        return NSLocalizedString("Title.PersonalInfo", comment: "")
    }
}
