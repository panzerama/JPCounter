import Foundation
import Spry_Nimble
import Spry
import Quick
import Nimble

@testable import JPCounter

class FakeKitchen: Kitchen, Spryable {
    enum ClassFunction: String, StringRepresentable {
        case empty
    }
    
    enum Function: String, StringRepresentable {
        case countAdd = "countAdd"
        case countSubtract = "countSubtract"
    }
    
    // override func viewDidLoad() {}
    
    override func countAdd() {
        return spryify()
    }
    
    override func countSubtract() {
        return spryify()
    }
}
