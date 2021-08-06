# Sets Functionality
We have the following modules in our setfunc.exs file

<br>

## Modules added
1. SetCompare (Includes the sets Comparisions)
2. Setfunc (Includes the set functionalities)

<br>

## Functionalities added
1. Powerset (Setfunc)
2. Find if A is subset of B (SetCompare)
3. Find if A is superset of B (SetCompare)
4. Find if A is equals to B (SetCompare)

<br>

## How code works

1. Open Terminal
2. Git clone file
3. Go inside the folder
4. Type iex in terminal
5. Include code ```c("setfunc.exs",".")```
6. Use code

<br>

### powerset
```elixir
# Input
Setfunc.powerset([1,2,3])

# Output
[[1, 2, 3], [1, 2], [1, 3], [1], [2, 3], [2], [3], []]

```

### Sets Comparision

```elixir
# Input
SetCompare.compare([1,2,3,4,5], [1,2,3])

Output:
A is superlist of B

#Input
SetCompare.compare([1,2,3], [1,2,3,4,5])

#Output
A is subset of B

#Input
SetCompare.compare([1,2,3,4,5], [1,2,3,4,5])

#Output
Both Lists are equal

```
