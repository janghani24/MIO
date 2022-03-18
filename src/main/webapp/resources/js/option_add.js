function doAdd(){

var list = document.querySelector("#list");


var size=document.createElement("input");
size.setAttribute("type", "text");
var color=document.createElement("input");
color.setAttribute("type", "text");
var quantity=document.createElement("input");
quantity.setAttribute("type", "number");
quantity.setAttribute("min", "1");

var li = document.createElement("li");

li.appendChild(size);
li.appendChild(color);
li.appendChild(quantity);

list.appendChild(li);


}


function doDelete() {

	$('li:last-child').remove(); 


}