http://linuxdevcenter.com/pub/a/linux/2004/05/06/graphviz_dot.html
http://github.com/textmate/graphviz.tmbundle.git

# Install

    brew install graphviz

# Commands

    dot - filter for drawing directed graphs
    neato - filter for drawing undirected graphs
    twopi - filter for radial layouts of graphs
    circo - filter for circular layout of graphs
    fdp - filter for drawing undirected graphs
    sfdp - filter for drawing large undirected graphs

# Plain graph

    graph g {
        a -- b ;
        a -- c ;
        a -- d ;
    }

# Directed graph

    digraph simple_hierarchy {
        B [label="The boss"]      // node B
        E [label="The employee"]  // node E
        B->E [label="commands", fontcolor=darkgreen] // edge B->E
    }


# Render directed graph

    dot -Tpng directed.dot -o directed.png

# Attributes

http://www.graphviz.org/content/attrs

