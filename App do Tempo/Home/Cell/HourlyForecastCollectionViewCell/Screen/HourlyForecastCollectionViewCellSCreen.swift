import UIKit

class HourlyForecastCollectionViewCellSCreen: UIView {
    
    private lazy var hourLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 10)
        label.textColor = .white
        label.textAlignment = .center
        label.text = "13:00"
        return label
    }()
    
    private lazy var sunIconImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "sunIcon")
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    private lazy var temperatureLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .white
        label.textAlignment = .center
        label.text = "25°C"
        return label
    }()
    
    private lazy var stackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [hourLabel, sunIconImageView, temperatureLabel])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.layer.borderColor = UIColor.white.cgColor
        stack.layer.borderWidth = 1
        stack.clipsToBounds = true
        stack.layer.cornerRadius = 20
        return stack
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
        addSubview(stackView)
    }
    
    private func setConstraints() {
        
        stackView.pin(To: self)
        
        NSLayoutConstraint.activate([
            sunIconImageView.heightAnchor.constraint(equalToConstant: 33),
        ])
        
    }
    
}
