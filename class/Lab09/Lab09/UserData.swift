import Foundation
import Combine

class UserData: ObservableObject{
    var cancel: AnyCancellable?
    @Published var users = [User]()
    
    init(){
        // 解碼，讀檔
        if let data = UserDefaults.standard.data(forKey: "users"){
          let decoder = JSONDecoder()
          if let decodedData = try? decoder.decode([User].self, from: data){
            users = decodedData
          }
        }
        // 編碼，存檔
        cancel = $users
            .sink(receiveValue: { (value) in
            let encoder = JSONEncoder()
            if let data = try? encoder.encode(value) {
              UserDefaults.standard.set(data, forKey: "users")
             }
            })
    }
}
