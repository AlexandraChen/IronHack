var Question = require('./question.js');
var User = function(name,total_points,current_question){
	this.name = name;
	this.total_points = total_points;
	this.current_question = current_question;
};

User.prototype.addPoints = function(pointsToAdd){
	this.total_points += pointsToAdd;
	this.current_question += 1;
}

User.prototype.removePoints = function (pointsToRemove) {
	this.total_points -= pointsToRemove;
};

User.prototype.restartQuiz = function(){
	this.total_points = 10;
	this.current_question = 0;	
}

User.prototype.hasPoints = function () {
	if (this.total_points === 0){
		console.log("This is you last shot! \n");
	}
	return this.total_points > 0;
};


module.exports = User;