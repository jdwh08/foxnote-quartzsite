---
created: 2024-07-16T22:49
edited: 2025-02-15T16:23
tags:
  - cs/dsa
  - readings
---
-----
Java Basics:
- == is reference (null check); .equals() is value
- Primitives have Object versions (Integer, etc.)
- Java passes primitives by value, and objects by reference.
- Java has support for generic types with <T> notation, where <T> is a placeholder for generic types.
``` java
public class Container<T> {  
    private T t;  
  
    public void set(T t) {  
        this.t = t;  
    }  
  
    public T get() {  
        return t;  
    }  
}
Container<String> c2 = new Container<>();
```
----------
*Java Iterators*
- Iterator is an interface from java.util that overrides the next() and hasNext() methods (and optionally remove).
- There's usually a cursor to get the iteration progress. 

``` java
import java.util.Iterator;
public class Booklist<Book> implements Iterator<Book>{  
    ...
    // Must override to be valid:
    public void next() {...}
    public boolean hasNext() {...}
}
// TODO: Forloop hasNext -> print -> next
```
Alternatively, we can implement Iterable interface instead, which allows a for each loop. This abstracts iteration for convenience. Iterable is actually built on Iterator (!).
```java
for (Book book : bookList) ...
```
Iterable with a for-each loop can often be more efficient than a regular for loop with index, because it can 'hold place' and not go through the list again.

----------
*Java Comparables*
- Allows classes to define a natural ordering. ```.compareTo(x)``` method must be defined, where negative means less, and positive means more.
- Comparator uses ```public int compare(x, y)``` to compare two objects of the same type; allows custom ordering.
	- E.g., can define comparators for Name (alphabetical) / Age (int) / Major
	- Comes from ```java.util.Comparator;```, and requires us to make a special class which implements Comparator.

----------
COMPLEXITY

- Big O: Asymptotic measure of efficiency (time or space), independent of hardware/software
	- As $n \rightarrow \infty$, how fast does it go?

- Constant Time (low level primitives):
	- Assign value
	- Do basic arithmatic
	- Compare entities
	- Method call / return
	- NOTE: this assumption is only true if we're working with tiny units.
- We can count how many times this happens.

Measuring Efficiency:
- Worse case: What's the worst set of data possible?
- Best case: What's the best set of data possible?
- Average case: somewhere in between. Hard to compute.
- We'll be using the tightest upper bound for this; O(n).

Big O Orders:
- Constant Time $1$
- Logarithmic $log n$
- Linear $n$
- $n logn$
- Quadratic $n^2$
- Cubic
- Exponential $2^n$

Conventions:
- Drop the constant factors and lower order terms[O($5n^2 + 10000n$) $\rightarrow$ O($n^2$)]