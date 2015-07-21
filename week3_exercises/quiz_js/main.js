var Question = require('./question.js');
var Quiz = require('./quiz.js');
var User = require('./user.js')
var read = require('read');


// var q = new Question( a) b) c) d);


var q1 = new Question(1,"What's the population of planet Earth? \n a) 4 billion b) 7 billion c) 7 trillion d) 5 billion", "b",5);
var q2 = new Question(2,"Who was the greek god of music? \n a) Hermes b) Pluto c) Aphrodite d) Apollo", "d",5);
var q3 = new Question(3, "What's the most common element on Earth's atmosphere \na) Nitrogen b) Oxygen c)Hydrogen d) Carbon Dioxide","a",5 );
var q4 = new Question(4, "Grand Central Terminal, Park Avenue, New York is the world's \n a) Largest railway station b) Highest railway station c) Longest railway station d) None of the above","a",5 );
var q5 = new Question(5, "For which of the following disciplines is Nobel Prize awarded? \n a) Physics and Chemistry  b) Physiology or Medicine c) Literature, Peace and Economics d) All of the above", "d",5);

var questions = [q1, q2, q3, q4, q5];

var user1 = new User("Ale",10,0);


var quiz1 = new Quiz(questions,user1);

quiz1.start();
