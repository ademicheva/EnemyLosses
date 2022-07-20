//
//  DayLossesTableViewCell.swift
//  EnemyLosses
//
//  Created by Алина on 20.07.2022.
//

import UIKit

class DayLossesTableViewCell: UITableViewCell {
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var quantityLabel: UILabel!
    
 
    @IBOutlet weak var cellView: UIView!
    
    // cellBackgroundView.layer.cornerRadius = 15
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
      //  cellView.layer.cornerRadius = 10
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    override func layoutSubviews() {
        super.layoutSubviews()

    }
}
