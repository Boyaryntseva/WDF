var username;
var reposLoaded = false;
var followersLoaded = false;
var followingLoaded = false;
var cardLoaded = false;
$(".card").css("display", "none");

$("#see-profile").click(function(e) {
	e.preventDefault();
	console.log("test");
	username = $("#username").val();
	if (username == "") {
		alert("Enter Github username")
	}
	console.log(username);

	if (cardLoaded == false) {
			gitHubCard(username);
		}
	
});


function gitHubCard(username) {
	$.ajax({
		url: "https://api.github.com/users/" + username,
		
		type: "GET",
		success: function(result) {
			$(".card").css("display", "block");
			let $profile = $("<div class='profile'></div>");
			$profile.append($("<div class='avatar'><img src='" + result.avatar_url + "'></div>"));
			$profile.append($("<div class='full-name'><h1>" + result.name + "</h1></div>"));
			$profile.append($("<div class='location'><h2>" + result.location + "</h2></div>"));
			let $icons = $("<ul class='icons'></ul>");
			$icons.append($("<li class='repos'><a id='repos-link' href=''><div class='number'>" + result.public_repos + "</div><div class='item'>REPOS</div></a></li>"));
			$icons.append($("<li class='following'><a id='following-link' href=''><div class='number'>" + result.following + "</div><div class='item'>FOLLOWING</div></a></li>"));
			$icons.append($("<li class='followers'><a id='followers-link' href=''><div class='number'>" + result.followers + "</div><div class='item'>FOLLOWERS</div></a></li>"));
			let $main = $("<div class='main-info'></div>");
			let $repos = $("<div id='repos' class='info'></div>");
			let $following = $("<div id='following' class='info'></div>");
			let $followers = $("<div id='followers' class='info'></div>");
			$main.append($repos).append($following).append($followers);
			$(".card").append($profile).append($icons).append($main);
			cardLoaded = true;
			initEvent();
		},
		error: function(error) {
			console.log(error)
		}
	});
}



function gitRepos(username) {
	$.ajax({
		url: "https://api.github.com/users/" + username + "/repos",
		type: "GET",
		success: function(result) {
			reposLoaded = true;
			let $reposList = $("<ul class='repos-list'><h3>Public Repositories:</h3></ul>");
			for (i = 0; i < result.length; i ++) {
				$reposList.append($("<li class='repository'><a target='blank' href='" + result[i].html_url + "''><h4>" + result[i].name + "</h4></a></li>"));
				$("#repos").append($reposList);
			}
		},
		error: function(error) {
			console.log(error)
		}
	});
}

function gitFollowing(username) {
	$.ajax({
		url: "https://api.github.com/users/" + username + "/following",
		type: "GET",
		success: function(result) {
			followingLoaded = true;
			let $followingList = $("<ul class='following-list'><h3>Following:</h3></ul>");
			for (i = 0; i < result.length; i ++) {
				$followingList.append($("<li class='following'><img src=" + result[i].avatar_url + "><h4>" + result[i].login + "</h4></li>"));
				$("#following").append($followingList);
			}
		},
		error: function(error) {
			console.log(error)
		}
	});
	
}

function gitFollowers(username) {
	$.ajax({
		url: "https://api.github.com/users/" + username + "/followers",
		type: "GET",
		success: function(result) {
			followersLoaded = true;
			let $followersList = $("<ul class='following-list'><h3>Followers:</h3></ul>");
			for (i = 0; i < result.length; i ++) {
				$followersList.append($("<li class='followers'><img src=" + result[i].avatar_url + "><h4>" + result[i].login + "</h4></li>"));
				$("#followers").append($followersList);
			}
		},
		error: function(error) {
			console.log(error)
		}
	});
}
 // $(document).ready(function() {
 // 	showMainInfo();
 // });

function initEvent () {
	$("#repos-link").click(function(e){
		e.preventDefault();
		console.log("clicked");
		if (reposLoaded == false) {
			gitRepos(username);
		}
		$("#repos").css("display", "block");
		$("#following").css("display", "none");
		$("#followers").css("display", "none");
	});
	$("#following-link").click(function(e){
		e.preventDefault();
		console.log("clicked");
		if (followingLoaded == false) {
			gitFollowing(username);
		}
		$("#following").css("display", "block");
		$("#repos").css("display", "none");
		$("#followers").css("display", "none");
	});
	$("#followers-link").click(function(e){
		e.preventDefault();
		console.log("clicked");
		if (followersLoaded == false) {
			gitFollowers(username);
		}
		$("#followers").css("display", "block");
		$("#repos").css("display", "none");
		$("#following").css("display", "none");
	});
}




