function getLocation() {
    if (navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(showPosition);
    } else { 
        x.innerHTML = "Geolocation is not supported by this browser.";
    }
}

function showPosition(position) {
	var x = document.getElementById("demo");
	var coords = {lat:position.coords.latitude, long:position.coords.longitude};
    x.innerHTML = "Latitude: " + coords.lat + 
    "<br>Longitude: " + coords.long+"<br><br>";
	var position = new google.maps.LatLng(coords.lat, coords.long)

	coffeeSearch(position, function(restaurants) {
				
				console.log(pagination);
				if(pagination.hasNextPage){
					pagination.nextPage();
				}
			});
}

function coffeeSearch(myPosition, callback) {
	var url = 'https://maps.googleapis.com/maps/api/place/nearbysearch/json';
			var params = {
				location: myPosition,
				radius: 100,
				types: ['cafe']
			};

			function processResults(results, status, pagination){
				

				console.log(results);
				var x = document.getElementById("demo");
				results.forEach(function(item) {
					$(x).append("<form action=\"favorite\" method=post>"+
						"<input name=\"place[name]\" type=\"hidden\" value=\""+item.name+
						"\"><input name=\"place[name]\" type=\"hidden\" value=\""+item.vicinity+
						"\">"+item.name+" <input value='Save' type=submit></form>");
				});

				// var locations = jQuery.map(results, function(item, index) {
				// 	return {
				// 		"types": item.types,
				// 		"name": item.name
				// 	}
				// });

				// console.log(locations);

				// $.ajax({
				//   type: 'POST',
			 //      url:'/foo',
			 //      dataType: 'json',
			 //      data: { data_value: locations }
    //    			});
			}

			map = new google.maps.Map(document.getElementById('map-canvas'), {
				center: myPosition,
				zoom: 15
			});

			var service = new google.maps.places.PlacesService(map);
			service.nearbySearch(params, processResults);
}