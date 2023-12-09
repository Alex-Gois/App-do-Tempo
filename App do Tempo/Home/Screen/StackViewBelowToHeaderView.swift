import UIKit

class StackViewBelowToHeaderView: UIView {
    
    lazy var humidityLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
        label.text = "Umidade"
        label.textColor = .white
        return label
    }()
    
    lazy var humidityValueLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
        label.text = "1000mm"
        label.textColor = .white
        return label
    }()
    
    lazy var humidityStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [humidityLabel, humidityValueLabel])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.spacing = 30
        return stack
    }()
    
    lazy var windLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
        label.text = "Vento"
        label.textColor = .white
        return label
    }()
    
    lazy var windValueLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
        label.text = "10km/h"
        label.textColor = .white
        return label
    }()
    
    lazy var windStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [windLabel, windValueLabel])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.spacing = 30
        return stack
    }()
    
    lazy var StackViewArrangement: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [humidityStackView, windStackView])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = 5
        stack.backgroundColor = .stackViewColor
        stack.isLayoutMarginsRelativeArrangement = true
        stack.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 14, leading: 22, bottom: 14, trailing: 22)
        stack.clipsToBounds = true
        stack.layer.cornerRadius = 10
        return stack
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addElements()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addElements() {
        addSubview(StackViewArrangement)
    }
}
