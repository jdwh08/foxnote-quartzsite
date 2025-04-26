---
aliases: 
tags:
  - ds/ml/nn/transformers
edited: 2025-04-01T18:08
created: 2024-03-19T22:06
---
# Definition:
Given a pre-trained [[Large Language Models|LLM]], how do we improve it?
- Fine Tuning, RLHF, RAG, Chain of Thought Reasoning
- COT breakdown into small problems gives visibility into problem solving process AND allows better problem solving results than oneshot. 
- Tree of Thought considers multiple reasoning paths and then determines which path(s) to follow.
- Program of Thought uses codegen as the intermediate result. Code execution results with better answers.


---
# Notes:

### Problem Decomposition
- Breaking down problem into a smaller set of questions.
- Self-questioning module in language model proposes subproblems that are easier to divide-and-conquer with.
- Computational graphs breaks down reasoning into smaller subgraphs. 

### Reinforcement Learning and Feedback
- Reinforcement Learning from Human Feedback (RLHF) trains a reward model from human feedback. 
	- Use a RL improvement via PPO
	- Directly train the model without a reward model using DPO (no seperate reward model, tie responses more directly) 
- RLAIF uses a very good LLM to give preferences, and the trains RL on those LLM-as-judge feedback.
	- Human evaluators found good RLAIF outputs similar to RLHF outputs
	- Better scalability for labelling.
	- Disadvantages are the AI model must be a good judge (capable and not noisy).
- Group Relative Policy Optimization GRPO
	- Variation of PPO but instead of ranking pairs of responses, we rank a group of responses in a similar order
	- More fine grained than ranking pairs. More efficient. Stabilizes training better.
	- Improves reasoning, particularly on math.
- Kahneman-Tversky Optimization KTO
	- Modifies the loss function to account for human biases such as [[Loss Aversion]]
	- Attempts to align models closer to human behaviour
	- Can improve humanlike behaviour on a subset of tasks.
- Personalizing RLHF with Variational Preference Learning
	- RLHF averages the feedback together.
	- If we allow latent variables for demographics (e.g., age), and then train on this, we can improve accuracy for different subgroups.

### Self-Improving AI Agents
- [[AI Agent]] perceives environment, makes decisions, and takes actions to achieve a goal.
	- Goal directed
	- Autonomous decision making
	- Iterative action
	- Memory and state tracking
	- Tool use for external 
	- Learning and adaptation
- Self-improvement process has models reflect on outputs to iteratively improve themselves.
	- Reflection of internal state
	- Explanation of reasoning process
	- Evaluation of own process
	- Simulate multistep reasoning chains
- Refinement:
	- Iterative prompting technique has model critique and refine response via a feedback loop.
		- Generate answer -> evaluate answer weakness and inconsistency -> refine answer based on self critique
- Reflexion:
	- Learn from past mistakes and adjust based on prior failures
	- Long term memory for weak or bad responses.
	- Generate improved answer
- ReAct
	- Combines reasoning with external actions. 
	- Model generates a reasoning plan
	- Model calls external tool (API, etc.)
	- Model incorporates retrieved data into its final response
- Language Agent Tree Search LATS
	- Extends ReAct for multiple planning pathways (e.g., like COT vs TOT)
	- Feedback from each path improves future search
	- Monte Carlo tree search for optimal planning
		- Node is state
		- Edge is action that the action can take
		- Generate N best action squences
		- Execute all
		- Score using self reflection
		- Continue from best state.


#### Continual Learning:
- Mechanistic Interpretablility -- what nodes or circuits are activated for a task?
- Model Editing: Edit the neuron weights for a factual association.
	- Rank One Model Editing (ROME) edits one neuron at a time, but this has limitations e.g., related facts
	- REMIX: Larger factual updates
	- CEM: Continual Evolving from Mistakes
	- Lifelong MoE: Mixture of Experts where we add new experts for new domains and freezing past experts?
	- CLOB (Qui et al 2025) -- prompt only via prompting? summarize past knowledge into prompt memory. This is NOT updating the weights.
	- Progressive Prompts Learns soft prompt vectors and combines them together allowing LLMs to learn. This is NOT updating the weights.

---
# Examples:
Examples

----
# Source:
Source