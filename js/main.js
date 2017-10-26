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

jQuery(function($) {
    swap_titles(5000, 6);
    show_emails();

});
