---
---

function swap_titles(interval) {
    const baseurl = {{ site.baseurl | jsonify }};
    const logos = {{ site.logo | jsonify }};
    const site_title = document.getElementById('site-logo');

    const rand_index = function(length) {
        return Math.floor(Math.random() * length);
    }

    setInterval(function() {
        const index = rand_index(logos.length);
        site_title.src = baseurl + "/" + logos[index] + '?v=4';
    }, interval);
}

function show_emails() {
    const mailto_regex = /^mailto:/;
    const links = document.getElementsByTagName('a');
    for(idx in links) {
        if(!links.hasOwnProperty(idx)) {
            return;
        }

        const link = links[idx];
        if(mailto_regex.test(link.href)) {
            const link_description = decodeURI(link.href.replace(mailto_regex, ''))
            link.innerHTML = link.innerHTML.replace(/guesl.*?k.?m/, link_description);
        }
    }
}

swap_titles(5000);
show_emails();
