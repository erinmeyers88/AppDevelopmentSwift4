import UIKit
import PlaygroundSupport

let liveViewFrame = CGRect(x: 0, y:0, width: 500, height: 500)
let liveView = UIView(frame: liveViewFrame)
liveView.backgroundColor = .green

PlaygroundPage.current.liveView = liveView

let smallFrame = CGRect(x: 0, y: 0, width: 100, height: 100)
let square = UIView(frame: smallFrame)
square.backgroundColor = .purple

liveView.addSubview(square)

UIView.animate(withDuration: 3.0, animations:  {
    square.backgroundColor = .blue
    square.center = liveView.center
}) {(_) in

    UIView.animate(withDuration: 3.0) {
        square.backgroundColor = .red
        square.frame = smallFrame
    }
}
