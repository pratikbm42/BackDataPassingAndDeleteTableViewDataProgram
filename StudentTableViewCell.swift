//
//  StudentTableViewCell.swift
//  deleteTableViewProgram
//
//  Created by Mac on 03/01/34.
//

import UIKit

class StudentTableViewCell: UITableViewCell {

    @IBOutlet weak var firstNameLabel: UILabel!
    @IBOutlet weak var middleNameLabel: UILabel!
    @IBOutlet weak var thirdNameLabel: UILabel!
    @IBOutlet weak var rollNoLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
