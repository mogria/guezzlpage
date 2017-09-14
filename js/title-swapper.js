jQuery(function($) {
    var alternative_site_titles = [
        'Güssel',
        'Gösu',
        'Güssl',
        'Güsel',
        'Gysl',
        'Güsl',
        'Güzzel',
        'Güzsl',
        'GüZl',
        '<==3'
    ];

    var site_title = $(".site-title");

    var rand_index = function(length) {
        return Math.floor(Math.random() * length);
    }

    var mangle_site_title = function(site_title) {
        site_title = site_title.toLowerCase();
        var site_title_upper = site_title.toUpperCase();
        var title_result = "";
        for(var i = 0; i < site_title.length; i++) {
            chosen_title = rand_index(2) == 0 ? site_title : site_title_upper;
            title_result += chosen_title.charAt(i);
        }

        return title_result;
    }

    setInterval(function() {
        var random_index = rand_index(alternative_site_titles.length);
        var new_site_title = alternative_site_titles[random_index];
        var mangled_site_title = mangle_site_title(new_site_title);
        site_title.text(mangled_site_title);
    }, 2000);
});
