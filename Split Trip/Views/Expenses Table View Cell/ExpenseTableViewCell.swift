//
//  ExpenseTableViewCell.swift
//  Split Trip
//
//  Created by Eoin Lavery on 23/10/2019.
//  Copyright © 2019 Seschwan. All rights reserved.
//

import UIKit

class ExpenseTableViewCell: UITableViewCell {

    @IBOutlet weak var expenseNameLabel: UILabel!
    @IBOutlet weak var costLabel: UILabel!
    
    var expense: Expense? {
        didSet {
            updateViews()
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
    
    func updateViews() {
        guard let expense = expense else { return }
        expenseNameLabel.text = expense.expense_name
        costLabel.text = String(expense.total_expense_price)
    }
    
}
