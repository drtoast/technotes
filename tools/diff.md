# Show all differing files in two directories

without line-by-line comparisons:

    diff -rq dirA dirB

# Unified Diff Format

* `diff -u file1.txt file2.txt`
* old filename preceded by ---, new filename preceded by +++
* unchanged lines preceded by a space, added lines preceded by a "+", deleted lines preceded by a "-"
* range information: `@@ -l,s +l,s @@`, where "-" is the range from the original file, "+" is the range for the new file, "l" is the starting line number, and "s"  is the number of lines

# Example

* `@@ -13,7 +13,6 @@` ==&gt; Remove 7 lines from old file starting at line 13, add 6 lines to new file starting at line 13 (skipping the line preceded by "-")


<pre>
Index: app/models/catalogitem.rb
===================================================================
--- app/models/catalogitem.rb	(revision 14)
+++ app/models/catalogitem.rb	(working copy)
@@ -13,7 +13,6 @@
   # get the total sales for the specified year and month, optionally as ranges (1999..2003 etc).
   # returns number of times ordered, total quantity ordered, and grand total of selling price
   def ordered(year=nil, month=nil)
-    test = nil
 	@months ||= orderedmonths.index_by {|s| sprintf("%04d%02d", s.year, s.month) }
     #load_sales unless @sales
     orders = qty = price = 0
</pre>