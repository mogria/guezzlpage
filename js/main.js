---
---
function swap_titles(interval, num_images) {
    var site_title = $(".site-title > img");

    var rand_index = function(length) {
        return Math.floor(Math.random() * length);
    }

    setInterval(function() {
        var baseurl = {{ site.baseurl | jsonify }}
        var logos = {{ site.logo | jsonify }};
        var index = rand_index(num_images);
        site_title.attr('src', baseurl + "/" + logos[index]);
    }, interval);
}

function show_emails() {
    var email_links = $('a[href^="mailto:"]');
    email_links.each(function() {
        var email_link = $(this);
        email_link.html(email_link.html().replace(/guesl.*?k.?m/, decodeURI(email_link.attr('href').replace(/^mailto:/, ''))));
    });
}

function embed_facebook_sdk() {
  $.ajaxSetup({ cache: true });
  $.getScript('//connect.facebook.net/en_US/sdk.js', function(){
    FB.init({
      appId: '696265037233127',
      xfbml: true,
      version: 'v2.10'
    });
    FB.AppEvents.logPageView();
  });
}

function htmlencode(v) {
    return $("<div />").html(v).text();
}

function toggle_asoziali_medie() {
    var $c = $('.asoziali-medie');
    $.get({{ site.baseurl | jsonify }} + "/asoziali-medie.html", function(new_content) {
        $c.html(new_content.replace('@URL@', htmlencode(location.href)));
        embed_facebook_sdk();
    });
}

jQuery(function($) {
    swap_titles(5000, 6);
    show_emails();

    $('#asoziali-medie-aktiviere').click(toggle_asoziali_medie);
});
