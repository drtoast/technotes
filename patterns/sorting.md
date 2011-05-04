# Complexity

in big O notation:

O(n) - ideal linear behavior
O(n log n) - good behavior
O(n^2) - bad behavior

# Bubble sort

O(n^2)

1. Compare each pair elements.
2. Swap them if 1st is greater than 2nd.
3. After last pair, repeat from beginning until no swaps have occured in the last pass.

# Selection sort

O(n^2)

1. Find the minimum value
2. Swapt it with the value in the first position
3. Repeat for the rest of the list

# Quicksort

O(n log n)

1. Select the median value (pivot)
2. Move all values smaller than the pivot before it
3. Recursively sort the lesser and greater sublists
