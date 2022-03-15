var sell_price;
var amount;

function init () {
	sell_price = document.form.sell_price.value;
	amount = document.form.amount.value;
	document.form.sum.value = sell_price;
	change();
	console.log('document.form.sell_price.value',document.form.sell_price.value);
}

function add () {
	hm = document.form.amount;
	sum = document.form.sum;
	hm.value ++ ;

	
	console.log('add');
	console.log('hm',hm);
	console.log('sum',sum);
	console.log('sell_price',sell_price);
	sum.value = parseInt(hm.value) * sell_price;

}

function del () {
	hm = document.form.amount;
	sum = document.form.sum;
		if (hm.value > 1) {
			hm.value -- ;
			sum.value = parseInt(hm.value) * sell_price;
		}
			console.log('delete');
}

function change () {
	hm = document.form.amount;
	sum = document.form.sum;

		if (hm.value < 0) {
			hm.value = 0;
		}
	sum.value = parseInt(hm.value) * sell_price;
}  