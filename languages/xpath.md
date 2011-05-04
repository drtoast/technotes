# Comparison (from John Resig)

http://ejohn.org/blog/xpath-css-selectors/

Lately, I’ve been doing a lot of work building a parser for both XPath and CSS 3 – and I was amazed at just how similar they are, in some respects – but wholly different in others. For example, CSS is completely tuned to be used with HTML, with the use of #id (to get something by ID) and .class (to get something by its class). On the other hand, XPath has to ability to traverse back up the DOM tree with .. and test for existence with `foo[bar]` (foo has a bar element child). The biggest thing to realize is that CSS Selectors are, typically, very short – but woefully underpowered, when compared to XPath.

I thought it would be worth some merit to do a side-by-side comparison of the different syntaxes of the two selectors.

```
Goal	                    CSS 3	            XPath

All Elements	            *	                //*
All P Elements	          p	                //p
All Child Elements	      p > *	            //p/*
Element By ID	            #foo	            //*[@id='foo']
Element By Class	        .foo	            //*[contains(@class,'foo')] 1
Element With Attribute	  *[title]	        //*[@title]
First Child of All P	    p > *:first-child	//p/*[0]
All P with an A child	    Not possible	    //p[a]
Next Element	            p + *	            //p/following-sibling::*[0]
```