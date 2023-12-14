import UIKit

class HomeVC: UIViewController {
    
    private var homeScreen: HomeScreen?
    
    private let service = Service()
    
    override func loadView() {
        homeScreen = HomeScreen()
        view = homeScreen
        
        service.fecthData(city: City(lat: "-23.6944", lon: "-46.5654", name: "São Bernardo")) { message in
            print(message)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        homeScreen?.configCollectionViewProtocols(delegate: self, dataSource: self)
        homeScreen?.configTableViewProtocols(delegate: self, dataSource: self)
    }
}

extension HomeVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HourlyForecastCollectionViewCell.identifier, for: indexPath) as? HourlyForecastCollectionViewCell
        return cell ?? UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 67, height: collectionView.frame.height)
    }
}

extension HomeVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DailyForecastTableViewCell.identifier, for: indexPath) as? DailyForecastTableViewCell
        return cell ?? UITableViewCell()
    }
    
    
}
