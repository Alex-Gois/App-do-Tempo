import UIKit

class DailyForecastTableViewCellScreen: UIView {
    
    private lazy var dailyLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 12,weight: .semibold)
        label.textColor = .white
        label.text = "TER"
        return label
    }()
    
    private lazy var cloudImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "cloud2")
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    private lazy var minTemperatureLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 12,weight: .semibold)
        label.textColor = .white
        label.textAlignment = .center
        label.text = "min 25°C"
        return label
    }()
    
    private lazy var maxTemperatureLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 12,weight: .semibold)
        label.textColor = .white
        label.textAlignment = .center
        label.text = "max 25°C"
        return label
    }()
    
    private lazy var stackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [dailyLabel, cloudImageView, minTemperatureLabel, maxTemperatureLabel])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.spacing = 15
        stack.isLayoutMarginsRelativeArrangement = true
        stack.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 12, leading: 30, bottom: 12, trailing: 20)
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
            cloudImageView.widthAnchor.constraint(equalToConstant: 20),
            
            dailyLabel.widthAnchor.constraint(lessThanOrEqualToConstant: 50),
        ])
    }
    
}
