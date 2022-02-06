import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var diceImageView1: UIImageView!
    @IBOutlet weak var diceImageView2: UIImageView!
    @IBOutlet weak var labelRollingTimes: UILabel!
    @IBOutlet weak var rollButton: UIButton!
    var rollingTimes = 0
    var audioPlayer = AVAudioPlayer()
    
    let diceImageCollection = [#imageLiteral(resourceName: "DiceOne"), #imageLiteral(resourceName: "DiceTwo"), #imageLiteral(resourceName: "DiceThree"), #imageLiteral(resourceName: "DiceFour"), #imageLiteral(resourceName: "DiceFive"), #imageLiteral(resourceName: "DiceSix")]
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        diceImageView1.layer.cornerRadius = 20.0
        diceImageView1.layer.masksToBounds = true
        
        diceImageView2.layer.cornerRadius = 20.0
        diceImageView2.layer.masksToBounds = true
        
        labelRollingTimes.text = "Zero"
        
        rollButton.layer.cornerRadius = 20
        rollButton.layer.masksToBounds = true
        
    }
    
    
    @IBAction func rollButtonPressed(_ sender: UIButton) {
        
        playRandomDiceSound()
        imageViewBounceEffect()
        diceImageView1.image = diceImageCollection.randomElement()
        diceImageView2.image = diceImageCollection.randomElement()
        
        rollingTimes += 1
        labelRollingTimes.text = "You've Rolled \(rollingTimes) times"
        
        if rollingTimes > 20 {
            labelRollingTimes.text = "Too much rolling..."
            if rollingTimes > 27 {
                labelRollingTimes.text = "I'm not counting..."
            }
        }
    }
    
    
    func playRandomDiceSound() {
        
        let sounds = ["dice34roll",
                      "dice rolling sound wood surface",
                      "dice"]
        
        guard let sound = sounds.randomElement(),
        let soundURL = Bundle.main.url(forResource: sound, withExtension: "mp3") else { return }
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: soundURL)
        }
        catch {
            print(error)
        }
        audioPlayer.play()
    }
    
    func imageViewBounceEffect() {

        diceImageView1.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)

        UIView.animate(withDuration: 1, delay: 0,
                                   usingSpringWithDamping: 0.25,
                                   initialSpringVelocity: 5,
                                   options: .curveEaseOut,
                                   animations: {

            self.diceImageView1.transform = .identity
        })
        
        diceImageView2.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)

        UIView.animate(withDuration: 1.35, delay: 0,
                                   usingSpringWithDamping: 0.25,
                                   initialSpringVelocity: 5,
                                   options: .curveEaseOut,
                                   animations: {

            self.diceImageView2.transform = .identity
        })
    }
    
    
}

