var task = {};

function newTask(text, priority){
	'use estrict';

	if (typeof priority === 'undefined'){
		priority = 0;
	}

	var task = {
		text: text,
		priority: priority,
		done: false,
		order: null,
		markDone: function(){
			this.done = true;
		},
		markUndone: function(){
			this.done = false;
		},
		isDone: function(){
			return this.done;
		}
	};
	return task;
}

var toDoList = [];
toDoList.nextId = 1;

toDoList.addTask = function(text, priority){
	var task = newTask(text, priority);
	task.order = this.nextId++;
	this.push(task);
};

toDoList.show = function () {
  this.forEach(function (task, index) {
    console.log(
      '[' + task.priority + '] - ' +    
      (index + 1) + ': ' + task.text +  
      task.isDone() ? '✓' : ''          
    );
  });
};

toDoList.markDone = function (){
	var listIndex = index -1;
	this[listIdex].markDone();
};

toDoList.markUndone = function(){
	var listIndex = index - 1;
	this[listIndex].markUndone();
};

toDoList.remove = function(index){
	var listIndex = index - 1;
	this.splice(listIndex,1);
};

toDoList.sortByPriority = function (){
	this.sort(function(taskA, taskB){
		return taskB.priority - taskA.priority;
	});
	this.show();
};

toDoList.cleanDone = function(){
	var index = 0;
	while (index < this.length){
		var task = this[index];
		if(this.isDone()) {
			this.splice(index, 1);
		}
		else {
			index ++;
		}
	}
};

























