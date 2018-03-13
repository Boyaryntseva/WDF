console.log("LINKED");

// Dramatis Personae
var hobbits = [
  'Frodo Baggins',
  'Samwise \'Sam\' Gamgee',
  'Meriadoc \'Merry\' Brandybuck',
  'Peregrin \'Pippin\' Took'
];

var buddies = [
  'Gandalf the Grey',
  'Legolas',
  'Gimli',
  'Strider',
  'Boromir'
];
// Our Setting
var lands = ['The Shire', 'Rivendell', 'Mordor'];
// Starter code for the body
var body = document.querySelector('body');

//1

function makeMiddleEarth() {
	// create a section tag with an id of middle-earth
	var section = document.createElement("section");
	section.setAttribute("id", "middle-earth");
	// add each land as an article tag
	for (i = 0; i < lands.length; i ++) {
		var land = document.createElement("article");
		section.appendChild(land);
		// inside each article tag include an h1 with the name of the land
		var landh1 = document.createElement("h1");
		var landText = document.createTextNode(lands[i]);
		landh1.appendChild(landText);
		land.appendChild(landh1);
		// set class for each article to be equal to its name
		land.setAttribute("class", lands[i]);
	}
	// append middle-earth to your document body
	document.body.appendChild(section);
}

makeMiddleEarth();

//2

function makeHobbits() {
	// create new unordered list
	var hobbitsList = document.createElement("ul");
	// select the first article element
	var shire =  document.querySelector("article");
	// add hobbits to the shire
	shire.appendChild(hobbitsList);
	for (i = 0; i < hobbits.length; i ++) {
		var hobbit = document.createElement("li");
		hobbitsList.appendChild(hobbit);
		var hobbitName = document.createTextNode(hobbits[i]);
		hobbit.appendChild(hobbitName);
		hobbit.setAttribute("class", "hobbit");
	}
}

makeHobbits();

//3

function keepItSecretKeepItSafe() {
	//create a new div
	var ring = document.createElement("div");
	// give the div an id of 'the-ring'
	ring.setAttribute("id", "the-ring");
	// give the div a class of 'magic-imbued-jewelry'
	ring.setAttribute("class", "magic-imbued-jewelry");
	// add the ring as a child of Frodo
	var frodo = document.querySelector("li");
	frodo.appendChild(ring);
}

keepItSecretKeepItSafe();

//4

function makeBuddies() {
	// create an aside tag
	var asideTag = document.createElement("aside");
	// insert the aside as a child element of rivendell
	var rivendell = document.getElementsByTagName("article")[1];
	rivendell.appendChild(asideTag);
	var buddiesList = document.createElement("ul");
	asideTag.appendChild(buddiesList);
	// attach an unordered list of the 'buddies' in the aside
	for (i = 0; i < buddies.length; i ++) {
		var buddy = document.createElement("li");
		buddiesList.appendChild(buddy);
		var buddyName = document.createTextNode(buddies[i]);
		buddy.appendChild(buddyName);
		buddy.setAttribute("class", buddies[i]);
	}

}

makeBuddies();

//5

function beautifulStranger() {
	// change the 'Strider' textnode to 'Aragorn'
	var strider = document.getElementsByClassName("Strider")[0];
	strider.innerHTML = "Aragorn";
}

beautifulStranger();

//6

function leaveTheShire() {
	// assemble the hobbits and move them to Rivendell
	var rivendell = document.getElementsByTagName("article")[1];
	var hobbitsList = document.querySelector("ul");
	rivendell.appendChild(hobbitsList);	
}

leaveTheShire();

//7

function forgeTheFellowShip() {
	// create a new div with an id of 'the-fellowship'
	var fellowship = document.createElement("div");
	fellowship.setAttribute("id", "the-fellowship");
	var hobbitsList = document.getElementsByTagName("ul")[1].childNodes;
	var boddiesList = document.getElementsByTagName("ul")[0].childNodes;
	// add each hobbit and buddy one at a time to 'the-fellowship'
	while (hobbitsList.length > 0) {
		fellowship.appendChild(hobbitsList[0]);
	}
	while (boddiesList.length > 0) {
		fellowship.appendChild(boddiesList[0]);
	}
	var link = document.createElement("a");
	link.setAttribute("href", "http://www.w3schools.com/jsref/met_win_alert.asp");
	link.innerHTML = "alert";
	var rivendell = document.getElementsByTagName("article")[1];
	// append the fellowship div to rivendell
	rivendell.appendChild(fellowship);
	rivendell.appendChild(link);
}

forgeTheFellowShip();

//8

function theBalrog() {
	// change the 'Gandalf' textNode to 'Gandalf the White'
	var gandalf = document.getElementsByClassName("Gandalf the Grey")[0];
	gandalf.innerHTML = "Gandalf the White";
	// add a gray 3px border
	gandalf.style.border = "3px solid gray";
}

theBalrog();

//9

function hornOfGondor() {
	// pop up an alert that the horn of gondor has been blown
	alert("The horn of gondor has been blown!");
	var boromir = document.getElementById("the-fellowship").lastChild;
	// put a linethrough on boromir's name
	boromir.style.textDecoration = "line-through";
	// Remove Boromir from the Fellowship
	document.getElementById("the-fellowship").removeChild(boromir);
}

hornOfGondor();

//10

function itsDangerousToGoAlone() {
	// take Frodo and Sam out of the fellowship and move them to Mordor
	var frodo = document.getElementsByClassName("hobbit")[0];
	var sam = document.getElementsByClassName("hobbit")[1];
	var mordor = document.getElementsByClassName("Mordor")[0];
	mordor.appendChild(frodo);
	mordor.appendChild(sam);
	// add a div with an id of 'mount-doom' to Mordor
	var mountDoom = document.createElement("div");
	mountDoom.setAttribute("id", "mount-doom");
	mordor.appendChild(mountDoom);
}

itsDangerousToGoAlone();

//11

function weWantsIt() {
	// Create a div with an id of 'gollum' and add it to Mordor
	var gollum = document.createElement("div");
	gollum.setAttribute("id", "gollum");
	// Remove the ring from Frodo and give it to Gollum
	document.getElementById("mount-doom").appendChild(gollum);
	gollum.innerHTML = "Gollum";
	var ring = document.getElementById("the-ring");
	gollum.appendChild(ring);
	
}

weWantsIt();

//12

function thereAndBackAgain() {
	// remove Gollum and the Ring from the document
	document.getElementById("mount-doom").removeChild(gollum);
	// Move all the hobbits back to the shire
	var hobbits = document.getElementsByClassName("hobbit");	
	for (i = 0; i < hobbits.length; i++) {
		var shire =  document.querySelector("article");
		shire.appendChild(hobbits[i]);
	}
}

thereAndBackAgain();

//just a comment to test git commit
