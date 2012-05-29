# Color output

  brew install colordiff


# Show all differing files in two directories

    colordiff -ru --exclude=".git" wellspace growing-meadow-85

without line-by-line comparisons:

    diff -rq dirA dirB


# Unified Diff Format

    diff -u file1.txt file2.txt

* old filename preceded by ---, new filename preceded by +++
* unchanged lines preceded by a space, added lines preceded by a "+", deleted lines preceded by a "-"
* range information: `@@ -l,s +l,s @@`, where "-" is the range from the original file, "+" is the range for the new file, "l" is the starting line number, and "s"  is the number of lines


# Range Info Example

    * `@@ -13,7 +13,6 @@`

Remove 7 lines from old file starting at line 13, add 6 lines to new file starting at line 13 (skipping the line preceded by "-")
