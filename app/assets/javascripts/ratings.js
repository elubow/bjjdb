$(document).ready(function(){
    $("#ratings-form").on('ajax:success', function() {
        var radios = document.getElementsByName('rating[value]');
        var selectedRadio = "";
        for(var i = 0; i < radios.length; i++){
            if(radios[i].checked)
                selectedRadio = radios[i].value;
        }
        selectedRadio == 1 ? selectedRadio += " star": selectedRadio += " stars"
        $(".mt-3").first().
        html('<div class="alert alert-success" role="alert">' +
        '<button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>' +
        '<div id="flash_notice">Rating of ' + selectedRadio + ' saved!</div></div>')
    });
    $("#ratings-form").on('ajax:error', function() {
        $(".mt-3").first().
        html('<div class="alert alert-erro" role="alert">'+
        '<button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>'+
        '<div id="flash_notice">Error saving!</div></div>')
    });
    $("#favorited-bar").on('click', function() {
        var currentString = document.getElementById('favorited-bar').textContent;
        currentString = currentString.substring(0, currentString.length - 1);
        $(".mt-3").first().
        html('<div class="alert alert-success" role="alert">'+
        '<button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>'+
        '<div id="flash_notice">' + currentString + 'd!</div></div>')
    });
});