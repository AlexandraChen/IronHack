var Item = require('./items.js');
var ShoppingCart = require('./shoppingcart.js');


var apple = new Item("apple",10);
var orange = new Item("orange", 5);
var grapes = new Item("grapes", 15);
var banana = new Item("banana", 20);
var watermelon = new Item("watermelon",50);

var newShoppingCart = new ShoppingCart();
newShoppingCart.add_item(apple);
newShoppingCart.add_item(orange);
newShoppingCart.add_item(grapes);
newShoppingCart.add_item(banana);
newShoppingCart.add_item(watermelon);
newShoppingCart.add_item(watermelon);
newShoppingCart.remove_item(watermelon);
newShoppingCart.add_item(orange);
newShoppingCart.add_item(orange);
newShoppingCart.add_item(orange);
newShoppingCart.add_item(orange);


// console.log(newShoppingCart.cart_items);
newShoppingCart.check_oranges(); //this also returns the total
// newShoppingCart.total();