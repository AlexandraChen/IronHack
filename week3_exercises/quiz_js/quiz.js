var read = require('read');

var Quiz = function (questions,user){
	this.questions = questions;
	this.current_user = user;
	this.current_index = user.current_question;
	this.current_question = questions[this.current_index];
	this.random_question = "";	
};

Quiz.prototype.preStart = function (){
	options = {
		prompt: "New user?"
	};
	read(options, this.checkUser.bind(this));
}

Quiz.prototype.start = function (){
	console.log("\nHi there! Let's have a quiz about general knowledge :) \nYou will start with 10 free points!");
	this.randomQuestion();
};

Quiz.prototype.checkUser = function (err,answer){
	if (err){
		throw err
	} else if (answer === "yes"){
		this.register();
	} else if (answer === "no"){
		this.login();
	} else {
		this.preStart();
	}
}

Quiz.prototype.register = function () {

}

Quiz.prototype.login = function(){
	
}


Quiz.prototype.randomQuestion = function(){
	var randomizer = Math.floor(Math.random()*(this.questions.length));
	this.random_question = this.questions[randomizer];
	this.random_question.value = this.questions[randomizer].value * 2;
	this.askQuestion();
}

Quiz.prototype.askQuestion = function (){
	console.log("\nCurrent points: " + this.current_user.total_points);
	if (this.current_user.total_points === 0){
		console.log("This is you last shot! \n");
	} else if (this.questions[this.current_index].question === this.random_question.question){
		console.log("\nThis is a bonus question. You'll get double points if you score!")
	}
	console.log("\n" + this.questions[this.current_index].question);
	options = {
		prompt: "You answer is: \n>"
	};
	read(options, this.checkAnswer.bind(this));
};

Quiz.prototype.checkAnswer = function(err, answer){
	var valid_answers = ["a","b","c","d"];
	if(err){
		throw err;
	} else if(valid_answers.indexOf(answer) > -1){
		this.processAnswer(answer);
	} else if (answer === "exit") {
		console.log("Hope to see you again! :)")
	} else {
		console.log("Please enter a valid answer: a, b, c or d.");
		this.askQuestion();
	}
};

Quiz.prototype.processAnswer = function(answer){
	if(answer === this.questions[this.current_index].answer && this.current_index === this.questions.length -1){
		this.current_user.addPoints(this.questions[this.current_index].value);
		console.log("Congratulations! You finish the quiz with " + this.current_user.total_points + " points.");	
	} else if (answer === this.questions[this.current_index].answer){
			this.current_user.addPoints(this.questions[this.current_index].value);
			console.log(this.questions[this.current_index].value);
			this.current_index = this.current_user.current_question;
			console.log("\nYou got the correct answer! Next question:");
			this.askQuestion();
	} else {
		this.current_user.removePoints(this.questions[this.current_index].value);
		if (this.current_user.total_points < 0){
			console.log("\nI'm sorry. You ran out of points. Try again! \n Restarting game.");
			this.current_user.restartQuiz();
			this.current_index = this.current_user.current_question;
		} else {
			console.log("\nWrong answer. You've lost! " + this.current_question.value);
		}
		this.askQuestion();
	}
};



module.exports = Quiz;