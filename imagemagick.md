# Install

brew uninstall imagemagick
brew install imagemagick --disable-openmp

# File Formats

To get info about your installation:

    convert -list configure

    DELEGATES     bzlib fontconfig freetype gvc jpeg jng jp2 lcms png tiff x11 xml wmf zlib

    identify -list format

# Convert

    convert -resize 25% old.png new.png