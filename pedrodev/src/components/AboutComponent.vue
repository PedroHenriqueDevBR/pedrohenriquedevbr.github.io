<template>
    <div class="container">
        <h1 class="primary-color-text">{{ $t("sobre") }}</h1>
        <div class="description">
            <div class="vertical-divider primary-color"></div>
            <div class="details">
                <p v-html="$t('sobre_p1')"></p>
                <hr class="divider">
                <p v-html="$t('sobre_p2')"></p>
            </div>
        </div>
    </div>

    <div class="container mt-md text-center">
        <h1 class="primary-color-text text-center">Skills</h1>
        <div class="skills">
            <div class="card">
                <img src="@/assets/images/python.png" alt="Python">
                <span>Python</span>
            </div>
            <div class="card">
                <img src="@/assets/images/flutter.png" alt="flutter">
                <span>Flutter</span>
            </div>
            <div class="card">
                <img src="@/assets/images/javascript.png" alt="javascript">
                <span>JavaScript</span>
            </div>
            <div class="card">
                <img src="@/assets/images/vue.png" alt="vue">
                <span>VueJS</span>
            </div>
            <div class="card">
                <img src="@/assets/images/html.png" alt="html">
                <span>HTML</span>
            </div>
            <div class="card">
                <img src="@/assets/images/css.png" alt="css">
                <span>CSS</span>
            </div>
            <div class="card">
                <img src="@/assets/images/postgresql.png" alt="postgresql">
                <span>PostgreSQL</span>
            </div>
            <div class="card">
                <img src="@/assets/images/mysql.png" alt="mysql">
                <span>MySQL</span>
            </div>
            <div class="card">
                <img src="@/assets/images/linux.png" alt="linux">
                <span>Linux</span>
            </div>
            <div class="card">
                <img src="@/assets/images/docker.png" alt="docker">
                <span>Docker</span>
            </div>
            <div class="card">
                <img src="@/assets/images/git.png" alt="git">
                <span>Git</span>
            </div>
        </div>

    </div>

</template>

<style scoped>
.description {
    display: flex;
}

.description p {
    font-size: 1.3rem;
}

.vertical-divider {
    width: 15px;
    border-radius: 16px;
    height: 40px;
    margin: 0 16px;
}

.mt-md {
    margin-top: 8px;
}

.container.text-center {
    align-items: center;
}

.text-center {
    text-align: center !important;
}

.skills {
    display: flex;
    flex-direction: row;
    align-items: center;
    justify-content: center;
    flex-wrap: wrap;
}

.skills .card {
    width: 175px;
    height: 175px;
    background-color: var(--color-background-soft);
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
    border-radius: 8px;
    transition: 200ms ease-in-out;
    margin: 16px;
}

.skills .card:hover {
    background-color: var(--color-background-muted);
}

.skills .card img {
    width: 100px;
}

.skills .card span {
    margin-top: 16px;
    font-weight: 600;
    font-size: 1.2rem;
}

@media only screen and (max-width: 700px) {
    .description p {
        font-size: 0.8rem;
    }

    .vertical-divider {
        width: 30px;
        border-radius: 16px;
        height: 40px;
        margin: 0 16px;
    }

    .skills .card {
        width: 120px;
        height: 120px;
        margin: 8px;
    }

    .skills .card:hover {
        background-color: var(--color-background-muted);
    }

    .skills .card img {
        width: 50px;
    }

    .skills .card span {
        margin-top: 8px;
        font-weight: 600;
        font-size: 0.8rem;
    }
}
</style>
