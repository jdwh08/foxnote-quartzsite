---
aliases:
tags:
  - cs/sys/ml/spam
edited: 2025-09-27T19:45
created: 2024-03-19T22:06
---
# Definition:
[[ML System Design]] for Detecting Harmful Content from Facebook Posts.

---
# Notes:

### Hello Interview


### What in Heck?
1. Define the Problem
	1. Facebook has 3BB Monthly Active Users. 700MM to 1BB posts per day
	2. Harmful Content:
		1. Violence, Nudity, Scams, Hate Speech
		2. Low percentage of harmful posts, maybe 1-2%, so **very imbalanced**.
	3. User Flow
		1. ???
	4. Business Metrics:
		1. Minimize Harmful Content is goal but this is coarse and game-able
		2. Detect high risk harmful content and remove those posts.
			1. High risk: strong probability of harmful interaction AND/OR have lots of influence.
			2. Why high risk only? Filter tradeoff between censorship and harm.
			3. This is a classic [[Precision]]-[[Recall]] tradeoff. Recall gives good censorship, precision would give more harm.
			4. Probably aim for more recall? [[F-Beta]] score as a metric. We can also use [[Area Under Precision Recall Curve|AUCPR]].
			5. High recall models would be okay IF we have [[Human in the Loop]].
		3. What about interaction? Maybe, but that interaction could be pushing back on harm...
2. Inputs and Ouputs
	1. Inputs: Post Data (images, text)
	2. Labels: Reports, Comment Feedback, "Scroll Acceleration"
3. Model
	1. Public embedding model for text.
		1. Scrape public datasets to create an image generation model.
	2. Get the text stuff, put into embedding.
	3. Combine image and text embeddings together using  [[Contrastive Language Image Pretraining|CLIP]] for embeddings.
	4. Also use a [[Vision Transformers]] on the post image
	5. Highly imbalanced data means that we should use [[Focal Loss]]
		1. $\sum \alpha (1-p)^2 \log(p) \gamma$
		2. We want $\gamma$ tying to easy versus hard problems; this maps nicely to defining easy vs hard from the business problem.
	6. Graph Features?
		1. We could add them into the giant model of doom?
		2. We could use them as a good pre-filter
	7. To scale
		1. We can use a Student-Teacher learner with the teacher being the huge heavyweight combined model, and then student being like a [[XGBoost]] or [[LightGBM]]
		2. Calibration
4. Deployment
	1. 
5. Monitoring
	1. Detect drift: Look at CLS tokens from stuff.
	2. Use the [[Population Stability Index]] to detect drift on the embeddings.
	3. Monitor your target metric drift

---
# Examples:
Examples

----
# Source:
Source