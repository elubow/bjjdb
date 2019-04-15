$(document).ready(function(){
    $('[name="filter-options"]').on('click', function(event){
        var filterDropDown = document.getElementById("tag-filter");
        filterDropDown.textContent = event.toElement.text;
    })
})