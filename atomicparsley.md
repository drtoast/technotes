# Install

brew install atomicparsley

# Show tag data

atomicparsley song.m4a -t

# Remove apple ID and purchase date

atomicparsley song.m4a --manualAtomRemove "moov.udta.meta.ilst.apID" --manualAtomRemove "moov.udta.meta.ilst.ownr" --manualAtomRemove "moov.udta.meta.ilst.cnID" --manualAtomRemove "moov.udta.meta.ilst.atID" --manualAtomRemove "moov.udta.meta.ilst.cmID" --manualAtomRemove "moov.udta.meta.ilst.plID" --manualAtomRemove "moov.udta.meta.ilst.purd" -W

# Get long help

atomicparsley --longhelp
