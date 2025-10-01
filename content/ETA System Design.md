---
aliases:
tags:
  - cs/sys/ml
edited: 2025-09-30T21:59
created: 2024-03-19T22:06
---
# Definition:
A [[Machine Learning]] system which predicts the **estimated time of arrival (ETA)** for trips.

---
# Notes:

### Define the Problem

##### Business Problem
Estimated time of arrival (ETA) is needed for many tasks, e.g., Uber rides, trip pricing, matching supply to demand for platforms, navigation, etc.

- Eyeball ETA (what the customer sees)
	- More conversions and fewer cancellation
- Fare ETA (pricing)
	- Better supply/demand management and fewer cancellations
- Matching 
	- Better matching efficiency for two-sided platforms
- Pickup and Dropoff
	- Better price accuracy and more conversions

##### Engineering Problem
- At Uber scale, handling low KK request per second (1KK-3KK).
- Need to have very low [[Latency]]
	- [[Median]] Latency is 3ms, 95th percentile is 4ms, CPU usage at time is 10%

### High Level Architecture
This is a [[Regression]] problem. Our metric is the predicted time vs actual time.

##### Baseline: Routing Engine and Paths
- Use a shortest path algorithm like [[Dijkstra's Algorithm]] along with mapped "paths" for each road segment. 
- Get ETA via sum of road segment times.
- Speed is fast, but accuracy is low.
	- Drivers might not take the recommended route
	- Different use cases might lead to different paths (e.g., biking not car, delivery not rideshare)
	- Start and End trip lag (parking, tolls, etc.)

##### Improvement: Predict the [[Residuals]]
- Kinda like [[ResNet]], predicting the residuals is a relatively easier way to boost performance.
- Fresher ETAs taking into account more recent data / incremental training
- Diverse model architectures allowed, e.g., [[XGBoost]] or [[Deep Learning]].
- Model reuse for other use cases.

Uber's Empirical Observations:
1. Deliveries and rideshare have different residuals
2. Residuals have strong [[Skew]] with long left(!) tail. 

![[ETA System Design Uber 2022.png]]

### Model Training

##### Model Choices:
1. [[Gradient Boosted Decision Trees]], like [[XGBoost]]
	1. This was the baseline used for many years at Uber before 2022.
2. [[Multilayer Perceptron|MLP]]
3. NODE
4. [[TabNet]]
5. Sparse Gated [[Mixture of Experts]]
6. HyperNetworks
7. [[Transformers]]. Too slow.
8. [[Linear Transformers]]. Chosen as fast enough.

##### Training:
- Asymmetric [[Huber Loss]]. Balances tradeoffs between [[Mean Absolute Error]], P95 [[Accuracy]], etc.
- Calibration Layer added to allow for multiple usage across organization, e.g., pickup vs dropoff, ride type, region, etc.

### Deployment
???

### Monitoring
Monitored [[Mean Absolute Error|MAE]] and p50, p95 [[Accuracy]] for relative improvement.

- [[XGBoost]] gives 5.07% MAE improvement, 1.79% p50 and 5.89% p95
- [[ResNet]] gives 7.39% improvement, 6.19% p50 and 7.27% p95
- Above gives 7.83% improvement, 6.25% p50 and 7.99% p95
	- No calibration reduces scores (7.73, 6.12, 7.85)
	- No feature hashing reduces scores, except p95 (7.41, 5.10, **7.99**)

- Very different results per Delivery and Rides, and differ by city.
- Geohashing have local [[Clustering]] after [[t-SNE]]
- Minute of Week is a local continuous [[Manifold]]

---
# Examples:
Examples

----
# Source:
[Stanford MLSys Seminar 64 with Uber, 2022](https://www.youtube.com/watch?v=CJTitzj0qBo)

---
# Flashcards:
