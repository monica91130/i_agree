// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require_tree .

// TOPページのスクロールアニメーション
$(function() {
	$(window).scroll(function () {
		if ($(window).scrollTop() >= 300 && $(window).scrollTop() <= 1000) {
			// $('.a').slideDown(200);
			$('.about').fadeIn();
			$('.about').addClass("fadeInDown");
		} else {
			$('.about').css('display', 'none');
		}
	});
});


// マイページのタブ切り替え

// $(".menu-box").on("click",function(){
// 	var $th = $(this).index();
// 	$(".menu-box").removeClass("active");
// 	$(".mypage-contents").removeClass("active");
// 	$(this).addClass("active");
// 	$(".mypage-contents").eq($th).addClass("active");
// });


$(".tab_label").on("click",function(){
	var $th = $(this).index();
	$(".tab_label").removeClass("active");
	$(".tab_panel").removeClass("active");
	$(this).addClass("active");
	$(".tab_panel").eq($th).addClass("active");
});