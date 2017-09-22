import UIKit
import Arcane

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()

    assert(Hash.MD5("https://www.google.com/logos/doodles/2016/parents-day-in-korea-5757703554072576-hp2x.jpg") == "0dfb10e8d2ae771b3b3ed4544139644e")
    assert(Hash.MD5("https://www.google.com/logos/doodles/2016/parents-day-in-korea-5757703554072576-hp2x.jpg") == "0dfb10e8d2ae771b3b3ed4544139644e")
    assert(Obfuscator(value: "").h.e.l.l.o.value == "hello")
  }
}

