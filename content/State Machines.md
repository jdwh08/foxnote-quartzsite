---
aliases: []
tags:
  - math/discrete_math
edited: 2025-02-15T20:25
created: 2024-01-05T20:09
---
### Definition:

A state machine is a tool to model and analyze systems.
- Abstract model of a step-by-step process
	- Set of states Q
        -   Start state $q_{0} \in Q$
        -   Allowed transitions between states $\delta \subseteq Q \times Q$ 

---
### Examples
##### A state graph of a counter bounded by 99: 

![[State_Machine_99Counter.excalidraw.png.svg]]

Here's a state machine that counts to 99, and then overflows afterwards. Overflow has a self-loop (so it will keep overflowing).
    -   Start state is 0.
    -   States are $\{ 0,\ \ldots,\ overflow\}$
    -   Transitions are 
	    - $i \rightarrow i + 1$ for $i$ in $\lbrack 0,99\rbrack$; 
	    - 99 to overflow
	    - overflow to overflow

##### The Temple of Forever
Monks enter the temple with 15 red and 12 green beads.
- Each turn, they can either swap the \# of red and green beads, or exchange by removing 3 red beads for 2 green beads.
- Monks leave when they have 5 red and 5 green beads.
- Each state can be a tuple of red and green, e.g., $q_{0} = (15,12)$
- State transitions can be written as $(r,g) \rightarrow (g,r)$ or $(r,g) \rightarrow (r - 3,g + 2)$

A state diagram looks something like this for the first 3 levels:
![[State Machines-20240105203159729.webp]]
To figure out if (5,5) is possible is equivalent to saying whether
the machine ever **reaches** the state (5,5); i.e., **path from some
start state to execution**.
-   We look for some **[[Invariant]]**.
-   Since the invariant holds for the start state and all transitions, it must hold for all states by induction.
-   [[Proof by Invariant]] that no one ever leaves the temple:
    -   Let $n$ be the number of turns since entering. **The difference between the number of red and green beads is always** $\mathbf{5}\mathbf{k + 2}$ **or** $\mathbf{5}\mathbf{k + 3}$ for some $k$.
    -   Base Case: $P(0)$ is true since $15 - 12 = 3 = 5*0 + 3$.
    -   Assume $P(n)$ is true, and that $r,g$ still refer to red and green beads, so $r - g = 5k + 2$ or $5k + 3$ for some k.
        -   The monk can either swap or exchange.
        -   If the monk swaps, then $r_{n + 1} = r_{n} - 3$ and
            $g_{n + 1} = g_{n} + 2$ so
            $r_{n + 1} - g_{n + 1} = r_{n} - 3 - \left( g_{n} + 2 \right) = r - g - 5$
            which is still a multiple of 5 from the original, so it
            holds.
        -   If the monk exchanges, then the
            $r_{n + 1} - g_{n + 1} = g_{n} - r_{n} \rightarrow - (r - g)$.
            If this was
            $5k + 2 \rightarrow - (5k + 2) = 5( - k - 1) + 3$. If this
            was $5k + 3 \rightarrow - (5k + 3) = 5( - k - 1) + 2$. Thus,
            it holds.
    -   Therefore, $P(n)$ implies $P(n + 1)$ for all $n \geq 0$.

-   [[Proof by Induction]] that there are a finite number of reachable states:
    -   The total number of beads is at most $15 + 12 = 27$.
    -   Base case: At $P(0)$, there are 15 red and 12 green beads so 27.
    -   Assume that $P(n)$ is true.
        -   The monk can either exchange or swap beads.
        -   In the exchange case, the total number of beads stays the
            same
        -   In the swap case, the monk loses 3 red beads to get 2 green
            beads, resulting in a net loss of 1 bead.
            $(r - 3) + (g + 2) = (r - g) - 1$
        -   Thus, $r + g \leq 27$
    -   Because the monk can never gain beads, the monks are reduced to
        visiting states which have a total of 27 beads or less.
        -   There are 1 ways to get 0 beads, 2 ways to get 1 beads, 3
            ways to get 2 beads, 4 ways to get 3 beads...
        -   Thus the total number of states must be at most
            $\sum_{i = 1}^{28}i = \frac{(i)(i + 1)}{2} = 406$

-   Proof the monks cannot reach 108 states:
    -   [[Proof by Contradiction]]. Suppose the monks could reach 108 states. This
        means that there must be some way from the starting state to all
        108 states.
    -   At each state $n$, monks can either swap or exchange.
    -   Swaps can allow a monk at $r,g$ to visit the state $g,r$, but
        additional swaps beyond this point do not result in any new
        states being visited. Thus, for each reachable state $r,g$, a
        swap allows the monk to visit one additional reachable state.
    -   Exchanges allow a monk to visit a new reachable state
        $r,g \rightarrow r - 3,g + 2$. But each time this occurs, the
        monks lose net one marble. Thus, the cannot do this more than 27
        times.
    -   Thus, the monks cannot reach more than 27 states by exchange x 2
        by swap = $54$ total states.