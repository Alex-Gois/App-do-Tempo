import Foundation

struct City {
    
    let lat: String
    let lon: String
    let name: String
}

class Service {
    
    private let baseURL: String = "https://api.openweathermap.org/data/3.0/onecall"
    private let apiKey: String = "143565d4dc912ea7c9e46aa44e5a8d67"
    private let session = URLSession.shared
    
    
    func fecthData(city: City, _ completion: @escaping (String) -> Void) {
        let urlString = "\(baseURL)?lat=\(city.lat)&lon=\(city.lon)&appid=\(apiKey)"
        
        guard let url = URL(string: urlString) else { return }
                
        let task = session.dataTask(with: url) {data, response, error in
            completion("Oi")
        }
        
        task.resume()
    }
}
