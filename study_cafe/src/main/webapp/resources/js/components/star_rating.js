/*!
 * bootstrap-star-rating v4.0.6
 * http://plugins.krajee.com/star-rating
 *
 * Author: Kartik Visweswaran
 * Copyright: 2013 - 2019, Kartik Visweswaran, Krajee.com
 *
 * Licensed under the BSD 3-Clause
 * https://github.com/kartik-v/bootstrap-star-rating/blob/master/LICENSE.md
 */
! function(e) {
    "use strict";
    "function" == typeof define && define.amd ? define(["jquery"], e) : "object" == typeof module && module.exports ? module.exports = e(require("jquery")) : e(window.jQuery)
}(function(e) {
    "use strict";
    e.fn.ratingLocales = {}, e.fn.ratingThemes = {};
    var t, a;
    t = {
        NAMESPACE: ".rating",
        DEFAULT_MIN: 0,
        DEFAULT_MAX: 5,
        DEFAULT_STEP: .5,
        isEmpty: function(t, a) {
            return null === t || void 0 === t || 0 === t.length || a && "" === e.trim(t)
        },
        getCss: function(e, t) {
            return e ? " " + t : ""
        },
        addCss: function(e, t) {
            e.removeClass(t).addClass(t)
        },
        getDecimalPlaces: function(e) {
            var t = ("" + e).match(/(?:\.(\d+))?(?:[eE]([+-]?\d+))?$/);
            return t ? Math.max(0, (t[1] ? t[1].length : 0) - (t[2] ? +t[2] : 0)) : 0
        },
        applyPrecision: function(e, t) {
            return parseFloat(e.toFixed(t))
        },
        handler: function(e, a, n, i, r) {
            var l = r ? a : a.split(" ").join(t.NAMESPACE + " ") + t.NAMESPACE;
            i || e.off(l), e.on(l, n)
        }
    }, a = function(t, a) {
        var n = this;
        n.$element = e(t), n._init(a)
    }, a.prototype = {
        constructor: a,
        _parseAttr: function(e, a) {
            var n, i, r, l, s = this,
                o = s.$element,
                c = o.attr("type");
            if ("range" === c || "number" === c) {
                switch (i = a[e] || o.data(e) || o.attr(e), e) {
                    case "min":
                        r = t.DEFAULT_MIN;
                        break;
                    case "max":
                        r = t.DEFAULT_MAX;
                        break;
                    default:
                        r = t.DEFAULT_STEP
                }
                n = t.isEmpty(i) ? r : i, l = parseFloat(n)
            } else l = parseFloat(a[e]);
            return isNaN(l) ? r : l
        },
        _parseValue: function(e) {
            var t = this,
                a = parseFloat(e);
            return isNaN(a) && (a = t.clearValue), !t.zeroAsNull || 0 !== a && "0" !== a ? a : null
        },
        _setDefault: function(e, a) {
            var n = this;
            t.isEmpty(n[e]) && (n[e] = a)
        },
        _initSlider: function(e) {
            var a = this,
                n = a.$element.val();
            a.initialValue = t.isEmpty(n) ? 0 : n, a._setDefault("min", a._parseAttr("min", e)), a._setDefault("max", a._parseAttr("max", e)), a._setDefault("step", a._parseAttr("step", e)), (isNaN(a.min) || t.isEmpty(a.min)) && (a.min = t.DEFAULT_MIN), (isNaN(a.max) || t.isEmpty(a.max)) && (a.max = t.DEFAULT_MAX), (isNaN(a.step) || t.isEmpty(a.step) || 0 === a.step) && (a.step = t.DEFAULT_STEP), a.diff = a.max - a.min
        },
        _initHighlight: function(e) {
            var t, a = this,
                n = a._getCaption();
            e || (e = a.$element.val()), t = a.getWidthFromValue(e) + "%", a.$filledStars.width(t), a.cache = {
                caption: n,
                width: t,
                val: e
            }
        },
        _getContainerCss: function() {
            var e = this;
            return "rating-container" + t.getCss(e.theme, "theme-" + e.theme) + t.getCss(e.rtl, "rating-rtl") + t.getCss(e.size, "rating-" + e.size) + t.getCss(e.animate, "rating-animate") + t.getCss(e.disabled || e.readonly, "rating-disabled") + t.getCss(e.containerClass, e.containerClass) + (e.displayOnly ? " is-display-only" : "")
        },
        _checkDisabled: function() {
            var e = this,
                t = e.$element,
                a = e.options;
            e.disabled = void 0 === a.disabled ? t.attr("disabled") || !1 : a.disabled, e.readonly = void 0 === a.readonly ? t.attr("readonly") || !1 : a.readonly, e.inactive = e.disabled || e.readonly, t.attr({
                disabled: e.disabled,
                readonly: e.readonly
            })
        },
        _addContent: function(e, t) {
            var a = this,
                n = a.$container,
                i = "clear" === e;
            return a.rtl ? i ? n.append(t) : n.prepend(t) : i ? n.prepend(t) : n.append(t)
        },
        _generateRating: function() {
            var a, n, i, r = this,
                l = r.$element;
            n = r.$container = e(document.createElement("div")).insertBefore(l), t.addCss(n, r._getContainerCss()), r.$rating = a = e(document.createElement("div")).attr("class", "rating-stars").appendTo(n).append(r._getStars("empty")).append(r._getStars("filled")), r.$emptyStars = a.find(".empty-stars"), r.$filledStars = a.find(".filled-stars"), r._renderCaption(), r._renderClear(), r._initHighlight(), r._initCaptionTitle(), n.append(l), r.rtl && (i = Math.max(r.$emptyStars.outerWidth(), r.$filledStars.outerWidth()), r.$emptyStars.width(i)), l.appendTo(a)
        },
        _getCaption: function() {
            var e = this;
            return e.$caption && e.$caption.length ? e.$caption.html() : e.defaultCaption
        },
        _setCaption: function(e) {
            var t = this;
            t.$caption && t.$caption.length && t.$caption.html(e)
        },
        _renderCaption: function() {
            var a, n = this,
                i = n.$element.val(),
                r = n.captionElement ? e(n.captionElement) : "";
            if (n.showCaption) {
                if (a = n.fetchCaption(i), r && r.length) return t.addCss(r, "caption"), r.html(a), void(n.$caption = r);
                n._addContent("", ""), n.$caption = n.$container.find("")
            }
        },
        _renderClear: function() {
            var a, n = this,
                i = n.clearElement ? e(n.clearElement) : "";
            if (n.showClear) {
                if (a = n._getClearClass(), i.length) return t.addCss(i, a), i.attr({
                    title: n.clearButtonTitle
                }).html(n.clearButton), void(n.$clear = i);
                n._addContent("", ""), n.$clear = n.$container.find("")
            }
        },
        _getClearClass: function() {
            var e = this;
            return e.clearButtonBaseClass + " " + (e.inactive ? "" : e.clearButtonActiveClass)
        },
        _toggleHover: function(e) {
            var t, a, n, i = this;
            e && (i.hoverChangeStars && (t = i.getWidthFromValue(i.clearValue), a = e.val <= i.clearValue ? t + "%" : e.width, i.$filledStars.css("width", a)), i.hoverChangeCaption && (n = e.val <= i.clearValue ? i.fetchCaption(i.clearValue) : e.caption, n && i._setCaption(n + "")))
        },
        _init: function(t) {
            var a, n = this,
                i = n.$element.addClass("rating-input");
            return n.options = t, e.each(t, function(e, t) {
                n[e] = t
            }), (n.rtl || "rtl" === i.attr("dir")) && (n.rtl = !0, i.attr("dir", "rtl")), n.starClicked = !1, n.clearClicked = !1, n._initSlider(t), n._checkDisabled(), n.displayOnly && (n.inactive = !0, n.showClear = !1, n.hoverEnabled = !1, n.hoverChangeCaption = !1, n.hoverChangeStars = !1), n._generateRating(), n._initEvents(), n._listen(), a = n._parseValue(i.val()), i.val(a), i.removeClass("rating-loading")
        },
        _initCaptionTitle: function() {
            var t, a = this;
            a.showCaptionAsTitle && (t = a.fetchCaption(a.$element.val()), a.$rating.attr("title", e(t).text()))
        },
        _trigChange: function(e) {
            var t = this;
            t._initCaptionTitle(), t.$element.trigger("change").trigger("rating:change", e)
        },
        _initEvents: function() {
            var e = this;
            e.events = {
                _getTouchPosition: function(a) {
                    var n = t.isEmpty(a.pageX) ? a.originalEvent.touches[0].pageX : a.pageX;
                    return n - e.$rating.offset().left
                },
                _listenClick: function(e, t) {
                    return e.stopPropagation(), e.preventDefault(), e.handled === !0 ? !1 : (t(e), void(e.handled = !0))
                },
                _noMouseAction: function(t) {
                    return !e.hoverEnabled || e.inactive || t && t.isDefaultPrevented()
                },
                initTouch: function(a) {
                    var n, i, r, l, s, o, c, u, d = e.clearValue || 0,
                        p = "ontouchstart" in window || window.DocumentTouch && document instanceof window.DocumentTouch;
                    p && !e.inactive && (n = a.originalEvent, i = t.isEmpty(n.touches) ? n.changedTouches : n.touches, r = e.events._getTouchPosition(i[0]), "touchend" === a.type ? (e._setStars(r), u = [e.$element.val(), e._getCaption()], e._trigChange(u), e.starClicked = !0) : (l = e.calculate(r), s = l.val <= d ? e.fetchCaption(d) : l.caption, o = e.getWidthFromValue(d), c = l.val <= d ? o + "%" : l.width, e._setCaption(s), e.$filledStars.css("width", c)))
                },
                starClick: function(t) {
                    var a, n;
                    e.events._listenClick(t, function(t) {
                        return e.inactive ? !1 : (a = e.events._getTouchPosition(t), e._setStars(a), n = [e.$element.val(), e._getCaption()], e._trigChange(n), void(e.starClicked = !0))
                    })
                },
                clearClick: function(t) {
                    e.events._listenClick(t, function() {
                        e.inactive || (e.clear(), e.clearClicked = !0)
                    })
                },
                starMouseMove: function(t) {
                    var a, n;
                    e.events._noMouseAction(t) || (e.starClicked = !1, a = e.events._getTouchPosition(t), n = e.calculate(a), e._toggleHover(n), e.$element.trigger("rating:hover", [n.val, n.caption, "stars"]))
                },
                starMouseLeave: function(t) {
                    var a;
                    e.events._noMouseAction(t) || e.starClicked || (a = e.cache, e._toggleHover(a), e.$element.trigger("rating:hoverleave", ["stars"]))
                },
                clearMouseMove: function(t) {
                    var a, n, i, r;
                    !e.events._noMouseAction(t) && e.hoverOnClear && (e.clearClicked = !1, a = '<span class="' + e.clearCaptionClass + '">' + e.clearCaption + "</span>", n = e.clearValue, i = e.getWidthFromValue(n) || 0, r = {
                        caption: a,
                        width: i,
                        val: n
                    }, e._toggleHover(r), e.$element.trigger("rating:hover", [n, a, "clear"]))
                },
                clearMouseLeave: function(t) {
                    var a;
                    e.events._noMouseAction(t) || e.clearClicked || !e.hoverOnClear || (a = e.cache, e._toggleHover(a), e.$element.trigger("rating:hoverleave", ["clear"]))
                },
                resetForm: function(t) {
                    t && t.isDefaultPrevented() || e.inactive || e.reset()
                }
            }
        },
        _listen: function() {
            var a = this,
                n = a.$element,
                i = n.closest("form"),
                r = a.$rating,
                l = a.$clear,
                s = a.events;
            return t.handler(r, "touchstart touchmove touchend", e.proxy(s.initTouch, a)), t.handler(r, "click touchstart", e.proxy(s.starClick, a)), t.handler(r, "mousemove", e.proxy(s.starMouseMove, a)), t.handler(r, "mouseleave", e.proxy(s.starMouseLeave, a)), a.showClear && l.length && (t.handler(l, "click touchstart", e.proxy(s.clearClick, a)), t.handler(l, "mousemove", e.proxy(s.clearMouseMove, a)), t.handler(l, "mouseleave", e.proxy(s.clearMouseLeave, a))), i.length && t.handler(i, "reset", e.proxy(s.resetForm, a), !0), n
        },
        _getStars: function(e) {
            var t, a = this,
                n = '<span class="' + e + '-stars">';
            for (t = 1; t <= a.stars; t++) n += '<span class="star">' + a[e + "Star"] + "</span>";
            return n + "</span>"
        },
        _setStars: function(e) {
            var t = this,
                a = arguments.length ? t.calculate(e) : t.calculate(),
                n = t.$element,
                i = t._parseValue(a.val);
            return n.val(i), t.$filledStars.css("width", a.width), t._setCaption(a.caption), t.cache = a, n
        },
        showStars: function(e) {
            var t = this,
                a = t._parseValue(e);
            return t.$element.val(a), t._initCaptionTitle(), t._setStars()
        },
        calculate: function(e) {
            var a = this,
                n = t.isEmpty(a.$element.val()) ? 0 : a.$element.val(),
                i = arguments.length ? a.getValueFromPosition(e) : n,
                r = a.fetchCaption(i),
                l = a.getWidthFromValue(i);
            return l += "%", {
                caption: r,
                width: l,
                val: i
            }
        },
        getValueFromPosition: function(e) {
            var a, n, i = this,
                r = t.getDecimalPlaces(i.step),
                l = i.$rating.width();
            return n = i.diff * e / (l * i.step), n = i.rtl ? Math.floor(n) : Math.ceil(n), a = t.applyPrecision(parseFloat(i.min + n * i.step), r), a = Math.max(Math.min(a, i.max), i.min), i.rtl ? i.max - a : a
        },
        getWidthFromValue: function(e) {
            var t, a, n = this,
                i = n.min,
                r = n.max,
                l = n.$emptyStars;
            return !e || i >= e || i === r ? 0 : (a = l.outerWidth(), t = a ? l.width() / a : 1, e >= r ? 100 : (e - i) * t * 100 / (r - i))
        },
        fetchCaption: function(e) {
            var a, n, i, r, l, s = this,
                o = parseFloat(e) || s.clearValue,
                c = s.starCaptions,
                u = s.starCaptionClasses,
                d = s.getWidthFromValue(o);
            return o && o !== s.clearValue && (o = t.applyPrecision(o, t.getDecimalPlaces(s.step))), r = "function" == typeof u ? u(o, d) : u[o], i = "function" == typeof c ? c(o, d) : c[o], n = t.isEmpty(i) ? s.defaultCaption.replace(/\{rating}/g, o) : i, a = t.isEmpty(r) ? s.clearCaptionClass : r, l = o === s.clearValue ? s.clearCaption : n, '<span class="' + a + '">' + l + "</span>"
        },
        destroy: function() {
            var a = this,
                n = a.$element;
            return t.isEmpty(a.$container) || a.$container.before(n).remove(), e.removeData(n.get(0)), n.off("rating").removeClass("rating rating-input")
        },
        create: function(e) {
            var t = this,
                a = e || t.options || {};
            return t.destroy().rating(a)
        },
        clear: function() {
            var e = this,
                t = '<span class="' + e.clearCaptionClass + '">' + e.clearCaption + "</span>";
            return e.inactive || e._setCaption(t), e.showStars(e.clearValue).trigger("change").trigger("rating:clear")
        },
        reset: function() {
            var e = this;
            return e.showStars(e.initialValue).trigger("rating:reset")
        },
        update: function(e) {
            var t = this;
            return arguments.length ? t.showStars(e) : t.$element
        },
        refresh: function(t) {
            var a = this,
                n = a.$element;
            return t ? a.destroy().rating(e.extend(!0, a.options, t)).trigger("rating:refresh") : n
        }
    }, e.fn.rating = function(n) {
        var i = Array.apply(null, arguments),
            r = [];
        switch (i.shift(), this.each(function() {
                var l, s = e(this),
                    o = s.data("rating"),
                    c = "object" == typeof n && n,
                    u = c.theme || s.data("theme"),
                    d = c.language || s.data("language") || "en",
                    p = {},
                    h = {};
                o || (u && (p = e.fn.ratingThemes[u] || {}), "en" === d || t.isEmpty(e.fn.ratingLocales[d]) || (h = e.fn.ratingLocales[d]), l = e.extend(!0, {}, e.fn.rating.defaults, p, e.fn.ratingLocales.en, h, c, s.data()), o = new a(this, l), s.data("rating", o)), "string" == typeof n && r.push(o[n].apply(o, i))
            }), r.length) {
            case 0:
                return this;
            case 1:
                return void 0 === r[0] ? this : r[0];
            default:
                return r
        }
    }, e.fn.rating.defaults = {
        theme: "",
        language: "en",
        stars: 5,
        filledStar: '<i class="icon-star3"></i>',
        emptyStar: '<i class="icon-star-empty"></i>',
        containerClass: "",
        size: "md",
        animate: !0,
        displayOnly: !1,
        rtl: !1,
        showClear: !0,
        showCaption: !0,
        starCaptionClasses: {
            .5: "label label-danger badge-danger",
            1: "label label-danger badge-danger",
            1.5: "label label-warning badge-warning",
            2: "label label-warning badge-warning",
            2.5: "label label-info badge-info",
            3: "label label-info badge-info",
            3.5: "label label-primary badge-primary",
            4: "label label-primary badge-primary",
            4.5: "label label-success badge-success",
            5: "label label-success badge-success"
        },
        clearButton: '<i class="glyphicon glyphicon-minus-sign"></i>',
        clearButtonBaseClass: "clear-rating",
        clearButtonActiveClass: "clear-rating-active",
        clearCaptionClass: "label label-default badge-secondary",
        clearValue: null,
        captionElement: null,
        clearElement: null,
        showCaptionAsTitle: !0,
        hoverEnabled: !0,
        hoverChangeCaption: !0,
        hoverChangeStars: !0,
        hoverOnClear: !0,
        zeroAsNull: !0
    }, e.fn.ratingLocales.en = {
        defaultCaption: "{rating} Stars",
        starCaptions: {
            .5: "Half Star",
            1: "One Star",
            1.5: "One & Half Star",
            2: "Two Stars",
            2.5: "Two & Half Stars",
            3: "Three Stars",
            3.5: "Three & Half Stars",
            4: "Four Stars",
            4.5: "Four & Half Stars",
            5: "Five Stars"
        },
        clearButtonTitle: "Clear",
        clearCaption: "Not Rated"
    }, e.fn.rating.Constructor = a, e(document).ready(function() {
        var t = e("input.rating");
        t.length && t.removeClass("rating-loading").addClass("rating-loading").rating()
    })
});

/*!
 * Krajee SVG Theme Configuration for bootstrap-star-rating.
 * This file must be loaded after 'star-rating.js'.
 *
 * @see http://github.com/kartik-v/bootstrap-star-rating
 * @author Kartik Visweswaran <kartikv2@gmail.com>
 */
! function(a) {
    "use strict";
    a.fn.ratingThemes["krajee-svg"] = {
        filledStar: '<span class="krajee-icon krajee-icon-star"></span>',
        emptyStar: '<span class="krajee-icon krajee-icon-star"></span>',
        clearButton: '<span class="krajee-icon-clear"></span>'
    }
}(window.jQuery);