﻿/* Postcodify, LGPL v3, see https://github.com/kijin/postcodify */
(function($) {
    if ("undefined" == typeof $.fn.postcodify) {
        var e = {
            version: "3.4.1",
            location: ""
        };
        $("script").each(function() {
            var s = $(this).attr("src");
            if (s) {
                var t = s.match(/^(https?:)?\/\/([^:\/]+)(?=[:\/]).*\/search\.(min\.)?js(?=\?|$)/);
                t && (e.location = t[2])
                //위치 검색 부분 정규표현식 확인
            }
        }), $(function() {
            if ("undefined" == typeof window.POSTCODIFY_NO_CSS) {
                var t = navigator.userAgent.match(/MSIE [56]\./) ? "http:" : "";
                "" !== t || window.location.protocol.match(/^https?/) || (t = "http:");
                var a = e.location.match(/\.(poesis\.kr|cloudfront\.net)$/) ? e.location : "d1p7wdleee1q2z.cloudfront.net",
                    s = document.createElement("link");
                s.rel = "stylesheet", s.type = "text/css", s.href = t + "//" + a + "/post/search.css?v=" + e.version, document.body.appendChild(s)
            }
        }), $.fn.postcodify = function(s) {
            return this.each(function() {
                var t = $.extend({
                    api: e.freeAPI.defaultUrl,
                    apiBackup: null,
                    timeout: 3e3,
                    timeoutBackup: 8e3,
                    callBackupFirst: !1,
                    controls: this,
                    results: this,
                    language: "ko",
                    autoSelect: !1,
                    requireExactQuery: !1,
                    searchButtonContent: null,
                    mapLinkProvider: !1,
                    mapLinkContent: null,
                    overrideDomain: null,
                    insertDbid: null,
                    insertPostcode: null,
                    insertPostcode5: null,
                    insertPostcode6: null,
                    insertAddress: null,
                    insertJibeonAddress: null,
                    insertEnglishAddress: null,
                    insertEnglishJibeonAddress: null,
                    insertDetails: null,
                    insertExtraInfo: null,
                    insertBuildingId: null,
                    insertBuildingName: null,
                    insertBuildingNums: null,
                    insertOtherAddresses: null,
                    beforeSearch: function(e) {},
                    afterSearch: function(e, s, t, a) {},
                    beforeSelect: function(e) {},
                    afterSelect: function(e) {},
                    onReady: function() {},
                    onSuccess: function() {},
                    onBackup: function() {},
                    onError: function() {},
                    onComplete: function() {},
                    forceDisplayPostcode5: !1,
                    forceDisplayPostcode6: !1,
                    forceUseSSL: !1,
                    focusKeyword: !0,
                    focusDetails: !0,
                    hideBuildingNums: !1,
                    hideOldAddresses: !0,
                    hideSummary: !1,
                    useFullJibeon: !1,
                    useAlert: !1,
                    useCors: !0
                }, s);
                t.language = t.language.toLowerCase(), t.api === e.freeAPI.defaultUrl && null === t.apiBackup && (t.apiBackup = e.freeAPI.backupUrl), t.api && "//" === t.api.substr(0, 2) && (navigator.userAgent.match(/MSIE [56]\./) ? t.api = "http:" + t.api : t.forceUseSSL ? t.api = "https:" + t.api : window.location.protocol.match(/^https?/) || (t.api = "http:" + t.api)), t.apiBackup && "//" === t.apiBackup.substr(0, 2) && (navigator.userAgent.match(/MSIE [56]\./) ? t.apiBackup = "http:" + t.apiBackup : t.forceUseSSL ? t.apiBackup = "https:" + t.apiBackup : window.location.protocol.match(/^https?/) || (t.api = "http:" + t.api)), null === t.insertBuildingId && null !== t.insertDbid && (t.insertBuildingId = t.insertDbid), null === t.searchButtonContent && (t.searchButtonContent = e.translations[t.language].msgSearch);
                var a = $(t.results).postcodifyAddClass("search_form"),
                    n = $("<div></div>").postcodifyAddClass("search_controls"),
                    d = "postcodify_" + (new Date).getTime().toString() + Math.random().toString().substr(2, 4),
                    l = ($("<label></label>").attr("for", d).text(e.translations[t.language].msgKeywords).hide().appendTo(n), $('<input type="text" class="keyword" value="" />').attr("id", d).appendTo(n)),
                    o = $('<button type="button" class="search_button"></button>').attr("id", d + "_button").html(t.searchButtonContent).appendTo(n);
                n.prependTo(t.controls);
                var r = null,
                    i = !1;
                return l.keypress(function(e) {
                    13 == e.which && (e.preventDefault(), o.trigger("click"))
                }), o.focusin(function(e) {
                    o.trigger("click")
                }), o.click(function(A) {
                    A.preventDefault();
                    var n = $.trim(l.val());
                    if (n !== r || !i && !a.find("div.postcodify_search_result").filter(":visible").size()) {
                        if (r = n, a.find("div.postcodify_search_result,div.postcodify_search_status").remove(), n.length < 3) return void(t.useAlert ? alert(e.translations[t.language].errorTooShort) : $('<div class="too_short"></div>').postcodifyAddClass("search_status").html(e.translations[t.language].errorTooShort.replace(/\n/g, "<br>")).appendTo(a));
                        if (t.requireExactQuery && !n.match(/(\uc0ac\uc11c\ud568|[\ub3d9\ub9ac\uac00\ub85c\uae38])\s*([0-9]+)(-[0-9]+)?(\ubc88\uc9c0?)?($|,|\s)/) && !n.match(/^p\.?\s?o\.?\s?box\.?\s*([0-9]+)(-[0-9]+)?($|,|\s)/i) && !n.match(/^([0-9]+)(-[0-9]+)?,?\s*[a-z0-9-\x20]+?(dong|ri|ga|ro|gil)($|,|\s)/i)) return void(t.useAlert ? alert(e.translations[t.language].errorExactQuery) : $('<div class="too_short"></div>').postcodifyAddClass("search_status").html(e.translations[t.language].errorExactQuery.replace(/\n/g, "<br>")).appendTo(a));
                        if (t.beforeSearch(n) !== !1) {
                            var m = $(window).scrollTop();
                            o.attr("disabled", "disabled");
                            var c;
                            navigator.userAgent && navigator.userAgent.match(/MSIE [5-8]\./) ? (o.text("."), c = setInterval(function() {
                                switch (o.text()) {
                                    case ".":
                                        o.text("..");
                                        break;
                                    case "..":
                                        o.text("...");
                                        break;
                                    case "...":
                                        o.text("....");
                                        break;
                                    case "....":
                                        o.text(".")
                                }
                            }, 160)) : (o.html('<img class="searching" alt="' + e.translations[t.language].msgSearch + '" src="' + e.searchProgress + '" />'), c = !1);
                            var s, u, f, h, d, p = function(a, r, i) {
                                u = (new Date).getTime(), t.currentRequestUrl = a;
                                var s = {
                                    url: a,
                                    data: {
                                        v: e.version,
                                        q: n,
                                        ref: t.overrideDomain ? t.overrideDomain : window.location.hostname,
                                        cdn: e.location
                                    },
                                    processData: !0,
                                    cache: !1,
                                    timeout: r,
                                    type: "GET",
                                    success: f,
                                    error: i,
                                    complete: function() {
                                        $(window).scrollTop(m), c !== !1 && clearTimeout(c), o.removeAttr("disabled").html(t.searchButtonContent)
                                    }
                                };
                                t.useCors && "undefined" != typeof XMLHttpRequest && "withCredentials" in new XMLHttpRequest ? s.dataType = "json" : (s.dataType = "jsonp", s.jsonpCallback = "postcodify_" + u.toString() + Math.random().toString().substr(2, 4)), $.ajax(s)
                            };
                            f = function(c, E, T) {
                                var C = ((new Date).getTime() - u) / 1e3;
                                if (i = !1, t.currentRequestUrl === t.apiBackup && (t.callBackupFirst = !0), t.afterSearch(n, c.results, c.lang, c.sort) !== !1) {
                                    if (c.error && c.error.toLowerCase().indexOf("database") > -1) t.currentRequestUrl === t.api && t.apiBackup && t.api !== t.apiBackup && (t.onBackup(), p(t.apiBackup, t.timeoutBackup, d));
                                    else if (c.error && c.error.toLowerCase().indexOf("quota") > -1) t.useAlert ? alert(e.translations[t.language].errorQuota) : (s = $('<div class="quota"></div>').postcodifyAddClass("search_status"), s.html(e.translations[t.language].errorQuota.replace(/\n/g, "<br>")), s.appendTo(a));
                                    else if (c.error) t.useAlert ? alert(e.translations[t.language].errorError) : (s = $('<div class="error"></div>').postcodifyAddClass("search_status"), s.html(e.translations[t.language].errorError.replace(/\n/g, "<br>")), s.appendTo(a)), r = null;
                                    else if (c.count < 1) t.useAlert ? alert(e.translations[t.language].errorEmpty) : (s = $('<div class="empty"></div>').postcodifyAddClass("search_status"), s.html(e.translations[t.language].errorEmpty.replace(/\n/g, "<br>")), s.appendTo(a));
                                    else if ("undefined" == typeof c.results[0].postcode5 && "undefined" == typeof c.results[0].other) t.useAlert ? alert(e.translations[t.language].errorVersion) : (s = $('<div class="error"></div>').postcodifyAddClass("search_status"), s.html(e.translations[t.language].errorVersion.replace(/\n/g, "<br>")), s.appendTo(a));
                                    else {
                                        var h;
                                        h = "undefined" != typeof c.lang && "EN" === c.lang ? "en" : "ko";
                                        for (var _ = 0; _ < c.count; _++) {
                                            var o = c.results[_];
                                            "undefined" == typeof o.postcode5 && "undefined" != typeof o.code5 && (o.postcode5 = o.code5, o.postcode6 = o.code6.replace(/[^0-9]/, ""), o.ko_common = o.address.base, o.ko_doro = o.address["new"], o.ko_jibeon = o.address.old, o.en_common = o.english.base, o.en_doro = o.english["new"], o.en_jibeon = o.english.old, o.building_id = o.dbid, o.building_name = o.address.building, o.building_nums = o.other.bldnum, o.other_addresses = o.other.others, o.road_id = o.other.roadid), o.postcode6 || (o.postcode6 = "000000");
                                            var l = $("<div></div>").postcodifyAddClass("search_result");
                                            l.data("dbid", o.building_id), l.data("code5", o.postcode5), l.data("code6", o.postcode6.substr(0, 3) + "-" + o.postcode6.substr(3, 3)), l.data("postcode5", o.postcode5), l.data("postcode6", o.postcode6.substr(0, 3) + "-" + o.postcode6.substr(3, 3)), l.data("address", o.ko_common + " " + o.ko_doro), l.data("jibeon_address", o.ko_common + " " + o.ko_jibeon), l.data("english_address", ("" === o.en_doro ? "" : o.en_doro + ", ") + o.en_common), l.data("english_jibeon_address", ("" === o.en_jibeon ? "" : o.en_jibeon + ", ") + o.en_common), l.data("building_id", o.building_id), l.data("building_name", o.building_name), l.data("building_nums", o.building_nums), l.data("extra_info_long", o.ko_jibeon + ("" === o.building_name ? "" : ", " + o.building_name)), l.data("extra_info_short", o.ko_jibeon.replace(/\s.+$/, "") + ("" === o.building_name ? "" : ", " + o.building_name)), l.data("extra_info_nums", c.nums), l.data("other_addresses", o.other_addresses), l.data("road_id", o.road_id);
                                            var m, f;
                                            "en" === h ? "undefined" != typeof c.sort && "JIBEON" === c.sort ? (m = l.data("english_jibeon_address"), f = o.en_doro) : (m = l.data("english_address"), f = o.en_jibeon) : ("undefined" != typeof c.sort && "JIBEON" === c.sort ? (m = l.data("jibeon_address"), f = o.ko_doro) : (m = l.data("address"), f = o.ko_jibeon), "" !== o.building_name && null !== o.building_name && (f += ", " + o.building_name, t.hideBuildingNums || "" === o.building_nums || (f += " " + o.building_nums)));
                                            var y = $('<a class="selector" href="#"></a>');
                                            y.append($('<span class="address_info"></span>').text(m)), null !== f && "" !== f && y.append($('<span class="extra_info"></span>').append("(" + f + ")")), t.forceDisplayPostcode5 ? $('<div class="code"></div>').text(l.data("postcode5")).appendTo(l) : t.forceDisplayPostcode6 ? $('<div class="code"></div>').text(l.data("postcode6")).appendTo(l) : ($('<div class="code6"></div>').text(l.data("postcode6")).appendTo(l), $('<div class="code5"></div>').text(l.data("postcode5")).appendTo(l)), $('<div class="address"></div>').append(y).appendTo(l);
                                            var k = l.data("other_addresses");
                                            if ("" !== k) {
                                                var v = $('<a href="#" class="show_old_addresses">\u25bc</a>');
                                                v.attr("title", e.translations[h].msgShowOthers), t.hideOldAddresses || v.css("display", "none"), v.appendTo(l.find("div.address"));
                                                var w = $('<div class="old_addresses"></div>').text(k);
                                                t.hideOldAddresses && w.css("display", "none"), w.appendTo(l)
                                            }
                                            if (t.mapLinkProvider) {
                                                var A;
                                                A = "undefined" != typeof e.mapProviders[t.mapLinkProvider] ? e.mapProviders[t.mapLinkProvider] : t.mapLinkProvider, A = A.replace("$JUSO", encodeURIComponent(l.data("address")).replace(/%20/g, "+")), A = A.replace("$JIBEON", encodeURIComponent(l.data("jibeon_address")).replace(/%20/g, "+"));
                                                var S = null !== t.mapLinkContent ? t.mapLinkContent : e.translations[h].msgMap,
                                                    B = $('<a target="_blank"></a>').attr("href", A).html(S);
                                                $('<div class="map_link"></div>').append(B).appendTo(l)
                                            }
                                            l.appendTo(a)
                                        }
                                        if (!t.hideSummary) {
                                            var g = $('<div class="summary"></div>').postcodifyAddClass("search_status");
                                            g.append('<div class="result_count">' + e.translations[h].msgResultCount + ": <span>" + c.count + "</span></div>"), g.append('<div class="search_time">' + e.translations[h].msgSearchTime + ": <span>" + Math.round(1e3 * c.time) + "ms</span></div>"), g.append('<div class="network_time">' + e.translations[h].msgNetworkTime + ": <span>" + Math.round(1e3 * (C - parseFloat(c.time))) + "ms</span></div>"), g.appendTo(a)
                                        }
                                        c.count >= 100 && (t.useAlert ? alert(e.translations[h].errorTooMany) : (s = $('<div class="too_many"></div>').postcodifyAddClass("search_status"), s.html(e.translations[h].errorTooMany.replace(/\n/g, "<br>")), s.insertBefore(a.find("div.postcodify_search_result").first())))
                                    }
                                    if ("undefined" != typeof c.msg && "" !== c.msg) {
                                        var b = $('<div class="message"></div>').postcodifyAddClass("search_status");
                                        b.text(c.msg), a.find("div.too_many").size() ? b.insertBefore(a.find("div.too_many").first()) : b.insertBefore(a.find("div.postcodify_search_result").first())
                                    }
                                    c.error || t.onSuccess(), t.onComplete(), !c.error && 1 == c.count && c.nums && t.autoSelect && a.find("div.postcodify_search_result a.selector").first().trigger("click")
                                }
                            }, h = function(e, s, a) {
                                t.apiBackup ? (t.onBackup(), p(t.apiBackup, t.timeoutBackup, d)) : d(e, s, a)
                            }, d = function(e, s, o) {
                                a.find("div.postcodify_search_status.error").show(), r = null, i = !1, t.onError(), t.onComplete()
                            }, i = !0, t.apiBackup && t.callBackupFirst ? p(t.apiBackup, t.timeoutBackup, d) : p(t.api, t.timeout, h)
                        }
                    }
                }), a.on("click", "div.code6,div.code5,div.old_addresses", function(e) {
                    e.preventDefault(), e.stopPropagation(), $(this).parent().find("a.selector").click()
                }), a.on("click", "a.selector", function(l) {
                    l.preventDefault();
                    var e = $(this).parents("div.postcodify_search_result");
                    if (t.beforeSelect(e) !== !1) {
                        var n = e.data("address"),
                            r = e.data("jibeon_address"),
                            i = e.data("english_address"),
                            d = e.data("english_jibeon_address");
                        if (e.data("extra_info_nums")) {
                            var a = e.data("extra_info_nums"),
                                o = /[0-9]+(-[0-9]+)? ~ [0-9]+(-[0-9]+)?/;
                            n = n.replace(o, a), r = r.replace(o, a), i = i.replace(o, a), d = d.replace(o, a)
                        }
                        if (t.insertPostcode6 && $(t.insertPostcode6).val(e.data("code6")), t.insertPostcode5 && $(t.insertPostcode5).val(e.data("code5")), t.insertPostcode && $(t.insertPostcode).val(e.data("code5")), t.insertAddress && $(t.insertAddress).val(n), t.insertJibeonAddress && $(t.insertJibeonAddress).val(r), t.insertEnglishAddress && $(t.insertEnglishAddress).val(i), t.insertEnglishJibeonAddress && $(t.insertEnglishJibeonAddress).val(d), t.insertBuildingId && $(t.insertBuildingId).val(e.data("building_id")), t.insertBuildingName && $(t.insertBuildingName).val(e.data("building_name")), t.insertBuildingNums && $(t.insertBuildingNums).val(e.data("building_nums")), t.insertOtherAddresses && $(t.insertOtherAddresses).val(e.data("other_addresses")), t.insertExtraInfo) {
                            var s = t.useFullJibeon ? e.data("extra_info_long") : e.data("extra_info_short");
                            s.length && (s = "(" + s + ")"), t.insertExtraInfo === t.insertAddress ? $(t.insertExtraInfo).val($(t.insertExtraInfo).val() + "\n" + s) : $(t.insertExtraInfo).val(s)
                        }
                        t.afterSelect(e) !== !1 && t.insertDetails && t.focusDetails && $(t.insertDetails).focus()
                    }
                }), a.on("click", "a.show_old_addresses", function(s) {
                    s.preventDefault();
                    var e = $(this).parent().siblings(".old_addresses");
                    e.is(":visible") ? ($(this).html("&#9660;"), e.hide()) : ($(this).html("&#9650;"), e.show())
                }), t.focusKeyword && l.focus(), t.onReady(), this
            })
        }, $.fn.postcodifyPopUp = function(s) {
            return this.each(function() {
                var i, a, f, u;
                s = "undefined" != typeof s ? s : {}, u = "undefined" != typeof s.onSelect ? s.onSelect : function() {}, a = $(s.container || s.inputParent ? s.container ? s.container : s.inputParent : document.body);
                var r = $('<div class="postcodify_popup_background"></div>'),
                    t = $('<div class="postcodify_popup_layer" data-version="' + e.version + '"></div>');
                navigator.userAgent.match(/MSIE 6\./) && (r.addClass("ie6fix"), t.addClass("ie6fix"));
                var c = ($('<div class="postcodify_controls"></div>').appendTo(t), $('<div class="postcodify_displays"></div>').appendTo(t));
                c.append('<div class="postcodify_results"></div>');
                var l = $('<div class="postcodify_placeholder"></div>').text("\uac80\uc0c9\ud560 \uc8fc\uc18c\ub97c \uc5ec\uae30\uc5d0 \uc785\ub825\ud574 \uc8fc\uc138\uc694"),
                    h = $('<div class="postcodify_curve_slice"></div>'),
                    p = $('<div class="postcodify_button_area"></div>'),
                    A = $('<button class="close_button">&times;</button>').appendTo(p),
                    m = $('<div class="postcodify_logo">P O W E R E D &nbsp; B Y &nbsp; <a href="http://postcodify.poesis.kr/">P O S T C O D I F Y</a></div>');
                m.appendTo(t);
                var n = $("<table></table>");
                n.append("<tr><th>\uad6c\ubd84</th><th>\uc0ac\uc6a9\ud560 \uac80\uc0c9\uc5b4</th><th>\uac80\uc0c9 \uc608</th></tr>"), n.append("<tr><td>\ub3c4\ub85c\uba85\uc8fc\uc18c</td><td>\ub3c4\ub85c\uba85 + \ubc88\ud638</td><td>\uc138\uc885\ub300\ub85c 110</td></tr>"), n.append("<tr><td>\uc9c0\ubc88\uc8fc\uc18c</td><td>\ub3d9\xb7\ub9ac + \ubc88\uc9c0</td><td>\ubd80\uc0b0 \uc5f0\uc0b0\ub3d9 1000</td></tr>"), n.append('<tr class="postcodify_building_search"><td>\uac74\ubb3c\uba85</td><td>\ube4c\ub529 \ub610\ub294 \uc544\ud30c\ud2b8\ub2e8\uc9c0\uba85</td><td>\uc218\uace1\ub3d9 \uc8fc\uacf53\ucc28</td></tr>'), n.append("<tr><td>\uc0ac\uc11c\ud568</td><td>\uc0ac\uc11c\ud568\uba85 + \ubc88\ud638</td><td>\uad11\ud654\ubb38\uc6b0\uccb4\uad6d\uc0ac\uc11c\ud568 123-4</td></tr>");
                var d = $("<ul></ul>");
                d.append("<li><span>\uc2dc\xb7\uad70\xb7\uad6c\xb7\uc74d\xb7\uba74 \ub4f1\uc740 \uc4f0\uc9c0 \uc54a\uc544\ub3c4 \ub418\uc9c0\ub9cc,</span> <span>\uc4f0\uc2e4 \uacbd\uc6b0 \ubc18\ub4dc\uc2dc \ub744\uc5b4\uc4f0\uae30\ub97c \ud574 \uc8fc\uc138\uc694.</span></li>"), d.append('<li><span>\ub3c4\ub85c\uba85\uc5d0 \ud3ec\ud568\ub41c "\xd7\xd7\ubc88\uae38" \ub4f1 \uc22b\uc790\ub3c4</span> <span>\uc78a\uc9c0 \ub9d0\uace0 \uc368 \uc8fc\uc138\uc694.</span></li>'), d.append("<li><span>\uac74\ubb3c\uba85\ubcf4\ub2e4\ub294 \ubc88\ud638\uac00 \ud3ec\ud568\ub41c \uc815\ud655\ud55c \uc8fc\uc18c\ub85c</span> <span>\uac80\uc0c9\ud558\ub294 \uac83\uc774 \ube60\ub974\uace0 \uc815\ud655\ud569\ub2c8\ub2e4.</span></li>");
                var o = $('<div class="postcodify_help"></div>');
                return o.append("<p>\uc6b0\ud3b8\ubc88\ud638 \uac80\uc0c9 \uc694\ub839</p>"), o.append(n), o.append("<p>\uc815\ud655\ud55c \uac80\uc0c9\uc744 \uc704\ud55c \ud301</p>"), o.append(d), o.appendTo(c), s.requireExactQuery && o.find("tr.postcodify_building_search").remove(), r.hide().appendTo(document.body), t.hide().appendTo(document.body), f = function() {
                    t.data("initialized", "Y"), t.find("div.postcodify_results").postcodify($.extend({
                        controls: t.find("div.postcodify_controls"),
                        insertPostcode6: a.find(".postcodify_postcode6"),
                        insertPostcode5: a.find(".postcodify_postcode5"),
                        insertPostcode: a.find(".postcodify_postcode"),
                        insertAddress: a.find(".postcodify_address"),
                        insertDetails: a.find(".postcodify_details"),
                        insertExtraInfo: a.find(".postcodify_extra_info"),
                        insertJibeonAddress: a.find(".postcodify_jibeon_address"),
                        insertEnglishAddress: a.find(".postcodify_english_address"),
                        insertEnglishJibeonAddress: a.find(".postcodify_english_jibeon_address"),
                        insertBuildingId: a.find(".postcodify_address_id,.postcodify_building_id"),
                        insertBuildingName: a.find(".postcodify_building_name"),
                        insertBuildingNums: a.find(".postcodify_building_nums"),
                        insertOtherAddresses: a.find(".postcodify_other_addresses"),
                        mapLinkProvider: "daum",
                        hideOldAddresses: !1,
                        afterSelect: function(e) {
                            a.find(".postcodify_postcode6_1").val(e.data("code6").substr(0, 3)), a.find(".postcodify_postcode6_2").val(e.data("code6").substr(4, 3)), u(e), i()
                        }
                    }, s)), l.prependTo(t.find("div.postcodify_search_controls")).on("click", function() {
                        t.find("input.keyword").focus()
                    }), t.find("input.keyword").on("focusin focusout keydown keyup keypress input", function() {
                        "" === $(this).val() ? l.show() : l.hide()
                    }), h.appendTo(t.find("div.postcodify_controls")), p.appendTo(t.find("div.postcodify_controls")), t.find("button.search_button").detach().prependTo(p)
                }, $(window).resize(function() {
                    var e = $(window).width(),
                        s = $(window).height();
                    t.removeClass("fill_horizontally").removeClass("fill_vertically").removeClass("full_screen"), 660 >= e && t.addClass("fill_horizontally").addClass("fill_vertically"), 660 >= s && t.addClass("fill_vertically"), "ontouchstart" in window && (t.hasClass("fill_horizontally") || t.hasClass("fill_vertically")) && t.addClass("full_screen"), l.text(e >= 540 ? "\uac80\uc0c9\ud560 \uc8fc\uc18c\ub97c \uc5ec\uae30\uc5d0 \uc785\ub825\ud574 \uc8fc\uc138\uc694" : "\uac80\uc0c9\ud560 \uc8fc\uc18c \uc785\ub825"), c.height(t.height() - 73)
                }), 
                    "Y" != t.data("initialized") && f(), r.show(), t.show().find("input.keyword").focus(), $(window).triggerHandler("resize")
                , i = function() {
                    r.hide(), t.hide()
                }, A.click(function() {
                    i()
                }), r.click(function() {
                    i()
                }), $(window).keyup(function(e) {
                    27 == e.keyCode && t.is(":visible") && i()
                }), this
            })
        }, $.fn.postcodifyAddClass = function(e) {
            return this.addClass("postcodify_" + e).addClass("postcode_" + e)
        }, e.freeAPI = {
            defaultUrl: "//api.poesis.kr/post/search.php",
            backupUrl: "//api.poesis.co.kr/post/search.php"
        }, e.mapProviders = {
            daum: "http://map.daum.net/?map_type=TYPE_MAP&urlLevel=3&q=$JUSO",
            naver: "http://map.naver.com/?mapMode=0&dlevel=12&query=$JUSO",
            google: "http://www.google.com/maps/place/" + encodeURIComponent("\ub300\ud55c\ubbfc\uad6d") + "+$JUSO"
        }, e.translations = {
            ko: {
                errorExactQuery: "\uc815\ud655\ud55c \ub3c4\ub85c\uba85+\uac74\ubb3c\ubc88\ud638 \ub610\ub294 \ub3d9\xb7\ub9ac+\ubc88\uc9c0\ub85c \uac80\uc0c9\ud574 \uc8fc\uc2ed\uc2dc\uc624.\n\uc608: \uc138\uc885\ub300\ub85c 110, \uc5f0\uc9c0\ub3d9 219-2, \uc0ac\uc11c\ud568 123-45",
                errorError: "\uac80\uc0c9 \uc11c\ubc84\uc640 \ud1b5\uc2e0 \uc911 \uc624\ub958\uac00 \ubc1c\uc0dd\ud558\uc600\uc2b5\ub2c8\ub2e4.\n\uc7a0\uc2dc \ud6c4 \ub2e4\uc2dc \uc2dc\ub3c4\ud574 \uc8fc\uc2dc\uae30 \ubc14\ub78d\ub2c8\ub2e4.",
                errorEmpty: "\uac80\uc0c9 \uacb0\uacfc\uac00 \uc5c6\uc2b5\ub2c8\ub2e4.\n\uc815\ud655\ud55c \ub3c4\ub85c\uba85+\uac74\ubb3c\ubc88\ud638 \ub610\ub294 \ub3d9\xb7\ub9ac+\ubc88\uc9c0\ub85c \uac80\uc0c9\ud574 \uc8fc\uc2dc\uace0,\n\ub2e4\ub978 \uac80\uc0c9\uc5b4 \uc0ac\uc6a9\uc2dc \ub744\uc5b4\uc4f0\uae30\uc5d0 \uc720\uc758\ud558\uc2ed\uc2dc\uc624.",
                errorQuota: "\uc77c\uc77c \ud5c8\uc6a9 \ucffc\ub9ac\uc218\ub97c \ucd08\uacfc\ud558\uc600\uc2b5\ub2c8\ub2e4.\n\uad00\ub9ac\uc790\uc5d0\uac8c \ubb38\uc758\ud574 \uc8fc\uc2dc\uae30 \ubc14\ub78d\ub2c8\ub2e4.",
                errorVersion: "\uac80\uc0c9 \uc11c\ubc84\uc758 \ubc84\uc804\uc774 \ub0ae\uc544 \uc774 \uac80\uc0c9\ucc3d\uacfc \ud638\ud658\ub418\uc9c0 \uc54a\uc2b5\ub2c8\ub2e4.",
                errorTooShort: "\uac80\uc0c9\uc5b4\ub294 3\uae00\uc790 \uc774\uc0c1 \uc785\ub825\ud574 \uc8fc\uc2ed\uc2dc\uc624.",
                errorTooMany: "\uac80\uc0c9 \uacb0\uacfc\uac00 \ub108\ubb34 \ub9ce\uc544 100\uac74\ub9cc \ud45c\uc2dc\ud569\ub2c8\ub2e4.\n\uc815\ud655\ud55c \ub3c4\ub85c\uba85\uacfc \uac74\ubb3c\ubc88\ud638 \ub610\ub294 \ub3d9\xb7\ub9ac\uc640 \ubc88\uc9c0\ub85c \uac80\uc0c9\ud574 \uc8fc\uc2dc\uae30 \ubc14\ub78d\ub2c8\ub2e4.",
                msgResultCount: "\uac80\uc0c9 \uacb0\uacfc",
                msgSearchTime: "\uc18c\uc694 \uc2dc\uac04",
                msgNetworkTime: "\ud1b5\uc2e0 \uc9c0\uc5f0",
                msgSeeOthers: "\uad00\ub828\uc9c0\ubc88 \ubcf4\uae30",
                msgKeywords: "\uac80\uc0c9 \ud0a4\uc6cc\ub4dc",
                msgSearch: "\uac80\uc0c9",
                msgMap: "\uc9c0\ub3c4"
            },
            en: {
                errorExactQuery: "Please enter the exact name of your street, as well as the number(s).\nExample: 110 Sejong-daero, 219-2 Yeonji-dong, P.O.Box 123-45",
                errorError: "An error occurred while communicating to the search server.\nPlease try again later.",
                errorEmpty: "No addresses matched your search.\nPlease enter the exact legal name of your street, as well as the number(s).",
                errorQuota: "This website and/or your IP address has exceeded its daily search quota.\nPlease contact the administrator.",
                errorVersion: "The version of the search server is not compatible with this search function.",
                errorTooShort: "Please enter at least 3 characters.",
                errorTooMany: "Your search returned too many results. Only the first 100 items are shown below.\nPlease narrow down your search by adding the number(s).",
                msgResultCount: "Results",
                msgSearchTime: "Time taken",
                msgNetworkTime: "Network delay",
                msgSeeOthers: "See related addresses",
                msgKeywords: "Search keywords",
                msgSearch: "Search",
                msgMap: "Map"
            }
        }, e.searchProgress = "data:image/gif;base64,R0lGODlhEAALAPQAAP///yIiIt7e3tbW1uzs7CcnJyIiIklJSZKSknV1dcPDwz8/P2JiYpmZmXh4eMbGxkJCQiUlJWVlZenp6d3d3fX19VJSUuDg4PPz87+/v6ysrNDQ0PDw8AAAAAAAAAAAACH/C05FVFNDQVBFMi4wAwEAAAAh/hpDcmVhdGVkIHdpdGggYWpheGxvYWQuaW5mbwAh+QQJCwAAACwAAAAAEAALAAAFLSAgjmRpnqSgCuLKAq5AEIM4zDVw03ve27ifDgfkEYe04kDIDC5zrtYKRa2WQgAh+QQJCwAAACwAAAAAEAALAAAFJGBhGAVgnqhpHIeRvsDawqns0qeN5+y967tYLyicBYE7EYkYAgAh+QQJCwAAACwAAAAAEAALAAAFNiAgjothLOOIJAkiGgxjpGKiKMkbz7SN6zIawJcDwIK9W/HISxGBzdHTuBNOmcJVCyoUlk7CEAAh+QQJCwAAACwAAAAAEAALAAAFNSAgjqQIRRFUAo3jNGIkSdHqPI8Tz3V55zuaDacDyIQ+YrBH+hWPzJFzOQQaeavWi7oqnVIhACH5BAkLAAAALAAAAAAQAAsAAAUyICCOZGme1rJY5kRRk7hI0mJSVUXJtF3iOl7tltsBZsNfUegjAY3I5sgFY55KqdX1GgIAIfkECQsAAAAsAAAAABAACwAABTcgII5kaZ4kcV2EqLJipmnZhWGXaOOitm2aXQ4g7P2Ct2ER4AMul00kj5g0Al8tADY2y6C+4FIIACH5BAkLAAAALAAAAAAQAAsAAAUvICCOZGme5ERRk6iy7qpyHCVStA3gNa/7txxwlwv2isSacYUc+l4tADQGQ1mvpBAAIfkECQsAAAAsAAAAABAACwAABS8gII5kaZ7kRFGTqLLuqnIcJVK0DeA1r/u3HHCXC/aKxJpxhRz6Xi0ANAZDWa+kEAA7AAAAAAAAAAAA"
    }
})(jQuery);