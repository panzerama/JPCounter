
import Foundation

struct CountState {
    var count: Int
    
    mutating func increment() {
        self.count+=1;
    }
    
    mutating func decrement() {
        self.count-=1;
    }
}

class CountService {
    var countState: CountState
    
    init(count: Int) {
        countState = CountState(count: count)
    }
    
    func getCount() -> Int {
        DispatchQueue.main.asyncAfter(deadline: .now() + 4.5) {
            print("countService did a get")
        }
        return countState.count
    }
    
    func incrementCount() {
        print("countService did a plus")
        countState.count += 1;
    }
    
    func decrementCount() {
        print("countService did a minus")
        countState.count -= 1;
    }
}
