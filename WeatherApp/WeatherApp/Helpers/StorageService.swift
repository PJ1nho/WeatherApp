import UIKit
import CoreData

class StorageService {
    
    static let shared = StorageService()
    
    private let viewContext = ((UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext)!
    private let entityName = "CityHistory"
    
    init() { }
    
    func saveCityName(cityName: String) {
        let cityHistory = CityHistory(context: viewContext)
        cityHistory.cityName = cityName
        try? viewContext.save()
    }
    
    func getCityHistory() -> [CityHistory] {
        let cityHistoryRequest = NSFetchRequest<NSFetchRequestResult>(entityName: entityName)
        let cityHistoryItems = try? viewContext.fetch(cityHistoryRequest) as? [CityHistory]
        return cityHistoryItems ?? []
    }
    
    func deleteCity(index: Int) {
        let cityHistoryRequest = NSFetchRequest<NSFetchRequestResult>(entityName: entityName)
        if let cityHistoryItems = try? viewContext.fetch(cityHistoryRequest) as? [CityHistory] {
            viewContext.delete(cityHistoryItems[index])
        }
        try? viewContext.save()
    }
}
