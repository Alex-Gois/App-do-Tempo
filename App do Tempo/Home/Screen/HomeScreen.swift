import UIKit

class HomeScreen: UIView {
    
    private lazy var backGroundImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "background")
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    private lazy var headerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.clipsToBounds = true
        view.layer.cornerRadius = 20
        view.setCardShadow()
        return view
    }()
    
    private lazy var cityLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 20)
        label.textColor = .blueColorLabel
        label.text = "São Paulo"
        label.textAlignment = .center
        return label
    }()
    
    private lazy var temperatureLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 70,weight: .semibold)
        label.textColor = .blueColorLabel
        label.text = "25°C"
        return label
    }()
    
    private lazy var sunIconImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        image.image = UIImage(named: "sunIcon")
        return image
    }()
    
    private lazy var stackViewBelowToHeaderView: StackViewBelowToHeaderView = {
        let stack = StackViewBelowToHeaderView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private lazy var hourlyForecastLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 12,weight: .semibold)
        label.textColor = .white
        label.text = "PREVISÃO POR HORA"
        label.textAlignment = .center
        return label
    }()
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.showsHorizontalScrollIndicator = false
        collection.backgroundColor = .clear
        collection.contentInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0)
        collection.register(HourlyForecastCollectionViewCell.self, forCellWithReuseIdentifier: HourlyForecastCollectionViewCell.identifier)
        return collection
    }()
    
    public func configCollectionViewProtocols(delegate: UICollectionViewDelegate, dataSource: UICollectionViewDataSource) {
        collectionView.delegate = delegate
        collectionView.dataSource = dataSource
    }
    
    private lazy var nextDaysLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 12,weight: .semibold)
        label.textColor = .white
        label.text = "PROXIMOS DIAS"
        label.textAlignment = .center
        return label
    }()
    
    private lazy var tableView: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.backgroundColor = .clear
        table.register(DailyForecastTableViewCell.self, forCellReuseIdentifier: DailyForecastTableViewCell.identifier)
        return table
    }()
    
    public func configTableViewProtocols(delegate: UITableViewDelegate, dataSource: UITableViewDataSource) {
        tableView.delegate = delegate
        tableView.dataSource = dataSource
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addElements()
        self.setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addElements() {
        addSubview(backGroundImageView)
        addSubview(headerView)
        headerView.addSubview(cityLabel)
        headerView.addSubview(temperatureLabel)
        headerView.addSubview(sunIconImageView)
        addSubview(stackViewBelowToHeaderView)
        addSubview(hourlyForecastLabel)
        addSubview(collectionView)
        addSubview(nextDaysLabel)
        addSubview(tableView)
    }
    
    private func setConstraints() {
        backGroundImageView.pin(To: self)
        
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor,constant: 60),
            headerView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            headerView.widthAnchor.constraint(equalToConstant: 320),
            headerView.heightAnchor.constraint(equalToConstant: 170),
            
            cityLabel.topAnchor.constraint(equalTo: headerView.topAnchor,constant: 15),
            cityLabel.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
            
            temperatureLabel.topAnchor.constraint(equalTo: cityLabel.bottomAnchor,constant: 21),
            temperatureLabel.leadingAnchor.constraint(equalTo: headerView.leadingAnchor,constant: 25),
            temperatureLabel.widthAnchor.constraint(lessThanOrEqualToConstant: 180),
            
            sunIconImageView.centerYAnchor.constraint(equalTo: temperatureLabel.centerYAnchor),
            sunIconImageView.leadingAnchor.constraint(equalTo: temperatureLabel.trailingAnchor,constant: 15),
            sunIconImageView.widthAnchor.constraint(equalToConstant: 86),
            sunIconImageView.heightAnchor.constraint(equalToConstant: 86),
            
            stackViewBelowToHeaderView.StackViewArrangement.topAnchor.constraint(equalTo: headerView.bottomAnchor,constant: 25),
            stackViewBelowToHeaderView.StackViewArrangement.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            hourlyForecastLabel.topAnchor.constraint(equalTo: stackViewBelowToHeaderView.StackViewArrangement.bottomAnchor,constant: 30),
            hourlyForecastLabel.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
            
            collectionView.topAnchor.constraint(equalTo: hourlyForecastLabel.bottomAnchor,constant: 22),
            collectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            collectionView.heightAnchor.constraint(equalToConstant: 85),
            
            nextDaysLabel.topAnchor.constraint(equalTo: collectionView.bottomAnchor,constant: 30),
            nextDaysLabel.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
            
            tableView.topAnchor.constraint(equalTo: nextDaysLabel.bottomAnchor,constant: 30),
            tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}
