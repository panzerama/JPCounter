
import Foundation

enum ViewEvent {
    case viewDidLoad(delegate: ViewController)
    case countAdd
    case countSubtract
}

enum ViewCommand {
    case display(value: String)
}

//struct CountState {
//    var count: Int
//
//    mutating func increment() {
//        self.count+=1;
//    }
//
//    mutating func decrement() {
//        self.count-=1;
//    }
//}

class Kitchen {
    var delegate: ViewController
    var countService: CountService
    
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
        self.countService = CountService(count: 0)
    }
    
    func viewDidLoad(delegate: ViewController) {
        let displayString = "Count is \(countService.getCount())"
        self.delegate.perform(.display(value: displayString))
    }
        
    
    func countAdd() {
        countService.incrementCount()
        let displayString = "After countAdd count is \(countService.getCount())"
        self.delegate.perform(.display(value: displayString))
    }
    
    func countSubtract() {
        countService.decrementCount()
        let displayString = "After countSubtract count is \(countService.getCount())"
        self.delegate.perform(.display(value: displayString))
    }
}
