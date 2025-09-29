---
aliases: 
tags:
  - cs/leetcode/medium
  - cs/dsa/dp
edited: 2025-09-23T15:56
created: 2025-07-23T18:42:00
---
# Problem:
You have two soups, **A** and **B**, each starting with `n` mL. On every turn, one of the following four serving operations is chosen _at random_, each with probability `0.25` **independent** of all previous turns:

- pour 100 mL from type A and 0 mL from type B
- pour 75 mL from type A and 25 mL from type B
- pour 50 mL from type A and 50 mL from type B
- pour 25 mL from type A and 75 mL from type B

**Note:**

- There is no operation that pours 0 mL from A and 100 mL from B.
- The amounts from A and B are poured _simultaneously_ during the turn.
- If an operation asks you to pour **more than** you have left of a soup, pour all that remains of that soup.

The process stops immediately after any turn in which _one of the soups_ is used up.

Return the probability that A is used up _before_ B, plus half the probability that both soups are used up in the **same turn**. Answers within `10-5` of the actual answer will be accepted.

#### Bounds


#### Examples


---
# Notes:
Apparently this is a Google problem, and boy do I believe that.
- It's weird and quirky
- It's DP
- They have a hidden trap with large $n$ input values.

---
# Attempts:

##### Attempt 1
independent actions? this is a DP problem isn't it.

Okay so this is indeed [[Dynamic Programming]], and it's quite nice in the sense that we have clear states (A, B), actions (soup stuff), and transitions (0.25 between each soup). We also have a clear 2D memo.

This means our standard cookie-cutter DP should work fairly easily.

- Initially, I was doing bottom up? DP in the sense that we were were adding +25 or +100 to a/b states.
- This is WRONG AND BAD because one of the conditions is that if we run out of soup we pour out all the soup.
- Thus, our bounds are actually if soup values are at most 0

- Other thing to point out: instead of going through the memo and checking all values where a/b end, why not make it so that the result of the DP function is the actual REWARD THE PROBLEM WANTS? i.e., 0.5 probability points for if A, B tie.

#### Attempt 2
Okay, so I didn't check the bounds. Turns out, because it's Google and they like challenging you, that the upper bound is $10^9$ which means that our recursion stack is too tall.

We know that the only way for soup B to empty before soup A is for us to repeatedly get unlucky and choose option 4, to the point where it overwhelms options 1/2. 
- By a [[Law of Large Numbers]] like argument, the higher our number of soupings the less likely this is to occur.
- I don't know the exact value where this cutoff happens.
- I tried to do maths but gave up and said 5000 and we return within the tolerance.
- I believe there are some [math proofs](https://leetcode.com/problems/soup-servings/solutions/195582/a-mathematical-analysis-of-the-soup-servings-problem/?envType=daily-question&envId=2025-08-08) out there for showing the true value is more like 5650 for p=1?

---
# Solution:

This was a really fun problem which we solved pretty quickly admittedly with some checks, so I'm quite pleased at my DP here.

```python
class Solution:

    def soupServings(self, n: int) -> float:

        # two soups, A, B starting at same # (n) ml
        # four random choices equal prob INDEPENDENT
        # CRAP THIS IS DP ACTIONS
        # 1. -100ml from A
        # 2. -75ml from A, -25ml from B
        # 3. -50ml from A, -50ml from B
        # 4. -25ml from A, -75ml from B

        # if we run out of soup, we pour all the dang soup.
        # we stop once ANY SOUP is USED UP

        # what's the probability that A is used up before B?
        # p(A <=0 before B) + 0.5 * P(same turn)

        # note that a probability is just counts divided by total count

        # ... oh dear we also have an issue with 10^9 as input
        # we need to figure out a way to handle very very large values
        # current solution with DP breaks recursion stack.
        # I'm pretty sure that there is some limiting behaviour somewhere
        # how do I know the limit?

        # the only way that A loses the race is when we pick option 4 repeatedly
        # #(d) .25 > .5 #(A) + #(B) -> 0
        # ehhh it's close enough in the limit to 1.

		# push it to the limit
        if n > 5000:
            return 1-0.00001

        # we memo (A, B) -> probability?
        memo: dict[tuple[int, int], float] = {}

        def get_probability_points_of_state(a: int, b: int) -> float:
            """Given the STATE of a, b in ml, return the probability of getting that state."""

            # base case
            if a <= 0 and b <= 0:
                # we start here
                return 0.5  # half a point for this

            if a <= 0 and b > 0:
                return 1  # full points for this case

            if b <= 0 and a > 0:
                return 0  # nil poi

            # memo case
            if (a, b) in memo:
                return memo[(a,b)]

            # recurrence relation
            # PRE
            # RECUR
            p_route1 = 0.25 * get_probability_points_of_state(a-100, b)
            p_route2 = 0.25 * get_probability_points_of_state(a-75, b-25)
            p_route3 = 0.25 * get_probability_points_of_state(a-50, b-50)
            p_route4 = 0.25 * get_probability_points_of_state(a-25, b-75)

            # p(a, b) =
            # 0.25 * p(a-100, b) +
            # 0.25 * p(a-75, b-25) +
            # 0.25 * p(a-50, b-50) +
            # 0.25 * p(a-25, b-75)

            # POST
            prob = p_route1 + p_route2 + p_route3 + p_route4
            memo[(a, b)] = prob

            # RETURN
            return prob

        total_probs = get_probability_points_of_state(n, n)
        return total_probs
```

----
# Source:
https://leetcode.com/problems/soup-servings/description
