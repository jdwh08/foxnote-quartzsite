---
aliases:
tags:
  - ds/ml/nn/transformers
  - ds/ml
  - readings
edited: 2025-09-30T21:59
created: 2024-04-18T18:48
---
### Definition:
Definition

---
### Notes:

**Nathan Lambert: HuggingFace & AI2: Allen Institute for AI, Alignment.**
- nathan@natolambert.com
- @natolambert
- **Interconnects.AI**
- AI2: Allen Institute for AI

Alignment is about changing the distribution (multi-level) of the loss function to be more appealing to humans.

#### **OPEN MODELS: GENERATION 1**
**Self-Instruction and Synthetic Data**
This was done for Alpaca @ 13 March 2023 (MTBench13: 4.53)
- Gerneate $N$ high quality (human) prompts
- Ask a strong LM (GPT3) for alternatives
- Generate completions using that strong LM
- Use the results as part of training.

Next was Vicuna (30 March 2023) w/ **Share-GPT**:
- LLMs as a Judge
- ShareGPT dataset: install a browser plug-in, and then share your ChatGPT prompts and conversations before OpenAI allowed it.
	- Unlicensed and released without consent, so legal grey area.
	- Extremely useful for fine-tuning models to improve diversity of training data beyond just Self-Instruct
	- LMSYS-Chat-1M: Cleaning personal information to get prompts for their ChatBotArena
	- WildChat: Alternative where users get free ChatGPT usage in exchange for providing their data.

Koala (3 April 2023):
- Diverse dataset (Alpaca, Anthropic, ShareGPT, Human eval...)

Dolly (12 April 2023)
- Different dataset: trained on Pythia 12b from LutherAI, bad performance on inference because of older philosophy on scaling laws.
- 15k new human written data, which was important contribution.

**Why Weight Differences?**
- Llama was released as "research only" and distributed on request; base model not released. LLaMa1 had to be cloned, and weights slightly changed before release.
- This has changed, e.g., Llama3 requires it to have the name.

**OpenAssistant**
- First open, human instruction dataset (15 April 2023). Huge. Still used today.
- Needed for alignment: human written prompts and responses in many different languages + ratings. 461k ratings.

StableVicuna: HarperAI. First chat model w/ RLHF, Proximal Policy Optimization on datasets.
- They were ahead of their time for this setup!

QLoRA & Guanaco (33B, MT-6.88):
- Low Rank Adaptation allows for fine-tuning models w/ lower memory consumption.
- Freeze most model weights. Add new weights to specific layers which can be fine-tuned the same way w/ instruction-question-answering.
- QLoRA improved this by improving quantization of the base model and adding GPU tricks to save vram.
- (Tim Dettemers et al.) also released Guanaco model with it. Filtered Open Asistant data.

#### OPEN MODELS: GENERATION 2
- Improvement on LoRA? E.g. RLHF on consumer GPUs? 
	- HF released a thing for fine-tuning 20BB LLMs. 
	- Consensus is that LoRA has weird issue updating the weights which makes it harder to actually get good models for. LoRA is better than nothing for GPU poor though.
- Llama2 chat safety versus instruction following
	- Llama2 had some issues, e.g., "Where can I buy a can of coke?" "I can't help because it's illegal."
	- "Unsensored" models are a popular category on HF, where they do not refuse any human instructions.
		- There weren't really censored models to start with, it was a result of the data.
- Transition period w/ good but more obscure models:
	- WizardLM w/ EvolInstruct's synthetic data generation
	- UltraLM, OpenChat, XwinLM from China with RLHF, OpenHermes on Mistral7b
- New evaluation tools were coming out for stnadardization
	- May-June 2023: 
		- ChatBot Arena: **FANTASTIC.** Defines the strategy for large corporate models. However, hard to use as training signal since slow, hard to control the prompt, base engineering on, and have smaller models get in. 
		- AlpacaEval: List of prompts you compare to stronger base models (DaVinci3, GPT4), and ask which is better. Datasets from OpenAssistant, Vicuna, Claude, etc. Lots of models, easier to use. However, win rates are based on outdated model, we hit a wall; there is a bias of length
			- ApacaEval2: Compares to GPT4 instead of DaVinci003/InstructGPT. GPT4 does a good job answering, so what does it mean for a model to actually beat GPT4? Opaque scoring on what it means to actually score better.
		- MTBench: LLM-as-a-judge, ask LLM like GPT4/Claude to rate a model score
			- Give a prompt. Then, ask GPT4 to rate how good those completions are in 7 categories.
			- Hard to use as sole focus, we're getting saturated at the top end. Only 80 prompts. Variation as OpenAI releases different versions of GPT4.
		- Open LLM Leaderboard
			- MMLU/HellaSwag, etc. During pre-training, a good signal for performance, but NOT ALIGNMENT.
			- OpenLLM Leaderboard gives people some more signal on HF models. RLHF hasn't exactly improved these scores much, *though starting to get better in 2024?*
	- Open source community doesn't have the budget of Anthropic to pay for humans to evaluate everything. 

### **OPEN MODELS: GENERATION 3, Getting RLHF to Work**
- RLHF Objective
![[Stanford Transformers-20240418191455516.webp]]
- How do we get a good reward function? How do we optimize the reward?
	- NOTE: This is a very RL-based method.
![[Stanford Transformers-20240418191550719.webp]]
- We learn a "preference model"
	- Bradley-Terry Model: Reward is proportional to probability that correct is chosen over any other. From econ. !?

... So what if we used Gradient Ascent on the RLHF equation? **Direct Preference Optimization (DPO)**
- Read the paper, good place to start. 
- "Why are we spending the time to learn the reward model when we can just train on the reward function?" (DPO vs RPO/PPO).
	- Nathan suspects lots more progress here because it's easier to do DPO.
- As long as you can get the logprobs, you can get the DPO loss.
	- Easy to implement.
	- Scales nicely with current libraries.
	- Trains an implicit reward function. 

**DPO vs RL (PPO, Reinforce, ...)**
- Learning RL environment?
![[Stanford Transformers-20240418191902959.webp]]

**Zephyr $\beta$**:
- Building on Mistral7b. First big model for DPO!
- Fine-tuned on UltraFeedback dataset.
- DPO (3e-4 as a meme only learning rate for ML, but for DPO this needs 5-e7)

**Tulu v2 @AI2**
- DPO shown to scale to 70 billion parameters. Validated the Zephyr results.
- Very close to beating GPT3 (MT Bench: 7.89)

**SteerLM and Starling**
- SteerLM was from Nvidia collecting attributes (helpfulness, conciseness, etc.). Showed PPO outperforms DPO.
- Starling uses new dataset (Nectar) + k-wise reward model loss function (instead of pairwise). DPO didn't work as well for them. (MT-Bench: 8.09)

### CHAPTER 4: MODERN AS OF 2024-04-18
 - Diversity of models and players!
	 - GenStruct from Nous Research: Specific model to rephrasing any text into instructions.
	 - OLMo-Instruct from AI2: fully reproducible open source models (literally everything)
	 - Corporate: Databrix DBRX and Cohere Command R+ (first to pass GPT4 on ChatBotArena!)
		 - Open is a year behind but we're continuing to grow.
	- Microsoft Rho reward model
	- Multilingual fine-tunes with Aya
	- Mixture of Experts (more efficient training method; JetMoE, QuenMoE)
	- State-Space Models (Mamba, Jamba)
- Llama3: It's more about scaling than alignment.
	- Llama2 was very detailed about alignment. 
	- Currently, there's not much about alignment here. They won't release the human preference data, or the alignment function.

- Will open models catch up to closed models?
	- Nathan thinks probably no. There's going to be some implementation lag.
	- Nathan doesn't think open weights are inherently unsafe.
	- Maxime Labonne's plot shows convergence, but not sure that will persist.

- Current directions:
	- DATA! We have severely limited datsets (Anthropic HH, UltraFeedback from OpenDMB, Nectar from Berkeley Nexus)
	- DPO continuing to improve (ORPO for odds ratio w/o reference models, cDPO constrained, IPO, BCO, KTO, DNO, sDPO sequential, etc.)
	- More model sizes beyond just 7B / 13B.
	- Evaluations: How do we get more specific?
	- Personalization

Nathan's list of people to follow:
- AI2: Tulu OlMO
- HuggingFaceH4: Zephyr
- Berkeley Nest/Nexusflow: Starling
- Nous Research: Hermes
- OpenBMB: Preference Datsets
- Argilla: Open preference datasets
- HF Users: Maximme Labonne & Jon Durbin (merging, fine tunes). Merging is super cheap, no GPU just for-loop (!)

**Questions-Answers**
- How do LLMs know moderation vs at the system level?
	- GPT4 at release had a separate model classify text to determine whether it is unsafe.
	- Llama-Guard is a similar approach, where model inference is different from guardrails.
- ORPO, Reinforce, etc.
- What alignment method does Nathan Lambert use?
	- Paper had a systematic study of PPO vs DPO
	- AllenAI preliminary result that PPO gives slightly better performance. 
		- They don't want to touch the REINFORCE option because not enough people.
		- Thinks that REINFORCE might be better, but depends on infrastructure and luck.
- RHLF is good for preference and even math, not just 
- Q* has some things to guide for.
- Synthetic data has issues with repetitiveness (similar questions and things prevent generalization and actual improvements to model trainings).
- Synthetic data for domain-specific or trustworthy models? Yes. Cosmopedia and other data sets might be a way around stuff like Reddit block. Rumours that industry is doing something similar.
- Personalized language models?
	- Nathan's excited about this. E/Acc is weird, but they have the drive to do stuff for us to learn from.
- Advice for the field?
	- "You should be wary of listening to advice because it's situation based."
	- Keep trying to develop skills and build stuff that is good.
	- You can't keep track of everything, but "think about what you want to do".
- LoRA w/ DPO instead of RL?
	- Nathan hasn't seen it work well as a good model release. Not sure if blind spot or "some weirdness" preventing this from happening.
- Mitigating data contamination?
	- Oh man. This is why human evaluation is needed. Fundamental issue.
- Llama3 training on longer tokens (15MM), does that make it harder to align due to over-training?
	- Not actually over-training. Different models need different batch sizes, learning rates, etc. to continue. 
	- Closer to "More information in the model". To get marginal improvements, we thus need more data than before.
- Watermarking LLMs?
	- Losing battle. Instead, assume that all content is AI-generated unless you get a special certification of being human.
- Different Optimization functions besides MLE?
	- RLHF represents this whole space.
	- Most compelling arguments for Nathan is extreme flexibility in the loss function as opposed to other loss functions.
- Training on adversarial data to defend against adversarial attacks (CRESCENDO?)
	- Everlasting dance that you can protect against it with data, but you can then create a new prompting technique to go around it.
- Quantization Methods (1.58bit/bitnet)?
	- No idea.

---
### Examples:
Examples