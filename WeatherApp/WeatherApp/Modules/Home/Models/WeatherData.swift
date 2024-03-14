import Foundation

struct WeatherData: Decodable {
    let main: Main
    let wind: Wind
    let name: String
}
