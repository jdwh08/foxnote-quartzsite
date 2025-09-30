---
aliases:
tags:
  - cs/leetcode/medium
  - cs/string
  - cs/dsa/stack
edited: 2025-09-29T21:30
created: 2025-07-21T19:39
---
# Problem:
You are given an _absolute_ path for a Unix-style file system, which always begins with a slash `'/'`. Your task is to transform this absolute path into its **simplified canonical path**.

The _rules_ of a Unix-style file system are as follows:

- A single period `'.'` represents the current directory.
- A double period `'..'` represents the previous/parent directory.
- Multiple consecutive slashes such as `'//'` and `'///'` are treated as a single slash `'/'`.
- Any sequence of periods that does **not match** the rules above should be treated as a **valid directory or** **file** **name**. For example, `'...'` and `'....'` are valid directory or file names.

The simplified canonical path should follow these _rules_:

- The path must start with a single slash `'/'`.
- Directories within the path must be separated by exactly one slash `'/'`.
- The path must not end with a slash `'/'`, unless it is the root directory.
- The path must not have any single or double periods (`'.'` and `'..'`) used to denote current or parent directories.

Return the **simplified canonical path**.

#### Bounds
- `1 <= path.length <= 3000`
- `path` consists of English letters, digits, period `'.'`, slash `'/'` or `'_'`.
- `path` is a valid absolute Unix path.

#### Examples
```
Input: path = "/.../a/../b/c/../d/./"
Output: "/.../b/d"

Explanation:
"..." is a valid name for a directory in this problem.
```
```
Input: path = "/../"
Output: "/"

Explanation:
Going one level up from the root directory is not possible.
```

---
# Notes:
Notes

---
# Attempts:

##### Attempt 1
**BRUTE FORCE** would be a [[Linear Array Search]] keeping track of prior characters, with [[Big O]] of $O(n)$.
- We can simplify this because directories are separated with `/`.
- Special characters are `.` and `..`, where the former is ignored and the latter pops the prior value.
- Since we have this popping from last behaviour we have last in first out, or a [[Stack]].

---
# Solution:

```python
class Solution:
    def simplifyPath(self, path: str) -> str:
        # brute for ce would be a linear scan through the entire array characters keeping track of the prior characters. 
        # O(c)
        # we can simplify this because directories should be separated with a /
        # also note that for our special characters we have one. and two. 
        # two. basically just moves us back prior value 
        # one. basically does nothing and can be removed
        # thus, we are adding things to our final string and then popping them off which is lasting first out. so you could do this with a stack. 

        # split string on /
        # a point that. rules from above 
        # also ignore any empty characters between /
        # concat together to create final path 

        pathlist = path.split("/")
        output = []
        for pathpart in pathlist:
            if pathpart == ".":
                continue
            if pathpart == "":
                continue 
            if pathpart == "..":
                if len(output) > 0:
                    output.pop()
                continue
            output.append(pathpart)

        return "/" + "/".join(output)
```

----
# Source:
https://leetcode.com/problems/simplify-path/description/