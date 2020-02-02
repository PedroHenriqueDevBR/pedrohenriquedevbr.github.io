var pipe = '|';
var player;
var playerPosition;

var bullet;
var bulletPosition;
var generatedBullet;
var bulletHeight;

var BULLET_VELOCITY = 20;
var PLAYER_VELOCITY = 2;

var generations;
var victories;
var defeats;
var straightWins;
var lastResultVictory;

var generationsScore;
var victoriesScore;
var defeatsScore;
var straightWinsScore;

function bootstrap() {
    player = document.getElementById('player');
    bullet = document.getElementById('bullet');

    generationsScore = document.getElementById('generations');
    victoriesScore = document.getElementById('victories');
    defeatsScore = document.getElementById('defeats');
    straightWinsScore = document.getElementById('straightWins');

    playerPosition = 50;
    bulletPosition = 50;
    bulletHeight = 0;
    generatedBullet = false;

    generations = 0;
    victories = 0;
    defeats = 0;
    straightWins = 0;
    lastResultVictory = false;
}

function movePlayer() {
    var key = event.keyCode;
    if (key == 97 || key == 100) {
        if (key == 97) {
            if (playerPosition > 0) {
                playerPosition -= PLAYER_VELOCITY;
            }
        } else if (key == 100) {
            if (playerPosition < 90) {
                playerPosition += PLAYER_VELOCITY;
            }
        }
        player.style.left = playerPosition + '%';

        if (!generatedBullet) {
            bulletGenerate();
        }
    }
}

function bulletGenerate() {
    bulletHeight = 0;
    bulletPosition = parseInt(Math.random() * 98);

    bullet.style.top = bulletHeight;
    bullet.style.left = bulletPosition + '%';
    generatedBullet = true;
    shootBullet();
}

function shootBullet() {
    if (generatedBullet) {
        bulletHeight++;
        shoot = setInterval(function () {
            bulletHeight++;
            bullet.style.top = bulletHeight + '%';
            if (endShoot()) {
                clearInterval(shoot);
                updateScore();
                bulletGenerate();
            }

        }, BULLET_VELOCITY);
    }
}


function endShoot() {
    if (bulletHeight == 92) {
        console.log('Bullet genereted on: ' + bulletPosition);
        console.log('player: ' + playerPosition + ' - ' + (playerPosition + 10));
    }
    if (bulletHeight == 92) {
        if (bulletPosition >= playerPosition && bulletPosition < (playerPosition + 10)) {
            victories++;
            lastResultVictory = true;
            return true;
        }
    }
    if (bulletHeight >= 96) {
        lastResultVictory = false;
        defeats++;
        return true;
    }
    return false;
}

function updateScore() {
    generations++;
    generationsScore.innerHTML = generations;
    victoriesScore.innerHTML = victories;
    defeatsScore.innerHTML = defeats;
    if (lastResultVictory) {
        straightWins++;
    } else {
        straightWins = 0;
    }
    straightWinsScore.innerHTML = straightWins;
    if (straightWinsScore > 1) {
        console.log(BULLET_VELOCITY);
        BULLET_VELOCITY++;
    }

}


addEventListener('load', bootstrap);
document.body.onkeypress = movePlayer;