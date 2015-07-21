
$(document).ready(function(){

	$("#random").click(function(){
		event.preventDefault()
		var phrases = ["We sweat for a nickle and a dime. Turn it in to an empire",
				"Ask me: do I want this. I say: do birds fly",
				"Take is cheap, my darling!",
				"We just need someone to lean on."	
				];
		var randomP = phrases[Math.floor(Math.random()*(phrases.length))]; 

		$(".phrase").text(randomP);
		$("ul").append("<li>"+ $(".phrase").html() + "</li>");

	});

	$("form").submit(function(){
		event.preventDefault();
		var phrase = $("form").serializeArray()
		$(".phrase").text(phrase[0].value);
		$("ul").append("<li>"+ $(".phrase").html() + "</li>");
	});

	$(".showHideSentences").click(function(){
		event.preventDefault()
		$(this).text() === "Hide sentences" ? $(this).text( "Show sentences") : $(this).text("Hide sentences");
		$("ul").fadeToggle('fast',"linear");
	});

});