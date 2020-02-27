$(document).ready(function () {
    $('.sidenav').sidenav();
    $('.fixed-action-btn').floatingActionButton();
});

function print() {
    var win = window.open()
    win.print();
}