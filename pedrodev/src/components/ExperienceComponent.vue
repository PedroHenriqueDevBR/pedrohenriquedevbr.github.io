<template>
  <div class="container">
    <h1>Experiências</h1>
    <hr class="divider">

    <div class="timeline">
      <div class="timeline-item">
        <div class="timeline-content">
          <h3>Software Developer</h3>
          <p>Company XYZ (2020 - Present)</p>
          <p>Developed web applications using modern JavaScript frameworks like Vue.js and React.</p>
        </div>
      </div>
      <div class="timeline-item">
        <div class="timeline-content">
          <h3>Junior Developer</h3>
          <p>Company ABC (2018 - 2020)</p>
          <p>Assisted in the development of e-commerce platforms and maintained legacy systems.</p>
        </div>
      </div>
      <div class="timeline-item">
        <div class="timeline-content">
          <h3>Intern</h3>
          <p>Startup 123 (2017 - 2018)</p>
          <p>Learned the basics of web development and contributed to small projects.</p>
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
  height: 90%;
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
