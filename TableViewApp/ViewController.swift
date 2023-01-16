import UIKit
import SnapKit

class Product {
    var title: String
    var price: String
    var image: UIImage

    init(title: String, price: String, image: UIImage) {
        self.title = title
        self.price = price
        self.image = image
    }
}

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var tableView = UITableView()
    var products = [Product]()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        
        let product1 = Product(title: "Iphone 14", price: "$1400", image: UIImage(named: "product1")!)
        let product2 = Product(title: "Iphone 13", price: "$1000", image: UIImage(named: "product2")!)
        let product3 = Product(title: "Iphone 12", price: "$750", image: UIImage(named: "product3")!)
        let product4 = Product(title: "Iphone 11", price: "$650", image: UIImage(named: "product4")!)
        let product5 = Product(title: "Macbook pro 16", price: "$2800", image: UIImage(named: "product5")!)
        let product6 = Product(title: "Macbook pro 14", price: "$2000", image: UIImage(named: "product6")!)
        let product7 = Product(title: "Macbook pro 13", price: "$1800", image: UIImage(named: "product7")!)
        let product8 = Product(title: "Macbook air", price: "$1400", image: UIImage(named: "product8")!)
        let product9 = Product(title: "Air pods max", price: "$650", image: UIImage(named: "product9")!)
        let product10 = Product(title: "Air pods 2", price: "$150", image: UIImage(named: "product10")!)
        let product11 = Product(title: "Air pods pro", price: "$300", image: UIImage(named: "product11")!)

        products = [product1, product2, product3, product4, product5, product6, product7, product8, product9, product10, product11]

        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }

        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorStyle = .none
        tableView.backgroundColor = UIColor.white

        
        tableView.register(ProductTableViewCell.self, forCellReuseIdentifier: "productCell")
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "productCell", for: indexPath) as! ProductTableViewCell
        let product = products[indexPath.row]
        cell.configure(with: product)
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}

class ProductTableViewCell: UITableViewCell {

    var productImageView = UIImageView()
    var titleLabel = UILabel()
    var priceLabel = UILabel()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.contentView.backgroundColor = UIColor.white
        self.productImageView.contentMode = .scaleAspectFit
        self.titleLabel.font = UIFont.systemFont(ofSize: 14)
        self.priceLabel.font = UIFont.systemFont(ofSize: 14)
        self.priceLabel.textColor = .gray
        
        contentView.addSubview(productImageView)
        productImageView.snp.makeConstraints { make in
        make.left.top.bottom.equalToSuperview().inset(8)
        make.width.height.equalTo(150)
        }
        contentView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.left.equalTo(productImageView.snp.right).offset(8)
            make.top.equalToSuperview().offset(8)
        }

        contentView.addSubview(priceLabel)
        priceLabel.snp.makeConstraints { make in
            make.left.equalTo(productImageView.snp.right).offset(8)
            make.top.equalTo(titleLabel.snp.bottom).offset(4)
        }
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(with product: Product) {
        titleLabel.text = product.title
        priceLabel.text = product.price
        productImageView.image = product.image
    }

    }
