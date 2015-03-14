import UIKit

class ViewController: UIViewController {
    let circleDrawingView = CircleDrawingView()
    var timer = NSTimer()
    var timerRepeatCounter = 0.0
    var percentageTicker = 0.0
    var animating = false
    
    @IBOutlet weak var percentLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        circleDrawingView.frame = CGRectMake(14, 138, 292, 292)
        view.insertSubview(circleDrawingView, atIndex: 0)
    }
    
    
    @IBAction func reset(sender: UIButton){
        if animating == false{
            animating = true
            timerRepeatCounter = 0
            percentageTicker = 0.0
            startTimer()
            circleDrawingView.setup()
        }
    }
    
    
    func startTimer(){
        timer = NSTimer.scheduledTimerWithTimeInterval(0.02, target:self, selector: Selector("updateLabel"), userInfo: nil, repeats: true)
    }
    
    
    func updateLabel(){
        let percentage = 100.0 * circleDrawingView.endAngleMultiplier!/2
        if timerRepeatCounter % 4 == 0 {
            percentLabel.text = String(format: "%00.1f %%", percentage * percentageTicker)
        }
        timerRepeatCounter += 1
        percentageTicker += 0.01
        if timerRepeatCounter > 100{
            timer.invalidate()
            animating = false
        }
    }
}

