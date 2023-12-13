import UIKit

class HourlyForecastCollectionViewCell: UICollectionViewCell {
    
    static let identifier: String = "HourlyForecastCollectionViewCell"
    
    private let screen: HourlyForecastCollectionViewCellSCreen = HourlyForecastCollectionViewCellSCreen()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configScreen()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configScreen() {
        contentView.addSubview(screen)
        screen.pin(To: contentView)
    }
}
