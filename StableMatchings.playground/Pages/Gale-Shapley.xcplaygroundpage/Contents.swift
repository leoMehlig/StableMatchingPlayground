import PlaygroundSupport
import Foundation
/*:
 ### Finding a Stable Matching

 Here is an interesting fact: A stable matching **always** exists!

 But how do we find this stable matching? For smaller graphs, this might be easy, but for much bigger graphs it can be very hard, to always find one by hand.

 But luckily we have computers and can use algorithms. In particular the **Gale-Shapely Algorithm**.

 Let's look at a slightly bigger example to understand the algorithm.
 */
let matchings = Matchings(humans: [
    .boy([.dog(), .cat(), .rabbit()]),
    .woman([.dog(), .bird(), .cat(), .rabbit()]),
    .girl([.dog(), .rabbit(), .bird()]),
    .man([.bird(), .rabbit()])

], animals: [
    .cat([.boy(), .woman()]),
    .dog([.girl(), .woman(), .boy()]),
    .rabbit([.woman(), .boy(), .girl(), .man()]),
    .bird([.girl(), .woman(), .man()])
])

matchings.showRankings()
/*:
 ### The Gale-Shapely Algorithm

 The algorithm is also called the **Propose-Reject Algorithm**, as a stable matching is found by the humans repeatedly proposing to the animals and they accepting or rejecting the proposal.

 This is done in three simple steps:
 1. Find a free human, who has not proposed to all animals.
 2. Propose to their favorite, unproposed animal.
 3. The animal accepts if it is not matched yet or prefers the human over their current match. It rejects if their current match is better than the new human.

 Once every human is matched, the algorithm terminates and the matching is **stable**.

 Now run this *Page* to see an animated run-through of this algorithm in the *Live View*!
 */

PlaygroundPage.current.setLiveView(GaleShapleyView(matchings))


DispatchQueue.global().async {
    while let human = matchings.firstFreeHuman(),
          let animal = matchings.firstUnproposedAnimal(for: human) {
        if matchings.propose(human, to: animal) {
            matchings.accepted(human, by: animal)
        } else {
            matchings.rejected(human, by: animal)
        }
    }

    matchings.finished()
}

/*:
 Isn't it amazing how such a simple algorithm can always find a **stable matching**?

 ### Some other facts
 The algorithm is very fast, even for large graphs, as it's in **O(n)**.!

 But both sides aren't equal in this algorithm. The resulting matching it's optimal for the proposing side and pessimal for the receiving side.
 This means, that of all stable matchings, the algorithm will choose the one, which is the best for the humans and the worst for the animals.

 The algorithm is strategy-proof for the proposing side, but not for the receiving. So an animal could get a better match by lying about its preferences.

 One popular use case of stable matchings are school or college admissions. Here all students rank their school choices and schools rank all students (for example based on their grade). Who should be the proposing side in this use case? What do you think?

 ### Thanks You ❤️

 Thanks so much for looking at my *Swift Playground*! I hope you've enjoyed it and might have even learned a new algorithm 😊.

 ~ Leo
 */
