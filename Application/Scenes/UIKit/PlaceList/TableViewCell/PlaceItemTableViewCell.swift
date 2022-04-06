//
//  PlaceItemTableViewCell.swift
//  Application
//
//  Created by Bùi Văn Thuyên on 05/04/2022.
//

import UIKit
import Domain

class PlaceItemTableViewCell: UITableViewCell {
    
    @IBOutlet weak var coverImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    
    func bindModel(model: Place) {
        coverImageView.googleImage(reference: model.photos?.first?.photoReference,
                                   maxWidth: Int(self.width))
        nameLabel.text = model.name
        addressLabel.text = model.vicinity
    }
    
}
