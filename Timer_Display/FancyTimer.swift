// This is a demo of BindableObject

import Foundation
import SwiftUI
import Combine

// The FancyTimer class conforms to the "BindableObject" protocol and has to implement one property which is the didChange property. This allows other views to bind to this class.
class FancyTimer: BindableObject {
    
    // PassthroughSubject comes from the Combine framework and allows us to publish changes which views watching this class can then utilize.
    let didChange = PassthroughSubject<Int, Never>()
    var value: Int = 0
    
    // Here we are creating a timer, and every one second, we increment the Int value. Then, we invoke the didChange method and broadcast the new value.
    init() {
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { (timer) in
            self.value += 1
            self.didChange.send(self.value)
        }
    }
}
