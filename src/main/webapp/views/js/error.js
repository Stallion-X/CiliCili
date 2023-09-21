!function (r) {
    var o = [],
        t = ["http://activity.hdslb.com/zzjs/cartoon/errorPage-manga-1.png", "http://activity.hdslb.com/zzjs/cartoon/errorPage-manga-2.png", "http://activity.hdslb.com/zzjs/cartoon/errorPage-manga-3.png", "http://activity.hdslb.com/zzjs/cartoon/errorPage-manga-4.png", "http://activity.hdslb.com/zzjs/cartoon/errorPage-manga-5.png", "http://activity.hdslb.com/zzjs/cartoon/errorPage-manga-6.png", "http://activity.hdslb.com/zzjs/cartoon/errorPage-manga-7.png"],
        a = !1;
    r.ajax({
        url: "//api.bilibili.com/x/activity/operation/list?source_id=630edcfddbd0b39ca7371ad2",
        type: "get",
        dataType: "json",
        async: !1,
        timeout: 3e3,
        success: function (r) {
            var t = r.data && r.data.list;
            for (var e in t) o.push((t[e].object_id && t[e].object_id).replace(/^http:/, ""));
            a = !0
        }
    });
    var e = function (r) {
        var i = a ? o : t;
        s = parseInt(Math.random() * i.length);
        var n = i[s];
        return n != r ? n : e(r)
    }, i = function () {
        rec_rp("event", "errorpage_btnback_click"), history.length > 2 ? history.back() : location.href = document.referrer || "//www.bilibili.com"
    };
    if (history.length > 2 || document.referrer) var n = "返回上一页"; else var n = "返回首页";
    var c, s, l = r(".error-container"), p = l.find(".error-panel"), d = l.find(".error-manga"), g = e(), b = 0;
    if (window.rec_rp = window.rec_rp || function () {
        (rec_rp.q = rec_rp.q || []).push(arguments)
    }, rec_rp("event", "errorpage_pageshow", {
        pic: g,
        url: window.location.href,
        errorType: options.type
    }), r.getScript("//data.bilibili.com/rec.js"), window.options && "defaultError" == options.type) {
        r('<img src=""/><div></div>');
        p.addClass("error-404"), p.find(".panel"), r("a.rollback-btn", p).click(function () {
            i()
        })
    } else if (window.options && "articleError" == window.options.type) {
        var h = window.options && window.options.data && window.options.data.code;
        switch (parseInt(h)) {
            case 701:
                !function () {
                    var r = 3;
                    p.css("background-image", "url(//static.hdslb.com/images/error/video_conflict.png)"), p.html('<div class="rollback-btn">' + r + "秒后自动跳转</div>"), window.options && options.data && options.data.url && (p.find(".rollback-btn").click(function () {
                        rec_rp("event", "errorpage_btnback_click"), location.href = options.data.url
                    }), setInterval(function () {
                        p.find(".rollback-btn").text(r + "秒后自动跳转"), --r < 0 && (location.href = options.data.url)
                    }, 1e3))
                }();
                break;
            case 702:
                !function () {
                    p.css("background-image", "url(//static.hdslb.com/images/error/no_video.png)"), p.append(r('<div class="rollback-btn">' + n + "</div>").click(function () {
                        i()
                    }))
                }();
                break;
            case 703:
                !function () {
                    p.css("background-image", "url(//static.hdslb.com/images/error/wait_for_release.png)"), p.append(r('<div class="rollback-btn">' + n + "</div>").click(function () {
                        i()
                    }))
                }();
                break;
            case 704:
                !function () {
                    p.css("background-image", "url(//static.hdslb.com/images/error/wait_for_review.png)"), p.append(r('<div class="rollback-btn">' + n + "</div>").click(function () {
                        i()
                    }))
                }();
                break;
            case 705:
                !function () {
                    p.css("background-image", "url(//static.hdslb.com/images/error/no_video_login.png)"), p.append(r('<div class="rollback-btn login-btn">登录</div>').click(function () {
                        rec_rp("event", "errorpage_btnback_click"), window.location.href = "https://passport.bilibili.com/login"
                    }))
                }()
        }
    }
    d.html("<img src=" + g + '><a class="change-img-btn">换一张<a/>'), r(window).on("scroll.errorpage_tobottm", function () {
        var o = r(".change-img-btn", d);
        r(window).scrollTop() + r(window).height() > o.offset().top && (rec_rp("event", "errorpage_tobottm"), r(window).off("scroll.errorpage_tobottm"))
    }), r("a.change-img-btn", d).click(function (t) {
        if (!r("a.change-img-btn", d).hasClass("off")) {
            var a = r("img", d).attr("src");
            rec_rp("event", "errorPage_btnrefresh_click", {
                pic: a,
                url: window.location.href,
                errorType: options.type
            }), r("img", d).attr("src", e(a)).one("load", function () {
                r("a.change-img-btn", d).removeClass("off"), clearTimeout(c), rec_rp("event", "errorpage_pageshow", {
                    pic: r("img", d).attr("src"),
                    url: window.location.href,
                    errorType: options.type
                })
            }), r(this).addClass("off"), c = setTimeout(function () {
                r("a.change-img-btn", d).removeClass("off")
            }, 3e3), b++, 100 == b ? (new MessageBox).show(r(this), "别刷了，其实一共就" + (o.length + 1) + "张(笑)", 3e3) : 200 == b && (new MessageBox).show(r(this), "好吧骗你的，其实一共就" + o.length + "张(笑)", 3e3)
        }
    }), r(".error-split").attr("id", "up"), r(".change-img-btn").attr("href", "#up");
    var m = '<div class="msg-text">' + (options && options.data && options.data.message || "") + "</div>";
    r(m).appendTo(r(".article-error"))
}(jQuery);