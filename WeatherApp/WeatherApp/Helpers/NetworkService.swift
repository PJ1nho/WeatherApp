import UIKit
import Alamofire

final class NetworkService {
    
    static let shared = NetworkService()
    static let apiKey = "a71d347f74fafa9fcd2c403639de58c0"
    
    func fetchWeather(city: String, _ completion: @escaping ((Result<WeatherData, Error>) -> Void)) {
        AF.request("https://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=\(NetworkService.apiKey)",
                   method: .get).responseDecodable(of: WeatherData.self) { response in
            switch response.result {
            case .success(let success):
                completion(.success(WeatherData(weather: success.weather, main: success.main, wind: success.wind, name: success.name)))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
