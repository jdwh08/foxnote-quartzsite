---
aliases: 
tags:
  - stats/hypothesis_tests
  - ds/ab
edited: 2025-09-11T10:15
created: 2024-03-19T22:06
---
# Definition:
A type of [[Hypothesis Test]] for testing specific business problems.

---
# Notes:

### Rationale
We need to check if our business problem is **[[Causal Inference|causal]]**, i.e., if we make this change it *will lead to* some result. If we mine from data only, we only have [[Correlation (Pearson)|Correlation]].
- Does $X_1 \rightarrow X_2$ (the hoped for causal)
- Does $X_2 \rightarrow X_1$ (reverse causation)
- Does $X_3 \rightarrow {X_1, X_2}$ (latent cause)

To solve this and provide identification, we use [[Statistical Experiment]]s (and/or [[Quasi-Experiment]] from [[Econometrics]])

### Valid Testing Examples
1. Site Design
2. Language
	1. Web language
	2. Email and header campaigns
3. Product Features
4. Pricing
	1. This is a little risky, e.g., what if customers share info?
	2. Promos might be safer?
5. Advertising (e.g., PPC)

### When to A/B Test?
**A/B Testing is NOT Conversion Rate Optimization. It's RESEARCH.**
- The A/B testing is not the thing that increases conversion, it's the thing that measures how well you are doing.
- Don't be afraid if our new variant is performing worse. Learn from it!

##### Don't A/B Test
1. **Without a large enough sample size.**
	1. E.g., if we have under ~5,000
		1. No statsig possible AND large [[Opportunity Cost]]
		2. Good A/B Test campaign might give 20-30% boost.
		3. Good marketing might give 100-200% boost in audience.
		4. NOTE: applies for less-visited subsections too even if overall volume is high.
2. **If A/B Testing is not a good [[Return on Investment]]**
	1. Do we *need* the information from the experiment?
	2. If we know the result already, there's no point.
		1. If our copy / images / etc. *suck*, there's no point testing.
3. **If there is no cost to making the change.**
	1. E.g., if there is no cost to make the change, might be okay to skip.
4. **If most visitors are returning visitors.**
	1. If yes, then we probably know the results already since customers are "used to" design.

##### When TO A/B Test
1. When you are doing something contra norms or standard business practices
2. When you want to change something already successful (i.e., we have risk)
3. For product sales...
	1. *Images* for cheap products. These are usually more impulse-buys.
	2. *Sales Copy* for expensive products. These are usually more rationale.
4. New User Experiences
5. When starting something new.
	1. E.g., Tim Ferriss did A/B testing with Google Paid Search Ads to come up with his title for "The Four Hour Workweek"
6. For low hanging fruit.

**An A/B Testing Checklist**
- [ ] Can I risk NOT A/B Testing this?
- [ ] What will I learn from this A/B Test?
- [ ] BONUS: Are there disagreements about whether it is a good idea? 

### Basic Algorithm

##### Problem Statement
1. Get the business perspective
	1. *What is the GOAL?*
	2. Get initial research rounds
	3. Reflect on what the audience probably needs
2. What is the User Journey, and where are we making the change?


3. Determine our **BUSINESS METRIC**
	1. What are we looking for?
	2. Is it measurable?
	3. Is it actionable? I.e., can we identify if change was causal?
	4. Is it sensitive? I.e., is the metric stable enough that we can tell?
	5. Is it timely? I.e., can we see the results after a short period of time?

Example Metrics:
- Conversions per User Session. Bimodal with bounded variance.

1. Determine our **GUARDRAIL METRICS**
	1. What are things we can't harm?
2. Determine our **TRACKING METRICS**
	1. What are some metrics which explain changes in our business metric?

##### [[Hypothesis Test]]
1. Explicitly state the [[Null Hypothesis]] and [[Alternative Hypothesis]].
2. Determine [[Confidence Level]] based on business impacts of a [[False Positive]] and [[False Negative]]. (typically `0.05`)
3. Determine the [[Statistical Power]], i.e., probability we reject if should reject. (typically `0.80`)
4. Set the minimum detectable effect (typically `1% lift`)

##### Experiment Design
1. What is the `unit` of randomization? E.g., user?
	1. Should avoid interference and network effects.
	2. Consider UX
2. What is the `target population` of the experiment? 
	1. E.g., where in the User Journey are we?
3. When does our experimentation units enter the experiment?
	1. E.g., when they go to checkout? When they book a ride? etc.
4. Determine the [[Hypothesis Test]]
	1. [[One Sample T-Test]], [[Two Sample T-test]], [[Z-Test]] for proportions
5. Perform [[Sample Size Calculation]] based on [[Confidence Level]], [[Effect Size]], and [[Null Hypothesis]].
	1. E.g., if we need to have a high confidence, detect a small effect size, and have a tiny baseline rate, we need a huge sample.
	2. Convert sample size into rough estimate for the **amount of time to run test**.

	RULE OF THUMB (for `0.05, 0.8, 1% diff`): $$n \approx 16 \sigma^2 / \Delta^2$$
4. Determine the duration of the experiment.
	1. Based on traffic volume and 
	2. Ideally 1-2 weeks. 
		1. Shorter might have day-of-week effect.
		2. Longer is costly and has macro effects.

##### Run the Experiment
1. Run the experiment. Create data pipeline and track values.
2. DO NOT PEAK AT [[P-Value]]!

##### Validity and Sanity Checks
1. **Instrument Checks**: was data logged properly? secondary metrics? e.g., latency?
2. **External Factors**: was there macro stuff?
3. **Selection Bias**: are treatment and control populations the same?
	1. Run an A/A test
4. **Sample Ratio Mismatch**: [[Chi Square Test]] for Goodness of Fit
5. **Novelty Effect**: Make sure changes aren't because of newness.
	1. Segment by old and new visitors.
	2. If we see a difference, that suggests novelty issue.

##### Interpretation and Decision Making
1. Evaluate
	1. Compare the [[P-Value]] to the [[Confidence Level]]
	2. Calculate the [[Confidence Interval]] for the lift.
2. Decide
	1. **Compare Metrics** and see tradeoffs.
	2. **Evaluate Cost of Launch**
3. Possible Actions:
	1. Scrap the experiment. If our effect size is nonsignificant and close to zero.
	2. Rerun the experiment. If our effect size is likely positive but with high variance.
	3. Accept the results. If our effect size is both strong and significant. 

### Considerations
1. Multiple Testing: Must correct for this using [[Bonferroni Correction]] or [[False Discovery Rate]].
2. **Novelty Effect**: Having a boost in performance purely because of a change. E.g., we see performance degrade a bit after the test.
3. We may need to adjust the unit of randomization to the unit of analysis
4. If our randomization 

---
# Examples:

### Web Design

### Advertising

----
# Source:
[DataInterview](https://www.youtube.com/watch?v=DUNk4GPZ9bw)
