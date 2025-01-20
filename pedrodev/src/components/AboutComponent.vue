<template>
    <div class="container">
        <h1 class="primary-color-text">Sobre</h1>
        <div class="description">
            <div class="vertical-divider primary-color"></div>
            <div class="details">
                <p>
                    Sou <span class="text-primary">Desenvolvedor de Software</span>, especializado em backend com
                    foco em <span class="text-primary">Python</span>, utilizando frameworks como <span
                        class="text-primary">Django</span> e <span class="text-primary">Flask</span> para
                    construir soluções robustas e escaláveis. Também possuo experiência em desenvolvimento frontend, com
                    conhecimentos em <span class="text-primary">JavaScript</span>, <span
                        class="text-primary">HTML</span>, <span class="text-primary">CSS</span> e frameworks como <span
                        class="text-primary">VueJS</span>. Tenho conhecimento no desenvolvimento de aplicações mobile
                    com <span class="text-primary">Flutter</span>, embora esse não seja meu foco de trabalho.
                </p>
                <hr class="divider">

                <p>
                    Tenho experiência no desenvolvimento de APIs RESTful, gerenciamento de bancos de dados (relacionais
                    e não-relacionais) e deploy de sistemas, utilizo o <span class="text-primary">Linux</span> para o
                    processo de deploy das aplicações. Utilizo
                    ferramentas como
                    <span class="text-primary">Docker</span>, <span class="text-primary">Git</span> e sistemas
                    relacionados para o processo de monitoramento
                    de aplicações. Sou apaixonado por resolver problemas complexos, otimizar processos e contribuir para
                    o sucesso de projetos.
                </p>
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
.container {
    margin: 0 auto;
    width: 1000px !important;
    display: flex;
    flex-direction: column;
    align-items: flex-start;
    justify-content: center;
    padding: 16px;
}

.container h1 {
    font-weight: 500;
    font-size: 3rem;
    margin-bottom: 16px;
}

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
    .container {
        width: 100% !important;
    }

    .container h1 {
        font-size: 1.5rem;
    }

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
