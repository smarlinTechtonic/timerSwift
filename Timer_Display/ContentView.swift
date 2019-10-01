// @ObjectBinding allows us to couple with the FancyTimer class and receive changes, which causes the view to re-render.

import SwiftUI

struct ContentView : View {
    
    // ContentView declares an @ObjectBinding variable called fancyTimer, which allows it to subscribe to the FancyTimer class, so it receives any updates. Each time we get a new value, the view will re-render. We COULD have used @State instead of @ObjectBinding and it would work. ex: @State var fancyTimer = FancyTimer(). But we're using @ObjectBinding as that fits this use case better since there are no UI changes that are triggering the re-render.
    @ObjectBinding var fancyTimer = FancyTimer()
    
    var body: some View {
        VStack {
            Text("Elapsed Time: \(fancyTimer.value) Seconds")
        }
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
