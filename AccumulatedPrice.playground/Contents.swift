import UIKit

struct Food {
    var name: String
    var price: Double
}

class MasterViewController: UITableViewController {

    let foods = [
        Food(name: "Hamburger big mac", price: 15.0),
        Food(name: "Patates", price: 20.0),
        Food(name: "Whopper", price: 25.0),
        Food(name: "Steakhouse", price: 30.0)
    ]

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return foods.count
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let viewController = DetailViewController()
        let food = foods[indexPath.row]
        viewController.title = food.name
        viewController.viewModel.foodPrice = food.price
        navigationController?.pushViewController(viewController, animated: true)
    }
}

struct AccumulatedPrice {
    var quantity: Int
    var foodPrice: Double
}

class DetailViewController: UIViewController {

    private var foodQuantityLabel: UILabel!
    private var foodPriceLabel: UILabel!

    var viewModel = AccumulatedPrice(quantity: 1, foodPrice: 10) {
        didSet {
            let quantity = viewModel.quantity
            let price = viewModel.foodPrice * Double(quantity)
            foodQuantityLabel.text = "\(quantity)"
            foodPriceLabel.text = "\(price)"
        }
    }

    @IBAction private func addQuantity(_ sender: Any) {
        if viewModel.quantity < 30 {
            viewModel.quantity += 1
        }
    }

    @IBAction private func decreasedQuantity(_ sender: Any) {
        if viewModel.quantity > 0 {
            viewModel.quantity -= 1
        }
    }
}
