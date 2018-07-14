
import Quick
import Nimble

@testable import JPCounter

class ViewControllerSpec: QuickSpec {
    
    override func spec() {
        var subject: ViewController!
        
        describe("ViewController tests") {
            beforeEach {
                subject = UIStoryboard(name: "Main", bundle: nil).instantiateInitialViewController() as! ViewController
                
                _ = subject.view
            }
            
            context("when view is loaded") {
                it("should have a label for the count") {
                    expect(subject.countdownLabel).toNot(beNil())
                }
                it("should present a plus and minus") {
                    expect(subject.plusButton).toNot(beNil())
                    expect(subject.minusButton).toNot(beNil())
                }
            }
        }
    }
}
