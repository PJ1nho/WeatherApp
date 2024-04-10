import UIKit
import Alamofire

final class NetworkService {
    
    static let shared = NetworkService()
    private let apiKey = "a71d347f74fafa9fcd2c403639de58c0"
    
    private init() { }
    
    func fetchWeather(city: String, _ completion: @escaping ((Result<WeatherData, Error>) -> Void)) {
        AF.request("https://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=\(apiKey)",
                   method: .get).responseDecodable(of: WeatherData.self) { response in
            switch response.result {
            case .success(let success):
                completion(.success(WeatherData(weather: success.weather, main: success.main, wind: success.wind, name: success.name)))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func fetchWeatherDay(city: String, _ completion: @escaping ((Result<List, Error>) -> Void)) {
        AF.request("http://api.openweathermap.org/data/2.5/forecast?q=\(city)&appid=\(apiKey)",
                   method: .get).responseDecodable(of: List.self) { response in
            switch response.result {
            case .success(let success):
                completion(.success(List(list: success.list)))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
