function swap_titles(interval, num_images) {
    var site_title = $(".site-title > img");

    var rand_index = function(length) {
        return Math.floor(Math.random() * length);
    }

    setInterval(function() {
        current_image = site_title.attr('src');
        image_num = (rand_index(num_images) + 1)
        image_num = image_num < 10 ? "0" + image_num : image_num;
        current_image = current_image.replace(/\-\d{2}.png$/, "-" + image_num + ".png");
        site_title.attr('src', current_image);
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
      version: 'v2.10'
    });
      console.log('embedding facebook');
    FB.getLoginStatus(function() {
        console.log(arguments);
    });
  });
}

function htmlencode(v) {
    return $("<div />").html(v).text();
}

function get_share_button(url) {
    return $('<div class="fb-share-button" data-href="' + htmlencode(url)
        + '" data-layout="button_count" data-size="small" '
        + ' data-mobile-iframe="true">'
        + '<a class="fb-xfbml-parse-ignore" target="_blank"'
        + ' href="https://www.facebook.com/sharer/sharer.php?u=' + htmlencode(encodeURIComponent(url))
        + '&src=sdkpreparse">Teilen</a></div>');
}


function toggle_asoziali_medie() {
    var $c = $('.asoziali-medie');
    embed_facebook_sdk();
    var new_content = get_share_button(location.href);
    $c.html(new_content.html())
}

jQuery(function($) {
    swap_titles(5000, 6);
    show_emails();

    $('#asoziali-medie-aktiviere').click(toggle_asoziali_medie);
});
