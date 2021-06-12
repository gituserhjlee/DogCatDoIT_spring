const weather = document.querySelector(".js-weather");

const API_KEY = "ec41fc385ab1329b27b9b34af46171da";
const COORDS = 'coords';

function getWeather(lat, lng) {
	fetch(
		`https://api.openweathermap.org/data/2.5/weather?id=524901&lang=kr&lat=${lat}&lon=${lng}&appid=${API_KEY}&units=metric`
	).then(function(response){
		return response.json();
	}).then(function(json){
		const currenttemp = json.main.temp;
		weather.innerText = `${currenttemp}`;
	});
}

function saveCoords(coordsObj) {
	localStorage.setItem(COORDS, JSON.stringify(coordsObj));
}

function handleGeoSucces(position) {
	const latitude = position.coords.latitude;
	const longitude = position.coords.longitude;
	const coordsObj = {
			latitude,
			longitude
	};
	saveCoords(coordsObj);
	getWeather(latitude, longitude)
}

function handleGeoError() {
	console.log("위치 정보를 읽어올 수 없습니다...");
}

function askForCoords() {
	navigator.geolocation.getCurrentPosition(handleGeoSucces, handleGeoError)
}

function loadCoords() {
	const loadedCoords = localStorage.getItem(COORDS);
	if(loadedCoords === null) {
		askForCoords();
	} else {
		const parsedCoords = JSON.parse(loadedCoords);
		getWeather(parsedCoords.latitude, parsedCoords.longitude);
	}
}

function init() {
	loadCoords();
}

init();