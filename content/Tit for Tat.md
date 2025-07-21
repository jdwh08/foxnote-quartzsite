---
aliases: 
tags:
  - econ/game_theory/strategy
edited: 2025-07-19T22:18
created: 2024-03-19T22:06
---
# Definition:

A [[Game Theory]] strategy for in repeated games, e.g., [[Prisoner's Dilemma Repeated]], where we start by cooperating and then mirror the other player's actions; COPYCAT

1. Cooperate on first round.
2. Copy the other player's last move.

![[Tit for Tat.excalidraw.png.png]]

---
# Notes:

Works decently well for establishing mutual cooperation, especially against many tit for tat like strategies. Performed surprisingly well.

### Issues:
1. If the opponent goes off-policy, then there is difficulty re-synchronizing back to on-policy:
	1. Y: CDCDCDCD...
	2. T: DCDCDCDC...

### Generous Tit for Tat:
To fix this, we might allow for more Generous Tit for Tat (aka COPYKITTEN)
- We allow for two Defections before we start punishing.

---
# Examples:
Examples

----
# Source:
ML7646
[The Evolution of Trust](https://ncase.me/trust/), where it is called COPYCAT (or COPYKITTEN for the more tolerant version).
