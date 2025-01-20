<template>
  <div class="container">
    <h1 class="primary-color-text">Experiências</h1>
    <hr class="divider">

    <div class="timeline">
      <div class="timeline-item">
        <div class="timeline-content">
          <h3>Desenvolvedor de software - Pleno</h3>
          <p>Defensoria Pública do Estado do Piauí · (mar de 2023 - momento)</p>
          <p>Na Defensoria Pública do Estado do Piauí eu trabalho no setor de desenvolvimento, realizando principalmente
            as seguintes rotinas:</p>
          <li>Criação e manutenção de softwares;</li>
          <li>Realização de testes unitários e de integração;</li>
          <li>Configuração e gerenciamento das configurações dos servidores das aplicações. Na Defensoria Pública do
            Estado do Piauí eu trabalho no setor de desenvolvimento, realizando principalmente as seguintes rotinas: -
            Criação e manutenção de softwares; - Realização de testes unitários e de integração; - Configuração e
            gerenciamento das configurações dos servidores das aplicações.</li>
        </div>
      </div>
      <div class="timeline-item">
        <div class="timeline-content">
          <h3>Desenvolvedor de software - Júnior</h3>
          <p>Defensoria Pública do Estado do Piauí · (dez de 2021 - mar de 2023)</p>
          <p>Na Defensoria Pública do Estado do Piauí eu trabalho no setor desenvolvimento realizando principalmente as
            seguintes rotinas:</p>
          <li>Criação e manutenção de softwares;</li>
          <li>Realização de testes unitários e de integração;</li>
          <li>Configuração e gerenciamento das configurações dos servidores das aplicações.</li>
        </div>
      </div>
      <div class="timeline-item">
        <div class="timeline-content">
          <h3>Desenvolvedor de software - temporário</h3>
          <p>Defensoria Pública do Estado do Piauí · (out de 2021 - nov de 2021)</p>
          <p>Na defensoria atuei de forma temporária do começo ao final do mês de Outubro de 2021, auxiliei no
            desenvolvimento de sistemas internos utilizando a linguagem de programação Python.
          </p>
        </div>
      </div>
      <div class="timeline-item">
        <div class="timeline-content">
          <h3>Estagiário de TI</h3>
          <p>Grupo Vanguarda · Estágio · (abr de 2019 - mar de 2021)</p>
          <p>No Grupo Vanguarda atuei como estagiário de Service Desk, abaixo a apresentação das atividades do meu dia a
            dia:</p>
          <ul>
            <li>Recebimento de ordens de serviços por meio de um sistema próprio para isso, por meio de ligação
              telefônica e e-mail;</li>
            <li>Análise e solução das ordens de serviços;</li>
            <li>Conexão remota por meio do VNC e TeamViwer;</li>
            <li>Configuração remota de estações trabalho e PDVs.</li>
          </ul>
        </div>
      </div>
      <div class="timeline-item">
        <div class="timeline-content">
          <h3>Estagiário - ensino médio</h3>
          <p>Med Imagem · Estágio · (mar de 2015 - dez de 2016)</p>
          <p>No Grupo Medi Imagem atuei como estagiário nível médio no setor de autorização, Abaixo a apresentação das
            principais atividades:</p>
          <ul>
            <li>Recolhimento e organização de prontuários médicos;</li>
            <li>Recebimento das solicitações de procedimentos cirúrgicos ou medicamentos por parte dos médicos;</li>
            <li>Comunicação com os convênios médicos vinculados para informar sobre as solicitações médicas;</li>
            <li>Feedback constante com o grupo de enfermagem, tendo como principal informação a autorização de</li>
          </ul>
        </div>
      </div>
    </div>
  </div>
</template>

<style scoped>
.timeline {
  position: relative;
  margin: 20px auto;
  padding: 0 0 40px 0;
  width: 100%;
}

.timeline::before {
  content: "";
  position: absolute;
  top: 0;
  left: 20px;
  width: 4px;
  height: 96%;
  background-color: var(--primary-color);
}

.timeline-item {
  position: relative;
  margin: 20px 0;
  padding-left: 50px;
}

.timeline-item::before {
  content: "";
  position: absolute;
  top: 20px;
  left: 14px;
  width: 15px;
  height: 15px;
  background-color: var(--color-background);
  border: 4px solid var(--primary-color);
  border-radius: 50%;
  z-index: 1;
}

.timeline-content {
  background-color: var(--color-background-soft);
  border-radius: 8px;
  padding: 15px;
  box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
  position: relative;
  z-index: 2;
}

.timeline-content h3 {
  margin: 0 0 5px;
  font-size: 18px;
  color: var(--primary-color);
  font-weight: 500;
}

.timeline-content p {
  margin: 0;
  font-size: 14px;
  color: var(--color-on-background);
}

/* Responsividade */
@media (max-width: 768px) {
  .timeline::before {
    left: 10px;
  }

  .timeline-content {
    width: 75vw;
  }

  .timeline-item {
    padding-left: 40px;
  }

  .timeline-item::before {
    left: 4px;
  }
}
</style>
