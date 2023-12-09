import UIKit

class HomeScreen: UIView {
    
    lazy var backGroundImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "background")
        image.contentMode = .scaleAspectFit
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
    }
    
    private func setConstraints() {
        backGroundImageView.pin(To: self)
    }
}
