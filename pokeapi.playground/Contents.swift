import UIKit

struct PokemonList: Codable {
    let pokemons: [Pokemon]
}

struct Pokemon: Codable {
    let id: String
    let name: String
    let image: String
    let types: [PokemonType]
    
    enum PokemonType: String, Codable {
        case grass, bug, poison, fire, normal, water, rock, flying, ground
    }
}

extension Pokemon.PokemonType: CustomStringConvertible {
    var description: String {
        return self.rawValue.capitalized
    }
    
    
}

extension Pokemon: CustomStringConvertible {
    var description: String {
        return "\nPokemon: \(self.name.capitalized), com tipos: \(self.types)"
    }
}

class RequestMaker {
    
    enum Endpoint {
        case list
        case details(query: String)
        
        var url: String {
            switch self {
            case .list:
                return "list"
            case let .details(query):
                return "details/\(query)"
            }
        }
    }
    
    let baseUrl = "http://localhost:3000/"
    let session = URLSession.shared
    typealias CompletionCallback<T: Decodable> = (T) -> Void
    
    func make<T: Decodable>(withEndpointUrl endpointUrl: Endpoint, completion: @escaping CompletionCallback<T>) {
        guard let url = URL(string: "\(baseUrl)\(endpointUrl.url)") else {
            return
        }
        
        let dataTask = session.dataTask(with: url) { (data: Data?, response: URLResponse?, error: Error?) in
            
            guard error == nil else {
                print(error!)
                return
            }
            
            guard let data = data else {
                print("nao veio")
                return
            }
            
            do {
                let decodedObject = try JSONDecoder().decode(T.self, from: data)
                
                completion(decodedObject)
            } catch let error {
                print(error)
            }
        }
        
        dataTask.resume()
        
    }
}

let requestMaker = RequestMaker()

requestMaker.make(withEndpointUrl: .list) { (pokemonList: PokemonList) in
    print(pokemonList)
}
requestMaker.make(withEndpointUrl: .details(query: "5")) { (pokemon: Pokemon) in
    print(pokemon)
}
