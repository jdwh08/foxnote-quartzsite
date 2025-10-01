---
aliases:
tags:
  - finance/options
edited: 2025-09-30T19:34
created: 2024-03-19T22:06
---
# Definition:

A contract allowing the buyer...
- the **right, but not obligation**
- to trade something at specific strike price
	- Buy: Call Option
	- Sell: Put Option
- at or before **expiration date**.
	- European: at expiration only
	- American: anytime before expiration

---
# Notes:

### Why buy an option?
- Options provide **leverage**, i.e., require less money to have the same returns.
- Options provide **downside protection**, i.e., losses are capped at the option price. We don't have to exercise if unfavourable.

### Why not buy an option?
- Premium is lost immediately.
- Options expire, so you need to have the correct timing as well as strike price.
	- 90% of options are not exercised. Those that do are often very profitable.
- Options don't actually give you the underlying until you exercise.
	- Voting rights, dividends, etc.

### Options Profit or Loss
For a long call option:
![[_Media/Excalidraw/Long Call Profit.png]]

Note that we can also sell options, so we collect the premium but might have be forced to trade later.

For a short put option:
![[_Media/Excalidraw/Short Put Profit.png]]

### Options Chain
Shows the current expiration dates at the strike price.
- Bid / Ask / Last are priced for one share, but the contract is for 100 shares.
- Open interest is the number of outstanding positions in the market currently.

### Options Strategies
#### Covered Call
- Buy the underlying. Write a call on the underlying. This collects premiums while hoping the stock doesn't go above the strike.
	- If underlying is above strike, we must sell at strike and lose added profit. Profit: (strike - purchase) + premium 
	- Otherwise, we get: (current - purchase) + premium. 

#### Butterfly
- Sell two calls at the strike price, betting price won't move.
- Buy calls slightly outside the underlying price (below and above), to ensure we don't lose too much on the tails.
- This gains money if the underlying price doesn't change. 

### Options Pricing
#### Options Moneyness
- Intrinsic value for option is difference between strike price and current underlying spot price.
	- If this is positive, we are "in the money"
	- If this is negative, we are "out of the money"
- The more out of the money the option, the  less value it has.

#### Options Time Value
- The closer the option is to expiring, the less value it has.
- This is "time decay", aka [[Options Theta]].

#### Options Pricing
- See [[Black-Scholes]].

#### The Greeks
- [[Options Delta]] $\frac{\partial p_o}{\partial p_u}$
- [[Options Theta]]
- [[Options Charm]]
- [[Options Gamma]]
- [[Options Rho]]
- [[Options Charm]]
- [[Options Vanna]]
- [[Options Vega]]
- [[Options Volga]]

---
# Examples:
Examples

----
# Source:
Source