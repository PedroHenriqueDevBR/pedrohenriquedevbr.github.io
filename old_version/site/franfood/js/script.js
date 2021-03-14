var buttonsOptionsElement = document.querySelectorAll('.select-option');
var optionsElements = document.querySelectorAll('.options');

function showTarget(target) {
    for (var option of optionsElements) {
        option.classList.remove('selected');
    }
    for (var button of buttonsOptionsElement) {
        button.classList.remove('selected');
    }

    document.getElementById(`${target}`).classList.add('selected');
    document.querySelector(`.${target}`).classList.add('selected')
}

for (var button of buttonsOptionsElement) {
    var data = button.dataset.target;
    button.setAttribute('onClick', `showTarget("${data}")`);
}
