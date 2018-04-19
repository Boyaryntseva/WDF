$(document).ready(function(){
    // Changing the picture of the product on hover
    $(".illustration").hover(function(){
        $(this).find(".front").css("display", "none");
        $(this).find(".close").css("display", "block");
    }, function(){
        $(this).find(".front").css("display", "block");
        $(this).find(".close").css("display", "none");
    });
    // Revealing email form
    $("#request-email-link").click(function(e) {
        e.preventDefault();
        $("#request-email").removeClass('hidden');
    });
    // Hiding email form
    $("#submit-email").click(function(e) {
        console.log("test")
        $("#request-email").addClass('hidden');
    });
});