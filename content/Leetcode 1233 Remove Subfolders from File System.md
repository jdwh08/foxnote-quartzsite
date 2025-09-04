---
aliases: 
tags:
  - cs/leetcode
  - cs/dsa/array
  - cs/string
edited: 2025-07-23T19:39
created: 2025-07-23T18:42:00
---
# Problem:
Given a list of folders `folder`, return _the folders after removing all **sub-folders** in those folders_. You may return the answer in **any order**.

If a `folder[i]` is located within another `folder[j]`, it is called a **sub-folder** of it. A sub-folder of `folder[j]` must start with `folder[j]`, followed by a `"/"`. For example, `"/a/b"` is a sub-folder of `"/a"`, but `"/b"` is not a sub-folder of `"/a/b/c"`.

The format of a path is one or more concatenated strings of the form: `'/'` followed by one or more lowercase English letters.
- For example, `"/leetcode"` and `"/leetcode/problems"` are valid paths while an empty string and `"/"` are not.

#### Bounds
- `1 <= folder.length <= 4 * 104`
- `2 <= folder[i].length <= 100`
- `folder[i]` contains only lowercase letters and `'/'`.
- `folder[i]` always starts with the character `'/'`.
- Each folder name is **unique**.

#### Examples

**Example 1:**
**Input:** folder = `["/a","/a/b","/c/d","/c/d/e","/c/f"]`
**Output:** `["/a","/c/d","/c/f"]`
**Explanation:** Folders "/a/b" is a subfolder of "/a" and "/c/d/e" is inside of folder "/c/d" in our filesystem.

**Example 2:**
**Input:** folder = `["/a/b/c","/a/b/ca","/a/b/d"]`
**Output:** `["/a/b/c","/a/b/ca","/a/b/d"]`


---
# Notes:
Tiny $n$ bounds suggest we are okay with a sorting-like approach. Sorting would help align things so smaller is checked before larger.

Technically speaking this is a string prefix problem so [[Trie]] would be a good approach, however, I don't know those yet so we'll store our prefixes in like a set or list and check against them. This is around $O(n^2) + O(n \log n)$ but our bounds suggest this is okay.

---
# Attempts:

##### Attempt 1
Thought about sorting by the number of slashes. Failed to realize that it doesn't matter since prefix for longer folders is okay.

Needed to also add a / as part of check to prevent cases where we have subfolders `a/ab` and `a/ac`. 

---
# Solution:

```python
class Solution:

    def removeSubfolders(self, folder: List[str]) -> List[str]:
        # Sort
        # now we have short -> long and in alphabetical order

        folder = sorted(folder)
        output: list[str] = []

        seen_headers: list[str] = []

        def _has_seen_header(fldr: str) -> bool:
            # base case
            for header in seen_headers:
                if (header + "/") == fldr[0:len(header)+1]:
                    return True

            return False

        # shortest go first
        for fldr in folder:
            seen = _has_seen_header(fldr)
            if not seen:
                seen_headers.append(fldr)
                output.append(fldr)

        return output
```

Improvements:
1. Turns out the seen headers doesn't really matter. We've sorted this already alphabetically, so the prefixes 

----
# Source:
Source