---
aliases:
  - RLHF
tags:
  - ds/ml
  - ds/ml/rl
edited: 2025-02-15T16:36
created: 2024-04-25T08:54
---
### Definition:
Secret sauce behind LLMs

Humans rank order pairs of behaviour, traing preference model, use preference model as reward, and use RL to fine tune to optimize good outputs

Improves aspects of output, but also increases evasiveness???


Next step is maybe Reinforcement Learning form AI Feedback
Constitutional AI: Harmlessness from AI Feedback (Bai, ... Goldie Et Al 2022)
- *Anthropic Paper*. Replace 10k human labels with 10 human written principles
- Perform RL finetune using AI feedback from this human consitution.
- Humans don't need to be in the loop!
![[_Media/Excalidraw/Reinforcement Learning from Human Feedback-20240425085731921.webp]]
- Critique Request highlights potential issues with the output
- Revision Request: how to rewrite the model to be better.

![[_Media/Excalidraw/Reinforcement Learning from Human Feedback-20240425085957414.webp]]
Can prompt model with "redteam" high error prompts, use AI to rank models instead of humans
![[_Media/Excalidraw/Reinforcement Learning from Human Feedback-20240425090158756.webp]]
- Strictly better than RLHF.
- Does a better job not evading answering difficult questions on sensitive topics.

---
### Notes:
Notes

---
### Examples:
Examples