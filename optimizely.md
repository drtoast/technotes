# Cookies

https://help.optimizely.com/hc/en-us/articles/200040335

optimizelyBuckets:

What: Stores JSON of the experiments and variations that a user has been bucketed into. This ensures the user consistently sees the same variation, even over multiple sessions.
Example: {"138736319":"138725428","138750142":"138754098"}

Expiration: 10 years



# Revenue Goals

How can I track a goal that isn't a pageview or a click?
https://help.optimizely.com/hc/en-us/articles/200039925

How can I track revenue with Optimizely?
https://help.optimizely.com/hc/en-us/articles/200039865


# Getting experiment data

https://www.optimizely.com/docs/tutorials#reporting-data


# Tracking revenue

window.optimizely = window.optimizely || [];
$("#purchaseBtn").live("mousedown", function() {
     var valueInCents = $("#totalPrice").val() * 100;
     window.optimizely.push(['trackEvent', 'add_cart_button_clicked', {'revenue': valueInCents}]);
});

