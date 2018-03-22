var currentProductPage = 1;
function showProducts(page) {
	$.ajax({
		url: "https://www.redbullshopus.com/products.json?limit=9&page="+ page,
		type: "GET",
		success: function(result) {
			currentProductPage ++;
			for (i=0; result.products.length > i; i++) {
				let product = result.products[i];
				let productImage = product.images[0].src;
				let productTitle = product.title;
				let productPrice = product.variants[0].price;
				let productAvailability = product.variants[0].available;
				let $divTile = $("<div class='tile col-md-4 col-sm-6'></div>");
				let $divProduct = $("<div class='product'></div>");
				$divTile.append($divProduct);
				$divProduct.append($("<div class='product-image'><img src='" + productImage + "'></div>"));
				$divProduct.append($("<div class='product-title'>" + productTitle + "</div>"));
				if (productAvailability) {
					$divProduct.append($("<div class='product-price'>" + productPrice + "</div>"));
				} else {
					$divProduct.append($("<div class='product-status'>OUT OF STOCK</div>"));
				}
				$(".tiles").append($divTile);
			}
		},
		error: function(error) {
			console.log(error)
		}
	});
}
showProducts(1);

$(".show-more").click(function(e) {
	e.preventDefault();
	showProducts(currentProductPage)
});
