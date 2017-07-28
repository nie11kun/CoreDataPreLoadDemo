//
//  FoodTableViewCell.swift
//  coreDataPreloadDemo
//
//  Created by Marco Nie on 27/07/2017.
//  Copyright © 2017 Marco Nie. All rights reserved.
//

import UIKit

class FoodTableViewCell: UITableViewCell {
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var detail: UITextView!
    @IBOutlet weak var price: UILabel!


    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
