import PlaygroundSupport
/*:
 ### The Stable Matching Game
 On the [previous](@previous), we learned what makes a matching **stable**. Now it's time to test your knowledge and try to find one!
 
 Run this *Page* and start the *Live View* to start the game.
 
 You can create a match by tapping a human and then an animal.
 After you've matched everyone, you will see if you were successful!
 
 Good luck 🍀
 */
let matchings = Matchings(humans: [
    .boy([.rabbit(), .dog()]),
    .woman([.rabbit(), .dog(), .cat()]),
    .girl([.cat(), .dog(), .rabbit()])
    
], animals: [
    .dog([.girl(), .boy(), .woman()]),
    .cat([.woman(), .girl()]),
    .rabbit([.boy(), .girl(), .woman()])
])

matchings.showRankings()

PlaygroundPage.current.setLiveView(MatchingsView(matchings)
                                    .frame(width: 700, height: 300))
/*:
 Did you find one? If not, no worries. On the [Next](@next) page, I will show you an algorithm to **always** find a stable matching!
 */
