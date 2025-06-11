---
aliases: 
tags:
  - ai
edited: 2025-05-23T18:03
created: 2024-03-19T22:06
---
# Definition:
Definition

---
# Notes:
1. Get problem idea from business or engineering (POC).
	1. Set of vague requirements.
	2. Define the DATA (text, images, annotations) + problem.
		1. Open Source Data for Starting
		2. Still need to know data and inputs
2. Generate Minimum Viable Product Prototype.
	1. [[Retrieval Augmented Generation]] with embeddings, database, preprocessing, chunking, etc.
	2. Generate a simple front end to test this with product users.
		1. UI is Streamlit or Jupyter or something basic.
	3. **Determine what is good output or bad output.** What is success?
	4. Some level of good code -- tests, code quality, etc. in MVP
3. Evaluation
	1. 

---
# Case Studies:

#### SQL Retrieval Chatbot
1. Database for storing information (tables, documents, etc.)
2. Process documents.
	1. [[Retrieval Augmented Generation|RAG]] works for this framework.
	2. Determine format of data
	3. Remove noisy information
	4. Chunk data 
		1. Chunk size experiments - build full system and then determine chunk size based on metrics for retrieval.
	5. Convert to Embeddings
		1. Embedding Model Selection includes things like languages, embedding length, etc. 
		2. Some people fine tune these but rarely ().
	6. Vector Database (Weviate, OpenSearch, ...)
3. Queries can have serious issues (grammar, incomplete, etc.)
	1. Reformulate for retrieval
	2. Decompose into tasks
	3. Embed, match embedding to document context
	4. Retrieve chunks, Rerank, etc.
	5. Choose what you think you need
4. Other engineering tasks for the prototype
5. Evaluations against data
	1. Most of productionizing is testing against expected user datasets
	2. Balancing load across regions for the service
	3. Most work is in this bucket.
	4. Accuracy is one
		1. Level of detail?
		2. Conciseness?
		3. etc.
	5. Everyone uses [[LLM as a Judge]] with a different family of [[Large Language Models|LLM]].
	6. Metric Types:
		1. Binary YES/NO for matching *
		2. Ranking
		3. Create a surrogate model for what correct answers should be
		4. LLM as Judge
	7. Most evals are done at the very end, but there are some other types
		1. RAG: Precision, Recall, Accuracy...


----
# Source:
Data Neighbour Podcast