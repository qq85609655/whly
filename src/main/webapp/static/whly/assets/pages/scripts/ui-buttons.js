var UIButtons = function () {

    var handleButtons = function () {
        $('.demo-loading-btn').click(function () {
            var btn = $(this)
            btn.button('loading')
            setTimeout(function () {
                btn.button('reset')
            }, 99999999)
        });
    }

    return {
        //main function to initiate the module
        init: function () {
            handleButtons();
        }

    };

}();

jQuery(document).ready(function() {    
   UIButtons.init();
});