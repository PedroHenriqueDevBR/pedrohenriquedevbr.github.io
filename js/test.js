var localendpoint = '../response.json';
var endpoints = {
    'perfil': 'https://api.github.com/users/pedrohenriquedevbr',
    'repos': 'https://api.github.com/users/pedrohenriquedevbr/repos',
    'readme': 'https://api.github.com/repos/PedroHenriqueDevBR/App-Pocket-Coin/readme',
    'raw': 'https://raw.githubusercontent.com/PedroHenriqueDevBR/App-Pocket-Coin/master/README.md'
};
var data = {
    "response": {}
};
var repositorys = {
    "response": {}
};
var languageColor = {
    'Python': '#8BC34A',
    'Java': '#D32F2F',
    'TypeScript': '#673AB7',
    'Dart': '#2196F3',
    'HTML': '#FF5722',
    'JavaScript': '#FFCA28'
}


function startLoad() {
    getData();
    getRespositoryes(localendpoint);
}

function saveData(json) {
    data['response'] = JSON.parse(json);
}

function getData() {
    const xhttp = new XMLHttpRequest();
    xhttp.open('GET', endpoints['perfil'], true);
    xhttp.onreadystatechange = () => {
        if (xhttp.status == 200) {
            saveData(xhttp.responseText);
        }
    }
    xhttp.send();
}

function saveRespositoryes(json) {
    repositorys['response'] = JSON.parse(json);
}

function getRespositoryes(uri) {
    const xhttp = new XMLHttpRequest();
    xhttp.open('GET', uri, true);
    xhttp.onreadystatechange = () => {
        if (xhttp.status == 200) {
            saveRespositoryes(xhttp.responseText);
        }
    }
    xhttp.send();
}

function showData() {
    setTimeout(() => {

        var names = document.getElementsByClassName('api-name');
        var photos = document.getElementsByClassName('api-photo');
        var descriptions = document.getElementsByClassName('api-description');

        // set names
        for (var name of names) {

            name.innerHTML = data['response'].name.toUpperCase();
        }

        // set descriptions
        for (var description of descriptions) {
            description.innerHTML = data['response'].bio;
        }

        // set photos
        for (photo of photos) {
            photo.src = data['response'].avatar_url;
        }

        // List last projects
        showProjects();

    }, 1);
}

function showProjects() {
    var projects = document.getElementById('projects-cards');
    var contProjects = 0;
    var showProjects = '';

    for (var repository of repositorys['response']) {
        if (contProjects === 0) {
            showProjects += `
                    <!-- Card deck -->
                    <div class="card-deck mt-3">
                    `;
        }
        if (contProjects % 3 === 0) {
            showProjects += `
                    </div>
                    <!-- Card deck -->
                    <div class="card-deck mt-3">
                        ${getCardElement(repository)}
                `;
        }
        else {
            showProjects += `${getCardElement(repository)}`;
        }
        if (contProjects === 5) {
            break;
        } else {
            contProjects++;
        }
    }
    showProjects += '</div>'
    projects.innerHTML = showProjects;
}

function getCardElement(repository) {
    return `
            <div class="card" style="width: 18rem;">
                <img src="img/bg01.jpg" class="card-img-top">
                <div class="card-body">
                    <p>
                        <span class="badge badge-primary px-3 py-2" style="background: ${languageColor[repository.language]};">${repository.language}</span>
                    </p>
                    <h3>
                        ${repository.name}
                    </h3>
                    <p class="card-text">
                        ${repository.description}
                    </p>
                </div>
            </div>
    `;
}

addEventListener('load', startLoad);
addEventListener('load', showData)