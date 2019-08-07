---
---
function swap_titles(interval) {
    var site_title = $(".site-title > img");

    var rand_index = function(length) {
        return Math.floor(Math.random() * length);
    }

    setInterval(function() {
        var baseurl = {{ site.baseurl | jsonify }}
        var logos = {{ site.logo | jsonify }};
        var index = rand_index(logos.length);
        site_title.attr('src', baseurl + "/" + logos[index] + '?v=4');
    }, interval);
}

function show_emails() {
    var email_links = $('a[href^="mailto:"]');
    email_links.each(function() {
        var email_link = $(this);
        email_link.html(email_link.html().replace(/guesl.*?k.?m/, decodeURI(email_link.attr('href').replace(/^mailto:/, ''))));
    });
}

function htmlencode(v) {
    return $("<div />").html(v).text();
}

jQuery(function($) {
    swap_titles(5000);
    show_emails();
});
