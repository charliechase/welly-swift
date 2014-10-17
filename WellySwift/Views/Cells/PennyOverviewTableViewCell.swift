//
//  PennyOverviewTableViewCell.swift
//  WellySwift
//
//  Created by Matt Nydam on 27/09/14.
//  Copyright (c) 2014 WellyHack. All rights reserved.
//

import UIKit

class PennyOverviewTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var valueLabel: UILabel!
    @IBOutlet weak var progressBar: UIView!
    @IBOutlet weak var currentProgressBar: UIView!
    
    @IBOutlet weak var progressBarWidthConstraint: NSLayoutConstraint!

    var progressWidth:CGFloat = 0.0
    var pennyPot:PennyPot!
        
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func awakeFromNib() {

        super.awakeFromNib()
        
        var progressBarHeight = progressBar.frame.size.height
        currentProgressBar.layer.cornerRadius = progressBarHeight/2
        progressBar.layer.cornerRadius = progressBarHeight/2
    }
    
    func configureWithPennyPot(pot: PennyPot) {
        pennyPot = pot
        titleLabel.text = pennyPot.title
        valueLabel.text = pennyPot.formattedDisplayValue();

        updateConstraints()

    }

    override func prepareForReuse() {
        
        progressBarWidthConstraint.constant = 0
        super.prepareForReuse()
    }
    
    override func updateConstraints() {

        var maxWidth:CGFloat! = contentView.bounds.size.width - 40 // 40 includes our two edge insets. Let's change
        var pennyWidth:CGFloat! = pennyPot.getProgressWidth(maxWidth) // Let's get the width of progress based on our max width

        progressBarWidthConstraint.constant = pennyWidth // Set the width of our constraint. This will reflect in the UI! Cool!
        
        super.updateConstraints()
    }
}
