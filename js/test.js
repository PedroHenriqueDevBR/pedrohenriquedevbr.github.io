var data = {};
var endpoint = 'https://api.github.com/users/pedrohenriquedevbr';
var localendpoint = '../response.json';


function saveData(json) {
    console.log('Dados salvos');
    data = json;
}

function getData() {
    const xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = () => {
        if (xhttp.status === 200) {
            saveData(JSON.parse(xhttp.responseText));
        } else {
            console.log('Erro ao obter os dados');
        }
    }

    xhttp.open('GET', endpoint);
    xhttp.send();
}

function showData() {
    setTimeout(() => {

        var names = document.getElementsByClassName('api-name');
        var photos = document.getElementsByClassName('api-photo');
        var descriptions = document.getElementsByClassName('api-description');

        // set names
        for (var name of names) {
            var n = data.name;
            name.innerHTML = n.toUpperCase();
        }

        // set descriptions
        for (var description of descriptions) {
            description.innerHTML = data.bio;
        }

        // set photos
        for (photo of photos) {
            photo.src = data.avatar_url;
        }

    }, 1000);
}

addEventListener('load', getData);
addEventListener('load', showData);