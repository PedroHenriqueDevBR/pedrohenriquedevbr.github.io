<template>
  <div class="container">
    <h1 class="primary-color-text">{{ $t('experiencias') }}</h1>

    <div class="timeline">
      <div class="timeline-item">
        <div class="timeline-content" v-html="$t('desenvolvedor_pleno')"></div>
      </div>
      <div class="timeline-item">
        <div class="timeline-content" v-html="$t('desenvolvedor_junior')"></div>
      </div>
      <div class="timeline-item">
        <div class="timeline-content" v-html="$t('desenvolvedor_temporario')">
        </div>
      </div>
      <div class="timeline-item">
        <div class="timeline-content" v-html="$t('estagiario_ti')"></div>
      </div>
      <div class="timeline-item">
        <div class="timeline-content" v-html="$t('estagiario_ensino_medio')"></div>
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
  top: 16px;
  left: 20px;
  width: 4px;
  height: 94%;
  background-color: var(--primary-color);
  border-radius: 8px;
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
  margin: 0 0 5px !important;
  font-size: 18px !important;
  color: var(--primary-color) !important;
  font-weight: 500 !important;
}

.timeline-content p {
  margin: 0;
  font-size: 14px;
  color: var(--color-on-background);
}

@media (max-width: 700px) {
  .timeline::before {
    left: 10px;
    height: 97.5%;
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

@media (min-width: 701px) {
  .timeline::before {
    left: 10px;
    height: 96%;
  }

  .timeline-content {
    width: 100%;
  }

  .timeline-item {
    padding-left: 40px;
  }

  .timeline-item::before {
    left: 4px;
  }
}
</style>
