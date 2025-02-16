---
aliases: 
tags:
  - readings
  - finance/volatility
  - finance/options
edited: 2025-02-15T15:55
created: 2024-01-07T14:38:00
reading creator: Noel Smith
reading date: 2023-07-27
---
### Source:
SpotGamma. Youtube.
[Options Volatility, Regimes & Edge | Noel Smith of Convex Asset Management](https://www.youtube.com/watch?v=byCVdQkCMbM)

---
### Summary:
1. Realized vs Implied
	1. You can sell implied vol at really low levels (e.g., 11) and not be reckless if realized vol is even lower (e.g., 9).
2. Seasonality in VIX with October lows comes from...
	1. People who lost their book being replaced by people who are putting in new hedges ("new suckers at the table"; var swaps, [[VIX ETFs]], etc. to add more "notional vega" before it becomes dangerous like in Volmageddon.) 
3. VIX calls and puts open interest is very high, what gives?
	1. VIX is more of a "Variance Swap" while SPX puts have a strike component (SPX can get away from your strike and make your puts worthless, but VIX won't).
	2. High open interest is a legacy of previous hedges which are near worthless now. If they do get reinvigorated, they should act as a vol suppressor going upwards. They aren't speculative (e.g., guy who buys deep OTM)
4. Nations Skew Dex Put Skew? (ATM put vs 1-SD OTM put). Very low, so puts are "getting trashed?" Is this "unnatural"?
	1. Think about time. VIX calls are "cheap" at 15-vol, but what happens if it doesn't move over the next time? Theta decays to zero.
	2. Vol has some stickiness (GARCH model), so low vol today probably means low vol tomorrow. Vol can be sticky at low levels like 12. Probably fair price.
5. If we get a drop in SPX, vol should spike right? Even with the feedback loops that drive VIX lower? Makes vol relatively rich, result in selling?
	1. If we have high VIX OI, they already have calls (e.g., bought VIX-20 calls at $3 months ago, and now at $0.03). If the VIX spikes and your calls are now worth $0.50, they're probably going to take this "free money" that was gifted back and hedge again.
	2. Behaviour of crowds. Floor trading. [[Options Gamma]] suppression. [[Options Charm]].
		1. Imagine you're a floor trader and brokers have done nothing but sell vol while you're on vacation.
		2. All the other traders in your pit are now "soaked" in [[Options Gamma]] so they keep lowering their price. Gamma becomes cheap.
		3. These other traders have to carry the [[Options Gamma]] every day from a higher level to a lower level. Hence, they suffer from [[Options Theta]]. You don't.
	3. This capitulation of long vol should continue until something massive breaks.
		1. It wasn't notional [[Options Vega]] which broke the market; the best contemporary was the borrower's shopping for risk reversal. (Volmageddon?)
		2. Brokers were shopping for risk reversal. Reversal is based on the interest rate / borrowing cost.
		3. Options in ETF create-redeem process meant that shares were getting difficult to borrow, so reversal would expand and more people were trying to buy when supply was low. Result is higher vol.
6. [[Volmageddon]]: people thought that XIV would collapse when a 50% drawdown occurred. When did people realize you could give a small shove and make it explode?
	1. Unsure, but it was some both. Once the tipping started, everyone decided to take advantage. The XIV and products died _after the close_, and front-ran the trade they needed to rebalance.
7. Positioning Gamma and SpotGamma tools? What do you pay attention to?
	1. Trade structure (straddles) doesn't work all the time, but the difference is what % of the time it works. Create some "probability cone" of unlikely to go up/down beyond this point, and then assign some events to this??????
	2. Maybe there is some exogenous factor, e.g., FED Funds Futures overrides the Gamma.
	3. If I know everyone else has some [[Options Gamma]] in the pit and they have to hedge at a certain level to cover their [[Options Theta]] (e.g., $100k/day), so stock up/down at P&L will result in hedging activity to not waste the theta. Pit trader can then do thing at the inflection point.
8. [[Gamma Squeeze]]s and Meme Mania: Measure long vol cases with dealer positioning?
	1. E.g., GameStop, short at 32, 47, 67, etc. Long 70, rode straddle to 400.
	2. When things are so irrational that people are blowing out, then things get extra violent and your counterparty can blow up.
	3. Impressive how good the dealers did not blow up. However, they do not know everything. (E.g., in response to the GME situation, they priced options so breakeven was $1000 so this would never happen again).
9. Meme Mania effects seem to result in higher VVIX?
	1. Discontinuous pricing (so [[Black-Scholes]] falls apart)
	2. Say you are a BMW wholesaler. Someone calls in to sell two for $50k. They call back to sell 10 and consider 4/$48k. Then they call back to unload 10,000. Price changes are jumpy and dramatic, since you have no idea what is going on and need to ensure you can't lose..
10. 0DTE? Tailwinds to wild vol pricing?
	1. 0DTE is not new, but the high volume to do it every day is new.
	2. Noel thinks it's great.
		1. Market makers will make loads of money off of it.
		2. Super unlikely you will buy enough to knock out makers like Susquehanna, Wolverine, Virtu, Citadel etc. at once.
	3. JPM study assumed people won't close puts? Actual trading will result in a cover-scramble.
	4. Suppose you have $50k and you are getting close to a problem amount. In real life, people just leave the pit -- i.e., electronically we widen the spread so that trades don't happen.
11. What's the use case for 0DTE?
	1. Became an everyday thing for when markets are coming off of a drawdown.
	2. Useful as an "insurance policy" for people who have exposure to the underlying.
		1. Longer dated options didn't work in the 2023 drawdown, so it's like the BMW losing money and the insurance not working.
		2. Shorter duration is like switching from a owned BMW to renting the BMW and thus buying "rental insurance". Allows people to have some exposure to the market.
		3. Particularly useful for stuff like institutions which require exposure in things like Nvidia but don't like the macro outlook.
	3. Higher VIX means that we can sell the premium from [[Iron Condor]] or [[Options Straddle]] or Iron Flies and being profitable, so the demand for 0DTE is less.
	4. Margin of error for selling 0DTE has gone from $0.50 to $0.22 so half the premium for the same risk. Not worth it.
12. Does 0DTE affect how vol is affected?
	1. It's not like there is a fixed lump of volatility with some going into 0DTE. The vol budget has increased and moved into shorter terms. Effects on skew, vol.
	2. Behavioural: Vol should be lower until a new wave of suckers comes in and everything is fixed. New crops of people have to get blown out selling vol, so that knowledgeable vol-sellers can make their money, until the new wave of suckers comes in to pile on. 
		1. This behavioural aspect is the easiest thing for retail traders to exploit.
	3. Pit trading equivalent: imagine a pit trader loses $900k. They're probably close to leaving. You could force them to blow up.
		1. XIV buying notional to rebalance, etc.
13. 0DTE flows seemed to pull back during bank crisis of 2023 (e.g., Silicon Valley Bank collapse). Are we moving from short duration delta-gamma hedging? Is there a vol risk?
	1. What are you hedging against / what is your book?
	2. If you are long equity and want to make more, you probably buy a convex option. Option need is based on where things are used.
		1. Imagine if bank collapse spread to large banks e.g., 2008.
	3. Dispersion trades e.g. puts on SVB -- works because options are really cheap and you benefit when something surprising happens.
14. Dispersion trade currently is long equity vol short index vol?
	1. You can have very different dispersion books, but generally true.
15. What would cause a reversal?
	1. Earnings tends to help long equity vol short index vol dispersion.
	2. Difficult question -- when is it good to own a straddle? When the straddle breaks; but no-one is going to give you that cheap/free gamma at that time. Same thing with dispersion -- no one is going to sell you vol ahead of these events.
	3. You need to project forward vol so that the future vol is different. E.g., hedging 12 vol now, project future vol 16, hedging future vol 16.
16. What makes index vol reprice higher? 
	1. This is basically asking "what is the future"? Absent new news, pricing seems fair.

---
### Notes:
Feel like I didn't understand half of this lmao