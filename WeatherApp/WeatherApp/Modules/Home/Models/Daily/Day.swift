import Foundation

struct Day: Decodable {
    let dateText: String
    let main: MainDay
    
    private enum CodingKeys: String, CodingKey  {
        case dateText = "dt_txt"
        case main = "main"
    }
}
