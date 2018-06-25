
import Foundation

enum ViewEvent {
    case viewDidLoad(delegate: ViewController)
    case countAdd
    case countSubtract
}

enum ViewCommand {
    case display(value: String)
}

struct CountState {
    var count: Int
    
    mutating func increment() {
        self.count+=1;
    }
    
    mutating func decrement() {
        self.count-=1;
    }
}

class Kitchen {
    var delegate: ViewController
    
    var countState: CountState = CountState(count: 0)
    
    func receive(event: ViewEvent) {
        switch event {
        case .viewDidLoad(let delegate):
            viewDidLoad(delegate: delegate)
        case .countAdd:
            countAdd()
        case .countSubtract:
            countSubtract()
        }
    }
    
    init(delegate: ViewController) {
        self.delegate = delegate
    }
    
    func viewDidLoad(delegate: ViewController) {
        let displayString = "Count is \(countState.count)"
        self.delegate.perform(.display(value: displayString))
    }
        
    
    func countAdd() {
        countState.increment()
        var displayString = "After countAdd count is \(countState.count)"
        self.delegate.perform(.display(value: displayString))
    }
    
    func countSubtract() {
        countState.decrement()
        var displayString = "After countSubtract count is \(countState.count)"
        self.delegate.perform(.display(value: displayString))
    }
}
