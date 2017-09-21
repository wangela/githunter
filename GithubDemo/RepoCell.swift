//
//  RepoCell.swift
//  GithubDemo
//
//  Created by Angela Yu on 9/20/17.
//  Copyright © 2017 codepath. All rights reserved.
//

import UIKit


class RepoCell: UITableViewCell {
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var repoNameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var starsLabel: UILabel!
    @IBOutlet weak var forksLabel: UILabel!
    @IBOutlet weak var ownerLabel: UILabel!
    
    var repo: GithubRepo! {
        didSet {
            if let urlString = repo.ownerAvatarURL,
                let url = URL(string: urlString) {
                avatarImageView.setImageWith(url)
            }
            let starString = String(format: "%d", repo.stars ?? 0)
            let forkString = String(format: "%d", repo.forks ?? 0)
            repoNameLabel.text = repo.name
            descriptionLabel.text = repo.repoDescription
            starsLabel.text = starString
            forksLabel.text = forkString
            ownerLabel.text = repo.ownerHandle
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
