<template>
    <div class="description-container">
        <h1 class="primary-color-text">Sobre</h1>
        <div class="description">
            <div class="vertical-divider primary-color"></div>
            <div>
                <p>Sou desenvolvedor de software com experiência na área e apto para resolver problemas relacionados à
                    tecnologias</p>

                <p>Sou estudante de desenvolvimento de softwares e utilizo os conhecimentos adquiridos no meu dia a dia,
                    gosto muito de estudar e repassar os conhecimentos adquiridos para outras pessoas, seja por meio de
                    projetos ou explicando o assunto de uma forma mais simples.</p>

            </div>
        </div>
    </div>


</template>

<style scoped>
.description-container {
    margin: 0 auto;
    width: 1000px !important;
    display: flex;
    flex-direction: column;
    align-items: flex-start;
    justify-content: center;
}

.description-container h1 {
    font-weight: 500;
    font-size: 3rem;
}

.description {
    display: flex;
}

.description p {
    font-size: 1.3rem;
}

.vertical-divider {
    width: 10px;
    border-radius: 16px;
    height: auto;
    margin: 0 16px;
}
</style>
