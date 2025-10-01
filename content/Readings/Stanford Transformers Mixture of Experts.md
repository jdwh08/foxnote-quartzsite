---
aliases: 
tags:
  - ds/ml
  - ds/nlp
  - readings
edited: 2025-02-15T16:33
created: 2024-04-25T18:32
---
### Definition:
Mixture of Experts.
Albert Jiang, **Mistral AI**

Mistral 7b:
![[_Media/Excalidraw/Stanford Transformers-20240425183423844.webp|]]
- Grouped Query is a hybrid between multi head and multi query
- Sliding window attention gives a short window for lower-level.

PyTorch Single Transformer Layer:
![[_Media/Excalidraw/Stanford Transformers-20240425183714082.webp]]
Mistral 7b did well.

Mixture of Experts
- Not a new idea (Switch Transformers, Scaling to Trillion Parameter Models with Simple and Efficient Sparsity by Fedus et al 2022)
- Mixture of Experts Layer (Outrageously Large Neural Networks: Sparsely Gated Mixture of experts Layer by Shazeer et al 2017)
	- ![[_Media/Excalidraw/Stanford Transformers-20240425183843317.webp]]
	- Gating layer decides which expert to route to.

![[_Media/Excalidraw/Stanford Transformers-20240425183904735.webp]]
- 8x7B is a sparse mixture of experts near the cost-performance Pareto Frontier (sparsity and router means faster)
	- Architecture is exactly the same as Mistral 7B as shown in the single layer.
	- Instead of doing MLP on the latent representation, (r_LD = MLP(RMSNorm(h_LD))), you pick two experts and do it for them.
- Outperformed Llama 2 70B w/ 5x inference
- Replacement for GPT3.5
- 32k token length

What does Mixture of Experts do to your MLPs?
- Conventional wisdom is that MLP stores knowledge and attention stores reasoning.
- Mixture of Experts should thus give you lots more knowledge store.
![[_Media/Excalidraw/Stanford Transformers Mixture of Experts-20240425184143407.webp]]
![[_Media/Excalidraw/Stanford Transformers Mixture of Experts-20240425184220371.webp]]

Can you Mixture-of-Experts the attention mechanism for reasoning?
- 2022 from Switch Transformers. Replace trainable QKV with switch layers.
	- Instead of standard matrix multiplication, do a gating layer and some dense layers for the QKV layers
	- Stability issues. BF16 precision leads to divergence, need FP32 (and can get performance boost). Most people use BF16 though for training, so better stability techniques are needed (normalization, MoE-ification?)
- Open research question.

Myths about Mixtral 8x7B:
- Every transformer layer had 8 experts, which are permutatively equivalent. The gating network decides the top 2 experts for each layer regardless of position. Thus, we have 32 * 8 = 256 experts.
- There are 12.9B active parameters, and 46.7B parameters in total due to sharing, not 8 * 7=56B parameters
- Cost is not quite proportional to active parameters, because the router between experts means you have a communication cost. Cost is thus more than the equivalent dense model with the same number of active parameters.
- Experts should specialize in domains.
	- Suppose we have two experts specializing in coding. If there's a coding task, what do the other experts do?
	- You want all experts fully engaged at all times for maximum efficiency.
	- Language is complex enough that manually specifying domains is a simplification.

How do you balance loads at inference time?
- You want the experts to try handling the same number of tokens, so we don't have a bottleneck at the same expert.
- Mixture of Depths? Dynamic Loading based on scores (saturated the experts, so maybe you give a neighbouring expert the task if it's overloaded)

Compressing Small Mixture of Experts? 
- Can we compress Mixtral 8x7B to 4GB?
- Tim Dettmers thinks yes! (Dec 2023). MoE is very different from dense transformer compression, which is hard to sparsify. Might be more efficient to compress these. No good work yet.

How do we interpret SMoE models?
- Sparse gating layer gives discrete gating signals.
- Deep NNs are hard to interpret since weights and activations are in high dimensional space.
- Attentino gives some interpretation by following the attention scores as a proxy for importance, but this gets messy with multi head.
- Gating layers of SMoEs can tell you what experts tell what tokens. Can we find specialization of experts?

Doman Specialization of Experts?
- Looked at Pile Dataset (ArXiv, Github, PhilPapers, StackExchange, DM Math, Gutenberg, Abstracts, Wikipedia en)
- Plotted layers 0, 15, 31 selection of experts.
![[_Media/Excalidraw/Stanford Transformers Mixture of Experts-20240425185211930.webp]]
- Level 0 is too low level for good specialization.
- Layer15 expert 3 mainly shows up for DM maths. Maybe it's math heavy? Can't conclude for sure.
- Layer 31: 0 and 2.

Consecutive Tokens
- Do two consecutive tokens get assigned to the same expert?
- At first choice (i.e., if token #2 also assigns to same expert.) Completely random would suggest 1/8=12.5%. 
	- Layer 0: 14% on average.
	- Layer 15: 24-28%.
	- Layer 31: 19-24%. Why regression?
- First or second choice:
	- Layer 0: 44-49%
	- Layer 15: 61-67%
	- Layer 31: 44-53%

Token assignment by expert?
- Not very clear distinction about how experts get assignment.

Treasure Hunt: Removing experts
- Removing the 3rd expert makes the entire model collapse (from ~65% MMLU to 0.4%).

How do we interpret MoE decisions, and what are they learning?
- Experts might capture features that are very different concepts than we would.
- Maybe efficient to represent linear combinations of concepts as long as it's spanning the same subspace.

Conclusion:
- Sparse MoE models leverage sparsity to gain knowledge.
- Training MoE to be efficient at inference.
- Specialization of experts is not straightforward.
- Mistral AI!

Questions:
- Most other places have intensive? models, where as MoE is the opposite approach (more knowledge in the same scope?). ChatGPT can have local knowledge? Museum? Intensive knowledge might have knowledge going deeper?
	- For Edge Devices, Sparse MoEs have potential. Sparsity at inference time, but still have to load all in memory which is a huge challenge (don't have 200GB of memory)
	- Useful for data centres to get good performance/cost ratio and throughput. Larger scale.
	- GPT4 might be mixture of experts????
- Fine Tuning issues for tasks challenges?
	- ChatGPT and Gemini rely on OpenAI or Google to do LoRA for you, so less control.
	- Open Weights models allow you to do full fine tuning of weights.
	- Transforming pictures into large datasets, models are for images and don't understand text. 
- How do routing and communication costs scale with parameters?
	- This depends on number of experts and how large each expert is.
	- Communication between GPUs is expensive, communication between NODES is even more. Ensure your experts fit within one node.
	- Scaling beyond that is an open question. 
- Can MoEs beat domain-specific experts?
	- Typically domain-specific is hard to beat. That's why we have continuous training and fine tuning.
	- Medical data, continuous pre-trained and fine-tuned, will be hard.
	- Experts don't focus on specific domains as we know it
- Fusion?
	- Albert says there's a tradition that layers are always the same as each other, and then copy-paste. Effort is thus on how to design the best architecture layer. This is safe.
	- Neural architecture search to optimize layers?
	- Paper has suggested randomizing the layers (attention, MoE, etc.) and that performs surprisingly well.
- 8x7 vs other model
	- Trained on the same datasets? That's it.
- Thoughts on whether random mapping actually improves routing?
	- MoE can be brute forced to have tokens map to random layers.
	- He still thinks the gating is marginally better, but see the paper.
- General design for model? What tried that didn't work?
	- For this particular architecture, we knew it would work because of past papers.
	- Things to consider: a good practice for AI companies is to always take inference needs into account, before designing architecture.
		- You don't want a model that is only slightly bigger than what an 80GB A100 can contain, for example.
- Inference runtime / GPU vRAM footprint between 8x7 vs 7b?
	- Naive / straightforward would be ~8x7=56, but in reality only 13b active, so 
- Rule of thumb to convert between MoE and dense models?
	- Good rule of thumb is geometric mean between active nodes and 
	- Does depend on quality
- What's intuition for how 8x7 is better at reasoning?
	- Benchmarks, even math benchmark, have a very ambiguous mixture between knowledge and reasoning task. You can either reason it, or memorize.
	- 8x7 gains a lot in knowledge, but does that knowledge gain also induce reasoning capabilities?
- GPU memory is a barrier in practical inferencing. Does this get fixed?
- Difficulties in MoE training due to discontinuities and imbalanced experts?
	- MoE experts should have similar number of tokens handled so you aren't waiting on one expert as a bottleneck. Thus, load balance in train is needed.
	- No big troubles...
- When MoE is better than RAG?
	- RAG / No RAG and Dense / MoE are independent decisions.
- Can you swap out experts for one trained on a different dataset?
	- Maybe, if you replace one expert with a domain-specific one, you need to train it a little so the gating layers can know how to route.
- Is MoE less computationally expensive when training? How do gradients backprop?
	- All operations are differentiable, no discrete operations. Entirely differentiable from end-to-end.
	- Cost of training MoE is roughly proportional to number of active parameters but with slight communication cost.
- Even bigger MoE models, even if moving away from Pareto (e.g., 8x100???). Any serving challenges about vRAM as a bottleneck if can't fit in a GPU?
	- If one GPU, dense model or heavy quantization MoE.
	- 128 experts is super exciting, because it should allow specialization more.
	- For serving, that is going to make things super hard.
---
### Notes:
Notes

---
### Examples:
Examples