//
//  ExpensesVC.swift
//  Split Trip
//
//  Created by Eoin Lavery on 23/10/2019.
//  Copyright © 2019 Seschwan. All rights reserved.
//

import UIKit

class ExpensesVC: UIViewController {

    @IBOutlet weak var expensesTableView: UITableView!
    
    let expenseController = ExpenseController()
    var expensesList: [Expense] = []
    var trip: Trip?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerExpenseTableViewCells()
        loadExpenses()
        expensesTableView.dataSource = self
    }
    
    func loadExpenses() {
        guard let trip = trip,
            let tripId = trip.id else { return }
        expenseController.loadExpensesFromOnlineStore(tripId: tripId, completion: { error in
            if let error = error {
                print("Unable to request expenses: \(error)")
            } else {
                DispatchQueue.main.async {
                    self.expensesList = self.expenseController.expenseResults
                    self.expensesTableView.reloadData()
                }
            }
        })
    }
    
    func registerExpenseTableViewCells() {
        //Registers custom UITableViewCell for use in TripsTableView
        let cell = UINib(nibName: "ExpenseTableViewCell", bundle: nil)
        self.expensesTableView.register(cell, forCellReuseIdentifier: "ExpenseCell")
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension ExpensesVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return expenseController.tripExpenseResults.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = expensesTableView.dequeueReusableCell(withIdentifier: "ExpenseCell") as? ExpenseTableViewCell else { return UITableViewCell() }
        
        cell.expense = expenseController.tripExpenseResults[indexPath.row]
        
        return cell
    }
    
    
}
