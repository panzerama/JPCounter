
import UIKit

protocol CountDelegate{
    func perform(_ command: ViewCommand)
}

class ViewController: UIViewController {

    @IBOutlet weak var countdownLabel: UILabel!
    @IBOutlet weak var plusButton: UIButton!
    @IBOutlet weak var minusButton: UIButton!
    
    var kitchen: Kitchen?
    
    var count = 0

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        kitchen = Kitchen(delegate: self)
        countdownLabel.text = "The current count is \(count)"
        kitchen?.receive(event: ViewEvent.viewDidLoad(delegate: self))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func plus(_ sender: UIButton) {
//        count += 1
//        countdownLabel.text = "The current count is \(count)"
        kitchen?.receive(event: ViewEvent.countAdd)
    }
    
    @IBAction func minus(_ sender: UIButton) {
//        count -= 1
//        countdownLabel.text = "The current count is \(count)"
        kitchen?.receive(event: ViewEvent.countSubtract)
    }
}

extension ViewController: CountDelegate {
    func perform(_ command: ViewCommand) {
        switch command {
        case .display(let value):
            countdownLabel.text = value
        }
    }
}
