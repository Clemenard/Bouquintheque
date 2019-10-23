document.cookie = "lng=en";
i18next.use(window.i18nextXHRBackend)
        .init({
            debug: false,
            lng: getCookie('lng'),
            whitelist: ['fr','en'],
            fallbackLng: 'fr',
            backend: {
                loadPath: '/web/js/lang/{{lng}}/ns.json'
            }
        }, (err, t) => {
            jqueryI18next.init(i18next, $, {
                optionsAttr: 'i18n-options',
                useOptionsAttr: true,
                parseDefaultValueFromContent: true
            });
            console.log("a")
            $(document).localize();
            $("[data-toggle='tooltip']").tooltip('dispose');
            $("[data-toggle='tooltip']").tooltip();
        });

    function getCookie(cname) {
        var name = cname + "=";
        var decodedCookie = decodeURIComponent(document.cookie);
        var ca = decodedCookie.split(';');
        for(var i = 0; i < ca.length; i++) {
            var c = ca[i];
            while (c.charAt(0) == ' ') {
                c = c.substring(1);
            }
            if (c.indexOf(name) == 0) {
                return c.substring(name.length, c.length);
            }
        }
        return "";
    }