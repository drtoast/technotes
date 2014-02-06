# Convert PNG to PDF

    convert input.png input.pbm
    potrace -b pdf input.pbm

# Convert raster PDF to vector SWF

    convert -density 600 19355650.pdf[1] 19355650.1.pbm
    convert 19355650.1.pbm 19355650.1.png       # (for viewing)
    potrace -b pdf -o 19355650.1.pdf 19355650.1.pbm
    pdf2swf -s protect 19355650.1.pdf -o 19355650.1.swf
    swfcombine --cat --zlib 19355650.0.swf 19355650.1.swf -o 19355650.swf
