var Item = require('./items.js');
var read = require('read');

var ShoppingCart = function(){
	this.cart_items = [];
// 	this.total_price = 0;
}

ShoppingCart.prototype.add_item = function(item){
	if(item.item === "apple"){
		var free_apple = new Item("apple",0);
		this.cart_items.push(free_apple);
	}

	this.cart_items.push(item);
	console.log("Adding " + item.item + " to the cart at a " + item.price);
}	

ShoppingCart.prototype.check_oranges = function(){
	var oranges_amount = this.cart_items.filter(function(item){
		return(item.item === "orange");
	}).length;
	
	//asking if we want to add new oranges?
	if (oranges_amount >= 5 ){   
		console.log("You can add 5 more oranges with 50% discount");
		this.more_oranges();
	}
	return this.total();
}

ShoppingCart.prototype.more_oranges = function(){
	options = {
		prompt: "Add 5 more oranges for half the price: yes or no?"
	}
	read(options, this.proccess_oranges_discount.bind(this));
}

ShoppingCart.prototype.proccess_oranges_discount = function (err,answer){
	if(err){
		throw err;
	}

	if (answer === "yes"){
		var discounted_oranges = new Item("oranges",2.5);
		console.log("Adding 5 more " + discounted_oranges.item + " to the cart at a " + discounted_oranges.price)
		for(var i = 1; i <=5; i++){
			this.cart_items.push(discounted_oranges);
		}
	}
	return this.total();
}


ShoppingCart.prototype.total = function(){
	var total_price = 0;
	this.cart_items.forEach(function(item){
		total_price += item.price;
	});

	if (this.cart_items.length > 5){
		total_price -= total_price*0.10;
	}
	console.log("Your grand total is : " + total_price);
}

ShoppingCart.prototype.remove_item = function(item){
	var removing = true;
	this.cart_items = this.cart_items.filter(function(cart_item){
		if (removing) {
			if (cart_item === item) {
				removing = false;
			}
			return cart_item !== item;
		} else {
			return true;
		}
	});
	console.log("Removing " + item.item + " to the cart at a " + item.price);
	// return this.cart_items;
}

module.exports = ShoppingCart;


