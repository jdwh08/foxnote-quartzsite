---
aliases: 
tags:
  - ds/ml/ML4T
  - finance
  - ds
  - ds/ml
edited: 2025-02-15T16:31
created: 2024-03-19T22:06
---
# Definition:
Some people from SunTrust Robinson Humphrey ATL to talk about ML for Finance (but this is SUUUUUUPER old (from 2019).
- SunTrust's Investment Bank subsidiary
- \$2BB in revenues. 11k people. 360 on sales/trading. 7 on data for now, growing.
- Analytics and data lake.
- NOTE: SunTrust is TRUIST financial as of note creation.

Jeff Utz, Director of Equity Research
Jeff Hughes, Equity Research
Adam Swarthy
John Malarino? Risk
Harish??? Consumer Banking

---
# Notes:
**Things ML did at Hedge Funds:**
1. Trade Identification
	1. Dealer / Market Maker
	2. Some markets are NOT liquid. We might want to have a client that wants something illiquid X.
	3. We need something that finds some Y which has the same properties of X, to allow the trade to go through.
2. Trade Execution
	1. Identify factors that can be analyzed to produce a price.
	2. Analytical power and cloud computing has allowed this to become a lot more autonomous.
3. Research
	1. Lots of what IBs do: analyze companies and markets.
4. Suggestions:
	1. ML/Finance is coming for you if you stick in finance.

**A Dictionary of Terms**
- Buy Side
	- Asset Managers, Hedge Funds, Pension Funds, and Endowments. American Century, Wellington, Fidelity, Citadel, Bridgewater, etc.
- Sell Side
	- Broker Dealer, Investment Banks. (includes SunTrust), GS, MS, JPM. etc.
	- Provide info and trade execution
	- Sell Side Analysts:
		- Cover verticals and other hats for a particular sector (20 stocks per). Provide info for clients
		- Financial analysis (sales/earnings estimates), fundamental research, etc.
		- Attend clients, see institutional investors, etc.
		- Used to be focused on providing basic reporting (e.g., EPS), but now value is moving towards data analysis and other deeper info
- Issuer
	- Publicly traded companies.
- Alternative Data
	- Non-typical data not provided by the issuers which helps understand financial performance of a company.
	- Credit Card, Satellite, Search, Social Media, etc.
		- CC and Web are valuable and more credible.
	- Data sources come from webscraping or third party.
	- Data cleansing is difficult and most value add. Most data is not very usable (time series is wrong, data might be bad, etc.)
	- Data presentation
	- Run hypotheses (simulation, correlation, ML).

**Consumer Banking**
- $76BB loan portfolio, $110BB deposits
- Issue for regional banks is that they get very few deposits relative to the big players.
- Revolution in fees: free trading, lower limits, etc. where you now pay with data.
	- Most of the industry was rules-based, not ML based.
- He has an example of drug companies which have an R&D focus for drug development which pivots to new areas.
	- He argues that banks have a deep history of... client treatment???? which can be used to leverage as intermediation and access.
	- WalMart treats you as a way to push revenue? Amazon treats things as client centric?
	- Disney/Netflix example with P/E ratios.
- Cites DataRobot's AutoML platform.
- Also talks about Internet Banks in response to physical branches. Okay.

**Risk**
- Financial Crimes: AML, Terrorist Financing, Fraud, Theft, etc.
	- Old school was for classic heuristics, e.g., out of state with multiple deposits
	- Criminals quickly learn these heuristic traps.
	- ML helps create ever-changing way to solve these.
- **Third Party Check Fraud**
	- SunTrust client tries to cash a check from a different bank.
	- Must determine very quickly (24hr) about whether some other bank cashing your check is valid or not.
	- Who are you? What is your routine? Is this in the norm? Who is the counterparty?
		- e.g., watchlists, customer data, etc.
		- Account balance, address, social media!!!?
	- Techniques and capabilities are shared across other problems.
	- Clients want money available quickly (Venmo, PayPal, etc.). People are increasingly not using physical branches except for making change.
		- Digital-first means that loan reviews are increasingly hard.
		- We instead need customer-level risk profiles.
	- [[Regression]] used for predicting default and portfolio shape.
	- Also used for [[Optimizers]] for balance sheet etc.
- **Your problems and tools will probably go away 5 years in the future, but your thought process and decisions will be useful for a long time on a lot of other problems.** 
- **Once you have articulated a problem, the techniques used to solve the problems are foundational.**

---
# Examples:
**Consumer Analyst**:
- Scraping Cruise Line data from online for changes in prices. Determines top-line revenue.
- Car inventory on Carvana to determine sales and movement
- Social Media leads
- Healthcare, ad spend, drug descriptions, etc. for predicting revenues
- DMT includes pricing, google trends, etc.
- Oil and Gas includes data scraping, etc.
**REIT**:
- Ki Bin Kim covers REIT self storage; goes through getting pricing, trends and promotion for 300 units.
**Restaurant**:
- Jake Bartlett reviews menu pricing
**Leisure**:
New Product tracking
**Energy and Defense**
Other verticals, e.g., county-level oil well production from the government.
**Internet**:
- Private Label for Amazon pricing vs other. Youssef suggests this has room to grow from customer reviews. Well read research.

**How do we know what data is valuable?**
- Analysts need to have industry experience.
- E.g., 3rd party might provide parking lot satellite data for Home Depot or Lowes. This might suggest weather for garden sales and foot traffic.
- Other analysts might find new initiatives or sources of data for important equity research which might be plugged in.

**How might SunTrust plug in?**
- You could work with an existing analyst
- You are also going to be building a team around data science.

**How does a fundamental analyst differ?**
- C-suite relationships
- Industry expertise
- Concerned about data 

**What tech stack?**
- (not answered lol)

**How does a company thrive and survive?**
- Come up with the *right use cases*. It's not the nature of the product, but rather how you think about the purpose of the company.

**Other Measures of Risks**
- We treated volatility as risk, but... traders must have a specific thesis for each position, and if the thesis stops then exit out.
- Risk is also opportunity. Managing risk manages opportunity.
- Must be managed.
- The biggest risk that DS has is that we don't have perfect data. Data is an aid to learning.
- Access to timely and useful information for models is difficult

----
# Source:
ML4T SunTrust Visit