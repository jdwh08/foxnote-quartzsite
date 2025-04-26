---
aliases: 
tags:
  - ai/agent
  - ds/ml/nn/transformers/llm
edited: 2025-03-20T22:19
created: 2024-03-19T22:06
---
# Definition:
An AI system capable of reasoning, planning, and interacting with the environment.
1. AI Model acts as brain for reasoning and planning. Decides on which actions to take.
	1. Typically [[Large Language Models]].
2. Tools and capabilities handle what the agent can do.
	1. Agent takes actions for steps, and uses tools as functions to handle this.
	2. Capabilities are implemented using tools.
	3. Tool design is critical for quality.

---
# Notes:

#### Chat Template
```python
messages = [
	{
		"role": Literal["system", "user", "assistant"],
		"content": Any (typically text)
	}
]
```
which the model's tokenizer will use to convert to the [[Tokenization]] that the model prefers.
- `Jinja2` as template filler
- Chat message format allows use of instruction-tuned models.
#### Prompts
- System prompt defines role, persistent behaviour.
- System prompt also **defines tools, instructions on action format, and guidelines for reasoning/planning process.**
	- "You are an AI assistant...\n\nYou have access to the following tools {tool desc}"
	- Need to be precise about what tool is, and what inputs tool needs. 
#### Tools
- Function available for the LLM to **do a clear objective**
	- Examples: calculator, web search, image gen, retrievals, API, etc.
	- Useful for complements that LLMs cannot do, or for more recent data, etc. 
```python
@tool
def calculator_multiply(a: int, b: int) -> int:
	"""Multiply two numbers"""
	return a * b
```
`Tool Name: calculator_multiply, Description: Multiply two integers. Arguments: a: int, b: int, Outputs: int`

- Tools can be called via JSON or Python.
	- `@tool` decorator can be implemented to create docstrings automatically from python functions. Example:
```python
class Tool:
    """
    A class representing a reusable piece of code (Tool).
    
    Attributes:
        name (str): Name of the tool.
        description (str): A textual description of what the tool does.
        func (callable): The function this tool wraps.
        arguments (list): A list of argument.
        outputs (str or list): The return type(s) of the wrapped function.
    """
    def __init__(self, 
                 name: str, 
                 description: str, 
                 func: callable, 
                 arguments: list,
                 outputs: str):
        self.name = name
        self.description = description
        self.func = func
        self.arguments = arguments
        self.outputs = outputs

    def to_string(self) -> str:
        """
        Return a string representation of the tool, 
        including its name, description, arguments, and outputs.
        """
        args_str = ", ".join([
            f"{arg_name}: {arg_type}" for arg_name, arg_type in self.arguments
        ])
        
        return (
            f"Tool Name: {self.name},"
            f" Description: {self.description},"
            f" Arguments: {args_str},"
            f" Outputs: {self.outputs}"
        )

    def __call__(self, *args, **kwargs):
        """
        Invoke the underlying function (callable) with provided arguments.
        """
        return self.func(*args, **kwargs)


def tool(func):
    """
    A decorator that creates a Tool instance from the given function.
    """
    # Get the function signature
    signature = inspect.signature(func)
    
    # Extract (param_name, param_annotation) pairs for inputs
    arguments = []
    for param in signature.parameters.values():
        annotation_name = (
            param.annotation.__name__ 
            if hasattr(param.annotation, '__name__') 
            else str(param.annotation)
        )
        arguments.append((param.name, annotation_name))
    
    # Determine the return annotation
    return_annotation = signature.return_annotation
    if return_annotation is inspect._empty:
        outputs = "No return annotation"
    else:
        outputs = (
            return_annotation.__name__ 
            if hasattr(return_annotation, '__name__') 
            else str(return_annotation)
        )
    
    # Use the function's docstring as the description (default if None)
    description = func.__doc__ or "No description provided."
    
    # The function name becomes the Tool name
    name = func.__name__
    
    # Return a new Tool instance
    return Tool(
        name=name, 
        description=description, 
        func=func, 
        arguments=arguments, 
        outputs=outputs
    )
```

#### Agent Workflow

##### Cycle 
1. Think: decides what the next step(s) should be. Analyze information needed in prompt.
2. Act: take an action by calling tools with arguments.
3. Observe: reflect on response from tool
4. Repeat until objective is completed.

Cycle is typically defined in system prompt. (wait really?)
##### Think
**Planning**: determine steps needed
1.  **Analysis**: reasoning
2. **Decision Making**
3. **Problem Solving**
4. **Memory** (prior chats)
5. **Self Reflection** ()
6. **Goal Setting** (acceptance criteria)
7. **Prioritization**

Reasoning approaches:
- [[Chain of Thought]]
- [[ReAct]]: Let's think step by step. 
- Model-based: think tokens

##### Act
- JSON: output is specified in structured output
- FUNCTION CALLING: Generates a new JSON message for each action.
- CODE: Agent writes a code block that is interpreted
	- Code is more expressive (e.g., loops, conditions, nesting)
	- Code is reusable for other functions / tasks
	- Code is easier to debug
	- Code can interact directly with APIs and libraries
	- Code can be more insecure

Action "Stop and Parse" Approach:
1. Generate in Structured Format.
2. Stop generation when action is finished. (e.g., clear marker for end)
3. Parse output to convert to tools.
```python
output = client.text_generation(
	prompt,
	max_new_tokens=256,
	stop=["Observation:"]  # genuinely people do this wanting to stop the output before we hit the observe step. WHY IS THIS ALL TOGETHER?
)

assert output == {
	"action": "get_weather",
	"action_input": {"location": "London"}
}

... -> weather = get_weather(location="London") # "Sunny"

prompt = prompt + output + weather
```

#### Observe
Evaluate the results of the agents actions.
1. Collect feedback from action. Get data. Determine if action was successful.
2. Append to results. Integrate information into context (extend memory).
3. Adapt strategy. Update thoughts and actions based on context.

Observation Examples:
- System Feedback: error / success / status message
- Data Changes: database updates, file modifications, state changes
- Environment Data: sensor readings, metrics, reosurces
- Response analysis: API, query, compute output
- Time-based events: deadlines, tasks completed.

---
# Examples:
Examples

----
# Source:
Source