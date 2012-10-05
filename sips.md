to return width/height of a file:

    sips -g pixelHeight -g pixelWidth AP-2104.tif

to scale to 100x400 and save as jpg:

    sips -s format jpeg -z 100 400 AP-2104_01.tif -o new.jpg

to save as jpg with "normal" (or "low", or "high") quality

    sips -s format jpeg AP-2104_01.tif -s formatOptions normal -o new.jpg

to re-save a TIF file with LZW compression:

    sips -s formatOptions lzw somefile.tif

to convert a CMYK tiff to an RGB tiff

    sips 3698727.tif --matchTo '/System/Library/ColorSync/Profiles/Generic RGB Profile.icc'

<pre>
SMP-Script:~ jamesreynolds$ sips --help
sips 1.0 - scriptable image processing system.
This tool is used to query or modify raster image files and ColorSync ICC profiles.
Its functionality can also be used through the "Image Events" AppleScript suite.

  Usages:
    sips [-h, --help] 
    sips [-H, --helpProperties] 

    sips [image query functions] imagefile(s) 

    sips [profile query functions] profile(s) 

    sips [image modification functions] imagefile(s) 
         [--out outimage | --out outdir] 

    sips [profile modification functions] profile(s) 
         [--out outprofile | --out outdir] 


  Profile query functions: 
    -g, --getProperty key 
    -X, --extractTag tag tagFile 
    -v, --verify 

  Image query functions: 
    -g, --getProperty key 
    -x, --extractProfile profile 

  Profile modification functions: 
    -s, --setProperty key value 
    -d, --deleteProperty key 
        --deleteTag tag 
        --copyTag srcTag dstTag 
        --loadTag tag tagFile 
        --repair 

  Image modification functions: 
    -s, --setProperty key value 
    -d, --deleteProperty key 
    -e, --embedProfile profile 
    -E, --embedProfileIfNone profile 
    -m, --matchTo profile 
    -M, --matchToWithIntent profile intent 
    -r, --rotate degreesCW 
    -f, --flip horizontal|vertical 
    -c, --cropToHeightWidth pixelsH pixelsW 
    -p, --padToHeightWidth pixelsH pixelsW 
    -z, --resampleHeightWidth pixelsH pixelsW 
        --resampleWidth pixelsW 
        --resampleHeight pixelsH 
    -Z, --resampleHeightWidthMax pixelsWH 
    -i, --addIcon 

SMP-Script:~ jamesreynolds$ sips -H
  Special properties: 
    all                  binary data
    allxml               binary data
  Image properties: 
    dpiHeight            float  
    dpiWidth             float  
    pixelHeight          integer (read-only)
    pixelWidth           integer (read-only)
    format               string  jpeg | tiff | png | gif | jp2 | pict | bmp | qtif | psd
    formatOptions        string  default | [low|normal|high] | packbits
    space                string  (read-only)
    samplesPerPixel      integer (read-only)
    bitsPerSample        integer (read-only)
    creation             string  (read-only)
    make                 string 
    model                string 
    software             string  (read-only)
    description          string 
    copyright            string 
    artist               string 
    profile              binary data
  Profile properties: 
    description          utf8 string
    size                 integer (read-only)
    cmm                  string 
    version              string 
    class                string  (read-only)
    space                string  (read-only)
    pcs                  string  (read-only)
    creation             string 
    platform             string 
    quality              string  normal | draft | best
    deviceManufacturer   string 
    deviceModel          integer
    deviceAttributes0    integer
    deviceAttributes1    integer
    renderingIntent      string  perceptual | relative | satuation | absolute
    creator              string 
    copyright            string 
    md5                  string  (read-only)
</pre>
