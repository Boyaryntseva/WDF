var serviceNodes = document.getElementsByClassName("service");

for (var i = 0; i < serviceNodes.length; i++) {
	serviceNodes.item(i).addEventListener("mouseover", mouseOver);
	serviceNodes.item(i).addEventListener("mouseout", mouseOut);
}

function mouseOver() {
	this.style.width = "40%";
	var attId = this.getAttribute("id");
	document.getElementById(attId + "_more").style.display = "block";
	document.getElementById(attId + "_name").style.display = "none";   
}

function mouseOut() {
	this.style.width = "20%";
	var attId = this.getAttribute("id");
	document.getElementById(attId + "_more").style.display = "none";
	document.getElementById(attId + "_name").style.display = "block";
}

var slideIndex = 0;
carousel();

function carousel() {
	var i;
	var x = document.getElementsByClassName("mySlides");
	for (i = 0; i < x.length; i++) {
	  x[i].style.display = "none"; 
	}
	slideIndex++;
	if (slideIndex > x.length) {slideIndex = 1} 
	x[slideIndex-1].style.display = "block"; 
	setTimeout(carousel, 2000); // Change image every 2 seconds
}