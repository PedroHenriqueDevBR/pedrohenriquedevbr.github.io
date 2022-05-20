var FORM_NAME = 'presentation_form';
var statusJSON = document.getElementById('status-json');

function saveData() {
    saveFormStatus(FORM_NAME);
    var data = localStorage.getItem(FORM_NAME);
    showPreJson();
}

function loadData() {
    loadFormStatus(FORM_NAME);
    showPreJson();
}

function resetData() {
    resetFormStatus(FORM_NAME);
    statusJSON.innerHTML = '';
}

function showPreJson() {
    var data = localStorage.getItem(FORM_NAME);
    data = JSON.parse(data);
    data = JSON.stringify(data, null, 4);
    statusJSON.innerHTML = data;
}

addEventListener('load', loadData);
