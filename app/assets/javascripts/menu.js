$("document").ready(function(){
    $("#menu-toggle").click(function(){
        $(".container, #menu-toggle").toggleClass("slide");
        $(".menu").toggleClass("menu-slide");
        $("#menu-toggle").toggleClass("rotate");
    });
});