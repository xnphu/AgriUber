//
//  OrderListVC.swift
//  AgriUber
//
//  Created by Nguyen Xuan Phu on 4/1/21.
//  Copyright © 2021 Nguyen Xuan Phu. All rights reserved.
//

import UIKit

class OrderListVC: UIViewController {

    @IBOutlet weak var tblView: UITableView!

    var orderLists = [Order]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tblView.delegate = self
        tblView.dataSource = self
        loadOrderLists()
//        orderView.addShadow(shadowColor: .blue, offSet: CGSize(width: 2.6, height: 2.6), opacity: 0.8, shadowRadius: 5.0, cornerRadius: 20.0, corners: [.bottomRight, .topRight])
    }
    
    func loadOrderLists() {
        orderLists += [
            Order(order_id: "BOK87-K1", date_time: "2020/15/05 15:00", state: "Delivered", start_location: "123 - 333 Nakano City, Tokyo", end_location: "Nakaochiai, Shinjuku City, Tokyo"),
            Order(order_id: "MKU8-444", date_time: "2020/15/05", state: "Transporting", start_location: "Hanoi", end_location: "Hanoi"),
            Order(order_id: "HHH83-00", date_time: "2020/15/05", state: "Finding", start_location: "Hanoi", end_location: "Hanoi"),
        ]
    }
}

extension OrderListVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return orderLists.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "OrderListTableViewCell"
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? OrderListCell else {
            return UITableViewCell()
        }
        
        let order = orderLists[indexPath.row]
        cell.orderIdLabel.text = order.order_id
        cell.dateLabel.text = order.date_time
        cell.stateLabel.text = order.state
        cell.startLocationLabel.text = order.start_location
        cell.endLocationLabel.text = order.end_location
        
        cell.containerView.layer.cornerRadius = 3
        cell.containerView.clipsToBounds = true
        
        // configure state color
        cell.stateView.layer.cornerRadius = 10
        cell.stateView.clipsToBounds = true
        switch order.state {
        case "Delivered":
            cell.stateView.backgroundColor = #colorLiteral(red: 0.9176470588, green: 0.9725490196, blue: 0.9803921569, alpha: 1)
            cell.stateLabel.textColor = #colorLiteral(red: 0.2980392157, green: 0.6901960784, blue: 0.7176470588, alpha: 1)
        case "Transporting":
            cell.stateView.backgroundColor = #colorLiteral(red: 0.9764705882, green: 0.9450980392, blue: 0.9568627451, alpha: 1)
            cell.stateLabel.textColor = #colorLiteral(red: 0.8470588235, green: 0.5098039216, blue: 0.6509803922, alpha: 1)
        case "Finding":
            cell.stateView.backgroundColor = #colorLiteral(red: 0.9450980392, green: 0.9803921569, blue: 0.9490196078, alpha: 1)
            cell.stateLabel.textColor = #colorLiteral(red: 0.3568627451, green: 0.6509803922, blue: 0.3882352941, alpha: 1)
        default:
            cell.stateView.backgroundColor = #colorLiteral(red: 0.9176470588, green: 0.9725490196, blue: 0.9803921569, alpha: 1)
            cell.stateLabel.textColor = #colorLiteral(red: 0.2980392157, green: 0.6901960784, blue: 0.7176470588, alpha: 1)
        }
        
        return cell
    }
    
    
}
