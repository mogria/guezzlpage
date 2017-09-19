jQuery(function($) {
    var site_title = $(".site-title > img");

    var rand_index = function(length) {
        return Math.floor(Math.random() * length);
    }

    setInterval(function() {
        current_image = site_title.attr('src');
        image_num = (rand_index(6) + 1)
        image_num = image_num < 10 ? "0" + image_num : image_num;
        current_image = current_image.replace(/\-\d{2}.png$/, "-" + image_num + ".png");
        site_title.attr('src', current_image);
    }, 5000);
});
