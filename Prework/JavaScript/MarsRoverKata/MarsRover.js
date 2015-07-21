function MarsRover (location, direction, grid, obstacles){

    self = this;
	this.location = location === undefined ? [0,0]: [location[0] , location[1]];
	this.direction = direction === undefined ? 'N' : direction;
	this.grid = (grid === undefined) ? [100, 100] : [grid[0],grid[1]];
	this.obstacles = (obstacles === undefined) ? [] : obstacles;
    this.status = 'OK';

	this.commands = function(commands){
	    var commandsArr = [];
	    if(commands === undefined){
	    	return commandsArr;
	    } 
	    else {
		  for(var i = 0; i < commands.length; i++){
            var command = commands[i];
            if (command == 'f' || command == 'b'){
                if(!move(command)){ //if there is a obstacle, it shouldn't move
                    break;
                };
            } else if (command == 'l' || command == 'r'){
                turn(command);
                }
        }
        resetLocation();
        this.commandsArr = commands;
        }
	};
	
	function move(command){
        var xMoves = 0;
        var yMoves = 0;
        if(self.direction == 'N'){
            yMoves -= 1;
        } else if (self.direction == 'S'){
            yMoves += 1;
        } else if (self.direction == 'E'){
            xMoves += 1;
        } else if (self.direction == 'W'){
            xMoves -= 1;
        }

        if(command == 'b'){
            xMoves *= -1; //If goes backwards, it changes to negative
            yMoves *= -1;
        }


        var newLocation = [self.location[0] + xMoves, self.location[1] + yMoves];
         if (obstacle(newLocation)) { //checks if there is an obstacle
            return false; //mr doesn't move
        }
        self.location = newLocation;
        return true;
    }

    function turn(command){
        if (command == 'l'){
            if (self.direction == 'N'){
                self.direction = 'W';
            } else if(self.direction == 'S'){
                self.direction = 'E';
            } else if(self.direction == 'E'){
                self.direction = 'N';
            } else if(self.direction == 'W'){
                self.direction = 'S';
            }
        }
        if(command =='r'){
            if (self.direction == 'N'){
                self.direction = 'E';
            } else if(self.direction == 'S'){
                self.direction = 'E';
            } else if(self.direction == 'E'){
                self.direction = 'S';
            } else if(self.direction == 'W'){
                self.direction = 'N';
            }
        }
    }

    function resetLocation() {
        self.location = [
            (self.location[0] + self.grid[0]) % self.grid[0],
            (self.location[1] + self.grid[1]) % self.grid[1]
        ]
    }

    function obstacle(newLocation){
        for (var i = 0; i < self.obstacles.length; i++){
            if(newLocation.toString() == self.obstacles[i].toString()){
                self.status = 'Obstacle ahead!';
                return true;
            }
        }
        return false;
    }
    
}



















