# Transforming Appearance

## Appearance Panel and Graphic Styles:

* To **add another fill/stroke** to an object, select flyout menu (upper right) of the Appearance Palette, and choose Add New Fill or Add New Stroke
* To **edit one of multiple fills/strokes**, select that fill/stroke in the Appearance Palette, and change its color, etc
* To **offset a stroke/fill**, choose Effect->Path->Offset Path
* To **edit offset of a stroke/fill**, double-click "offset path" under that fill or stroke in the Appearance palette
* To **save an appearance as a graphic style**, drag an object from the canvas into the Graphic Styles palette
* To **apply a graphic style** to an object, select the object on the canvas, then select the style from the Graphic Styles palette
* To **apply effects to the entire appearance**, select "contents" in the Appearance stack, then Effect->Blur->Gaussian Blur etc.
* To **add a rounded outline** to an object: Select the object, choose Appearance panel menu->Add New Fill, then select the bottom-most fill, give it a color, then go to Effect->Path->Offset Path, give it a positive offset, and set Joins to "Round" 

## Clipping Masks:

* To **create a clipping mask**, create an object to use as mask, place it over the object to be masked, and select Object->Clipping Mask->Make
* To **delete a clipping mask**, select the masked object and select Object->Clipping Mask->Release

## Opacity Masks:

* To **add an opacity mask** to an object, select the object on the canvas, then select the Transparency palette, click the flyout menu (upper right), select "Show Thumbnails", then select "Make Opacity Mask".  Then select the blank opacity mask and paste something into it via Edit->Paste In Front (cmd-F)
* To **edit an opacity mask**, option-click the mask in the Transparency palette
* To **unlink** an opacity mask from its object, click the link icon between the thumbnails of the object and its mask in the Transparency pane 

## 3D Effects:

* To **add an extruded 3D effect**, select the 2D object on the canvas and choose Effect->3D->Extrude and Bevel
* To **add a rotated 3D effect**, select a line on the canvas and choose Effect->3D->Revolve
* To **add perspective** to a 3D object, increase "perspective" parameter in the 3D dialog box