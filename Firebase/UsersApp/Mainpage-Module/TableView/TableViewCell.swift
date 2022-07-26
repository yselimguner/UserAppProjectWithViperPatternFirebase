//
//  TableViewCell.swift
//  UsersApp
//
//  Created by Yavuz Güner on 24.07.2022.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var userInfoLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
