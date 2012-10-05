# Comparison

http://ejohn.org/blog/xpath-css-selectors/

    Goal                        CSS3                XPath

    All Elements	            *	                //*
    All P Elements	            p	                //p
    All Child Elements	        p > *	            //p/*
    Element By ID	            #foo	            //*[@id='foo']
    Element By Class	        .foo	            //*[contains(@class,'foo')] 1
    Element With Attribute	    *[title]	        //*[@title]
    First Child of All P	    p > *:first-child	//p/*[0]
    All P with an A child	    Not possible	    //p[a]
    Next Element	            p + *	            //p/following-sibling::*[0]
