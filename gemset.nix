{
  addressable = {
    dependencies = ["public_suffix"];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0viqszpkggqi8hq87pqp0xykhvz60g99nwmkwsb0v45kc2liwxvk";
      type = "gem";
    };
    version = "2.5.2";
  };
  colorator = {
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0f7wvpam948cglrciyqd798gdc6z3cfijciavd0dfixgaypmvy72";
      type = "gem";
    };
    version = "1.1.0";
  };
  em-websocket = {
    dependencies = ["eventmachine" "http_parser.rb"];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1bsw8vjz0z267j40nhbmrvfz7dvacq4p0pagvyp17jif6mj6v7n3";
      type = "gem";
    };
    version = "0.5.1";
  };
  eventmachine = {
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "075hdw0fgzldgss3xaqm2dk545736khcvv1fmzbf1sgdlkyh1v8z";
      type = "gem";
    };
    version = "1.2.5";
  };
  ffi = {
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "034f52xf7zcqgbvwbl20jwdyjwznvqnwpbaps9nk18v9lgb1dpx0";
      type = "gem";
    };
    version = "1.9.18";
  };
  forwardable-extended = {
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "15zcqfxfvsnprwm8agia85x64vjzr2w0xn9vxfnxzgcv8s699v0v";
      type = "gem";
    };
    version = "2.6.0";
  };
  "http_parser.rb" = {
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "15nidriy0v5yqfjsgsra51wmknxci2n2grliz78sf9pga3n0l7gi";
      type = "gem";
    };
    version = "0.6.0";
  };
  jekyll = {
    dependencies = ["addressable" "colorator" "jekyll-sass-converter" "jekyll-watch" "kramdown" "liquid" "mercenary" "pathutil" "rouge" "safe_yaml"];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0dbsr73xlycjr3565fax2ps9l0labqnzzk2fk2dz88sxywxqqg2b";
      type = "gem";
    };
    version = "3.5.2";
  };
  jekyll-email-protect = {
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1s599cfbvccrh8kxxa419hds9ag96jq2xjkb2p5lly5j487gw10x";
      type = "gem";
    };
    version = "1.0.3";
  };
  jekyll-language-plugin = {
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "17alpbqzg5g3p533wxlp60zi8wxqhiy0z9glsrpcg0nirg23kc6l";
      type = "gem";
    };
    version = "1.3.5";
  };
  jekyll-livereload = {
    dependencies = ["em-websocket" "jekyll"];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1l5kbd9figf65i0ggrvvh9f4d6q427di0vlq53155lmp6jhr5vyb";
      type = "gem";
    };
    version = "0.2.2";
  };
  jekyll-sass-converter = {
    dependencies = ["sass"];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "01m921763yfgx1gc33k5ixqz623f4c4azgnpqhgsc2q61fyfk3q1";
      type = "gem";
    };
    version = "1.5.0";
  };
  jekyll-watch = {
    dependencies = ["listen"];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "02rg3wi95w2l0bg1igl5k6pza723vn2b2gj975gycz1cpmhdjn6z";
      type = "gem";
    };
    version = "1.5.0";
  };
  kramdown = {
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "12k1dayq3dh20zlllfarw4nb6xf36vkd5pb41ddh0d0lndjaaf5f";
      type = "gem";
    };
    version = "1.15.0";
  };
  liquid = {
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "17fa0jgwm9a935fyvzy8bysz7j5n1vf1x2wzqkdfd5k08dbw3x2y";
      type = "gem";
    };
    version = "4.0.0";
  };
  listen = {
    dependencies = ["rb-fsevent" "rb-inotify"];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1l0y7hbyfiwpvk172r28hsdqsifq1ls39hsfmzi1vy4ll0smd14i";
      type = "gem";
    };
    version = "3.0.8";
  };
  mercenary = {
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "10la0xw82dh5mqab8bl0dk21zld63cqxb1g16fk8cb39ylc4n21a";
      type = "gem";
    };
    version = "0.3.6";
  };
  pathutil = {
    dependencies = ["forwardable-extended"];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0f444wx6vjd30lkkb2zn1k5a6g33lidrpyy7lmgy66n1gsiipzn7";
      type = "gem";
    };
    version = "0.14.0";
  };
  public_suffix = {
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0snaj1gxfib4ja1mvy3dzmi7am73i0mkqr0zkz045qv6509dhj5f";
      type = "gem";
    };
    version = "3.0.0";
  };
  rb-fsevent = {
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1fbpmjypwxkb8r7y1kmhmyp6gawa4byw0yb3jc3dn9ly4ld9lizf";
      type = "gem";
    };
    version = "0.10.2";
  };
  rb-inotify = {
    dependencies = ["ffi"];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0yfsgw5n7pkpyky6a9wkf1g9jafxb0ja7gz0qw0y14fd2jnzfh71";
      type = "gem";
    };
    version = "0.9.10";
  };
  rouge = {
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "13amckbdknnc5491ag28y8pqbyfpbzx5n4rlmadxhd3wkrhp92c8";
      type = "gem";
    };
    version = "1.11.1";
  };
  safe_yaml = {
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1hly915584hyi9q9vgd968x2nsi5yag9jyf5kq60lwzi5scr7094";
      type = "gem";
    };
    version = "1.0.4";
  };
  sass = {
    dependencies = ["sass-listen"];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1f2cgdrdlkpgk8xvyh0sj8knffhykdwgpsxayx9lfpjl9v92qglb";
      type = "gem";
    };
    version = "3.5.1";
  };
  sass-listen = {
    dependencies = ["rb-fsevent" "rb-inotify"];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0xw3q46cmahkgyldid5hwyiwacp590zj2vmswlll68ryvmvcp7df";
      type = "gem";
    };
    version = "4.0.0";
  };
}