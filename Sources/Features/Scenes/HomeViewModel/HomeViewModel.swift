//
//  HomeViewModel.swift
//  Nearby
//
//  Created by Rauls on 31/01/25.
//

import CoreLocation


class HomeViewModel {
    
    private let baseURL = "http://127.0.0.1:3333"
    var userLatitude = -23.561187293883442
    var userLongitude = -46.656451388116494
    var places: [Place] = []
    var filteredPlaces: [Place] = []
    
    var didUpdateCategories: (() -> Void)?
    var didUpdatePlaces: (() -> Void)?
    
    func fecthInitialDate(completion: @escaping (([Category]) -> Void)) {
        fecthCategories { categories in
            completion(categories)
            if let filterByFoodCategory = categories.first(where: {$0.name == "Alimentação"}) {
                self.fetchPlaces(for: filterByFoodCategory.id,
                                 usrLocation: CLLocationCoordinate2D(
                                    latitude: self.userLatitude,
                                    longitude: self.userLongitude))
            }
        }
    }
    
    private func fecthCategories(completion: @escaping ([Category]) -> Void) {
        guard let url = URL(string: "\(baseURL)/categories") else { return }
        
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                print("Erro no api \(error)")
                return
            }
            
            guard let data = data else {
                completion([])
                return
            }
            
            do {
                let categories = try JSONDecoder().decode([Category].self, from: data)
                DispatchQueue.main.async {
                    completion(categories)
                }
            } catch {
                print("Erro ao pegar categorias de data")
                completion([])
            }
        }.resume()
        
    }
    
    
    
    func fetchPlaces(for categoryID: String, usrLocation: CLLocationCoordinate2D) {
        guard let url = URL(string: "\(baseURL)/markets/category/\(categoryID)") else { return }
        
        URLSession.shared.dataTask(with: url) { data, _ , error in
            if let error = error {
                print("Erro no api places \(error)")
            }
            
            guard let data = data else { return }
            
            do {
                self.places = try JSONDecoder().decode([Place].self, from: data)
                DispatchQueue.main.async {
                    self.didUpdatePlaces?()
                }
            } catch {
                print("Erro no fetchPlaces")
            }
            
        }.resume()
        
        
    }
}
