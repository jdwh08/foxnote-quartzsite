---
aliases: 
tags:
  - "#ds/ml"
  - ds/ml/nn/transformers
  - readings
edited: 2025-02-15T16:37
created: 2024-04-11T18:33
---
### Notes:
**Jason Wei @ OpenAI**

**Why do language models work so well?**
- Highly suggests manually inspecting the data.

Language models are next word prediction models. Suppose you are given a sentence like "Dartmouth students like to _____"
- The model calculates a probability of the next word, with a probability for EACH WORD IN ITS DICTIONARY (aardvark to zucchini.)
- If the next word is "DRINK", then we expect the model to output 1 as the probability for drink. Loss function is thus difference between 1 and p

Language models have to be *MASSIVE MULTI-TASK LEARNING ALGORITHMS*. Loads of different tasks are involved in language.
- Knowing grammatical context (I like to CODE/Banana)
- Semantics (I went to the store to buy DURIAN/squirrel)
- Rule knowledge (the capital of Azerbaijan is Baku)
- Traditional NLP like sentiment. 
- Translation (the word pretty in Spanish is BONITA/hola)
- Spatial Reasoning (Iroh went to the kitchen. Zuko left the KITCHEN)
A simple prediction for a sentence has loads of tasks:
- From Wikipedia: Biden married Neilia. 
- Hunter: knowledge
- ,: comma prediction
- a: grammar
- student: ??? hard nebulous task.

Scaling compute (the data/model size) reliably improves the loss. (Kaplen et al 2020), read paper. Graphing loss given compute, we can clearly see the loss reduce.
- This is labelled as a law because the X-axis spans SEVEN ORDERS of MAGNITUDE, AND there doesn't appear to be any diminishing marginal returns yet.
- So, why does scaling compute reduce loss? Not so sure, but two handwavy answers:
	- Large Language Models don't have to be choosy about what facts they memorize.
	- Large Language Models get the ability to learn deeper heuristics for tasks.

While overall loss improves smoothly, individual task performance can improve suddenly.
- Breaking the overall task down into smaller loss functions (e.g., a weighted sum of the tasks Grammar, Sentiment Analysis, World Knowledge, Math, ...)
- If overall loss decreases from 4 to 3, there is no reason that all tasks improve at the same rate. E.g., grammar and sentiment might be known ("saturated"), so math might improve suddenly.
- What is the rate of scaling for these tasks as compute improves? On the BigBench dataset: 
	- 29% of tasks have smooth loss, i.e., accuracy
	- 22% have flat loss, i.e., no improvement.
	- 2% have inverse, i.e., get worse as scaling increases
	- 13% are uncorrelated.
	- 33% are "emergent", i.e., before a certain point accuracy will be near zero, but past that level of compute the accuracy begins to improve.
		- Hence, this appears like a capacity that "emerges" in large models
		- You wouldn't expect this until the task gets good enough! 

**Inverse Scaling / U-Shaped Scaling**
Let's say we have a tricky prompt:
- "Repeat after me. All that glisters is not glib. All that glisters is not _ "
- The correct answer is glib.
	- Tiny language models get great scores
	- Small language models do poorly.
	- Large language models once again learn how to do the task.
	- What's going on?
- Decompose this task into three types:
	- 1. Repetition. This is a very easy task. All language models are good at it.
	- 2. Fixing a quote. The actual quote is "All that glitters is not gold".
		- The tiny model doesn't know the quote. The small and large models do.
	- 3. Following instructions.
		- Tiny and small language models can't do it, but the large model can!
	- Thus, the tiny model does well because it can repeat without knowing how to fix quotes, while the large model does well because can follow instructions.

Takeaway: **PLOT SCALING CURVES!**
- You might be able to see cases where you already have plenty of data (flattening out)
- You might be able to see cases where the loss is linear, so more data would help.
- You might be able to see cases where your loss is flat, so you need more compute before seeing a huge jump in performance.

**Q&A**
- During training, how do you differentiate between good and bad data? 
	- A: Well, you don't really, but ideally you filter out bad data.
- Was there anything about the loss in the flat portion of emergent tasks that suggested the task would become emergent?
	- A: Kinda tough. You can look and see it "kinda gets better"?
- Thoughts on paper "Are emergent capabilities of LLMs a mirage?"
	- "Always gets this question." Paper argues that if you change the metric the result looks different. He thinks the real-world measurement outcome is what matters, and so that isn't really a mirage.

----
**Hyung Won Chung**
- OpenAI's ChatGPT (RLHF)
- Google Brain Flan papers. MIT.

What's the history of Transformers, to learn lessons for the future? Get a "unified sequence of events" from a "disjoint". Chung argues that it's hard to keep up, and there isn't enough attention on old things and **studying the history of the change itself.**
1. What are the dominant driving forces behind the change?
	1. Many driving forces, but we just need the directionality
2. Understand the dominant driving force
3. Predict the future trajectory from the dominant force.
	1. "It's not that impossible to predict the future trajectory of a narrow scientific domain"
	2. You only have to be right a few times, because they can have outsized impact.

**Physics analogy:** 
- Dropping a pen has gravity and air drag (where air drag is super complicated).
- The main driving force is the force of gravity w/ Newtonian Mechanics.
- We can predict the acceleration downwards thanks to gravity.
- Of course, in reality there are loads of dominant driving forces AND interactions between those forces.
	- However, Hyung argues that there are actually not so many dominant driving forces.
![[Stanford Transformers History Class-20240411191327768.webp]]
- Moore's law is such a huge, long-lasting trend that it's a good idea to work with it.
- Cost of compute is decreasing exponentially. Hyung argues this will dominate AI research.

The job of AI researchers is to teach the AI how to think.
- Hyung thinks a "disappointing" approach is teaching models how we think that we think.
- In reality, we have no idea how we think. Imposing this structure NOW might give a quick win, but in long run will cripple development and scaling.
	- Hyung argues that super generalized structure should result in better performance super long term, but current compute bottlenecks suggest we should impose a bit of structure to ensure we get a good product now.
	- This also means that what is better in the long run almost always looks worse now. We're giving freedom now (which looks chaotic).
	- There is an "optimal amount" of structure now, which should reduce as compute increases.
- "The past 70 years has been about reducing modelling assumptions, generalizing methods, and adding more data/compute"

**History of Transformers and Structure Decisions**
1. Encoder-Decoder (Traditional)
2. Encoder-Only (BERT) "actually not that useful in the general case"
3. Decoder-Only (GPT)

**What is a transformer?**
A sequence model. Input is a sequence (words, images, etc.). 
1. Tokenize from words to integers using an encoder. \[length\]
2. Embedding
3. Sequence Model (dot product)

Encoder Decoder:
- Machine translation: ENG: That is Good -> GER: ???
	- Encode this into a dense vector. 
	- Take the dot product. 
		- Bidrectional Self Attention: everything talks to everything
		- Multi-Layer Perceptron
![[Stanford Transformers History Class-20240411192327377.webp]]
![[Stanford Transformers History Class-20240411192415569.webp]]
- Causal self attention masks any connection to tokens afterwards
- Output is a sequence
- We then connect between encoder-decoder using CROSS ATTENTION
![[Stanford Transformers History Class-20240411192511738.webp]]
- All the outputs feed into the final attention mechanism.

ENCODER ONLY
![[Stanford Transformers History Class-20240411192606504.webp]]
- Task specific layer is required for these
- BERT had a GLUE benchmark (Sequence in, classification OUT task)
	- There's an incentive to add structure to the problem to help solve the GLUE benchmark. "Give up generation" means the problem is simple (Seq $\rightarrow$ Classification)
	- "BERT Engineers" would tweak structure to get performance on GLUE.

DECODER ONLY
![[Stanford Transformers History Class-20240411192742348.webp]]
- A single stack, but it can generate stuff!
- You can use this for supervised leraning.
	- Concatenate the input with the target!
	- Causal Self-attention is now handling the cross attention role. Sharing parameters for both input and target sequences.

**Comparison: encoder-decoder vs decoder-only?**
We can transform the more-structured ENCODER-DECODER into a DECODER-ONLY model.
1. Share the cross-attention parameters between cross-attention and self attention.
![[Stanford Transformers History Class-20240411193021614.webp]]
2. Share parameters for input and target.
3. Have output layer attend to only the top layer, instead of all layers of the network.
4. Move from bidirectional attention to unidirectional.

We assumed that the input and output parameters are different enough that they should be allowed to be different.
- Used because translation was the focus in 2017. Encoder handles ENGLISH, decoder handles GERMAN.
	- Now, we want to learn knowledge, and have translation be a function of the knowledge. No longer makes sense to have parameters be separate. These should be combined to share knowledge!
- Instruction fine-tuning on academic datasets
	- Encoder-decoder (T5 & FLAN-T5 vs PaLM). Encoder-decoder had much better gain on task fine-tuning.
	- Hypothesis is that it was about the length: input was really long, output target was short (~2000 words maximum), so the structure for Encoder-Decoder really shines. 
	- As we move to longer generation, this assumption no longer really applies. 

Target element was assumed to attend to the full representation of the output
- In deep NN, bottom and top layers encode info at different layers of granularity (e.g., edges vs cat-face). This is hierarchical.
- Is there a "information bottleneck" if we only attend to the final layer of the transformer? He thinks no.

Bidirectional attention for the input.
- Anecdotal: at sufficient scale, bidirectionality doesn't seem to matter much. This was a nice trick to boost the score.
- He thinks the bidirectionality makes it difficult for engineering at scale. At every turn in a multi-chat, the new input has to be re-encoded again and again!
![[Stanford Transformers History Class-20240411193951090.webp]]

TL;DR: computational scaling is the driving force behind computation. Imposing additional structure on the architecture should be questioned to see if it still is needed for performance at today's compute.

**Q&A**
- Can't parameter sharing be interpreted as "less freedom" / less structure for the model?
	- A: Having input-target be different seems like a stronger assumption than "we can treat these in a similar way".
- Multimodality and structure?
	- Might become a bottleneck. Transformers have done a good job.
- Causal vs Bi-Directional attention?
- He doesn't like that invariance structure / CNNs as it is "extra structure". It's not problematic that machines learn different from humans. Will probably be better.
- Architecture?
	- He has a huge bias against architecture research, arguing that it is not the bottleneck. Did a survey a while back trying different  transformer architectures and not finding anything significant back then.
	- Learning objective for supervised and even self-supervised. MLE assumes there is only one correct target! Is that really the right thing? Likes RLHF with rewards models as a less-structured way to scale, though RLHF isn't really structured, it shows we can train a deep model.
- Moore's Law Ending Exponential Growth?
	- Red herring. Not the number of transistors, but rather the computational ability. GPUs demonstrate architecture. GPU-level optimizations. Hard coding chips specifically for Transformers.
	- He does actually think machines will be good enough at stuff like chip design to make this not an issue.
	- Maybe energy will be a bottleneck?

---
### Examples:
Examples