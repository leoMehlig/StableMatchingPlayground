/*:
 # Stable Matchings

 In this **Swift Playground**, I'll present a concept I've learned this semester at university, called **Stable Matchings**.

 But first, let's talk about normal matchings, in particular **bipartite matchings**.

 Imagine you have *3 humans (👦, 👧 and 👩‍💻)* and *3 animals (🐱, 🐶, 🐰)* and want to match them with each other so that each human gets one animal.

 We can visualize all possible matchings by connecting the animals and humans with edges if they can be matched (the boy 👦 is allergic to cats 😿)

 *Run this Page to see the visualizations*
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

matchings

/*:
 A complete matching for the scenario above could be the following (animals and humans with a green edge are matched)
 */
matchings.match(.boy(), with: .dog())
matchings.match(.woman(), with: .cat())
matchings.match(.girl(), with: .rabbit())

matchings
/*:
 Here everyone gets an animal and should be happy, right? But the humans don't like every animal the same (the girl 👧 is a cat person 😺) and the animals also prefer some humans over others...

 We will show these preferences by adding a number to each edge (*1* is the best).
 */
matchings.showRankings()

matchings
/*:
 Now our matching might not seem so good 🙀
 The girl 👧 and the woman 👩‍💻 both got their least favorite choice and, except for the cat 😼, nobody got their first choice.

 Additionally, the girl 👧 and the dog 🐶 could conspire to ditch their match and join forces 🔥

 Thats why this is not a **Stable Matching**. For a matching to be **stable**, there must be no human and animal, who'd rather be matched to each other than their current match.

 So the dog 🐶 and the girl 👧 are currently *blocking* a stable matching. Can you spot another *blocking edge* in our matching?
 */
matchings.calculateBlockingEdges()

matchings
/*:
 So our matching is clearly **not** stable. Continue on the [next](@next) page to try your luck at finding a **stable matching** for this scenario?
 */
