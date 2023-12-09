import UIKit

class HomeScreen: UIView {
    
    lazy var backGroundImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "background")
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    lazy var headerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.clipsToBounds = true
        view.layer.cornerRadius = 20
        view.setCardShadow()
        return view
    }()
    
    lazy var cityLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 20)
        label.textColor = .blueColorLabel
        label.text = "São Paulo"
        label.textAlignment = .center
        return label
    }()
    
    lazy var temperatureLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 70,weight: .semibold)
        label.textColor = .blueColorLabel
        label.text = "25°C"
        return label
    }()
    
    lazy var sunIconImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        image.image = UIImage(named: "sunIcon")
        return image
    }()

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
            temperatureLabel.trailingAnchor.constraint(equalTo: headerView.trailingAnchor),
            
            sunIconImageView.centerYAnchor.constraint(equalTo: temperatureLabel.centerYAnchor),
            sunIconImageView.leadingAnchor.constraint(equalTo: temperatureLabel.trailingAnchor,constant: -15),
            sunIconImageView.widthAnchor.constraint(equalToConstant: 86),
            sunIconImageView.heightAnchor.constraint(equalToConstant: 86),
        ])
    }
}
