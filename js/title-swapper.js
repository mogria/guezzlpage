jQuery(function($) {
    var alternative_site_titles = [
        'Güssel',
        'Gösu',
        'Güssl',
        'Güsel',
        'Güssell',
        'Gysl',
        '<==3'
    ];

    var site_title = $(".site-title");

    setInterval(function() {
        var random_index = Math.floor(Math.random() * alternative_site_titles.length);
        var new_site_title = alternative_site_titles[random_index];
        site_title.text(new_site_title);
    }, 2000);
});
