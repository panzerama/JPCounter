
import Quick
import Nimble
import Spry
import Spry_Nimble

@testable import JPCounter

class KitchenSpec: QuickSpec {
    
    override func spec() {
        var subject: FakeKitchen!
        var viewController: ViewController!
        
        describe("Kitchen tests") {
            beforeEach {
                viewController = UIStoryboard(name: "Main", bundle: nil).instantiateInitialViewController() as! ViewController
                
                subject = FakeKitchen(delegate: viewController)
                subject.stub(.countAdd).andReturn()
                subject.receive(event: ViewEvent.countAdd)
            }
            
            context("when kitchen is passed viewDidLoad") {
                beforeEach {
                    //set up some kind of state here
                }
                it("should send current count to the viewcontroller") {
                    expect(viewController).to(haveReceived(.display, with: "String with Count In"))
                }
            }
        }
    }
}
