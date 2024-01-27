  let tiempoRestante = 60;
  let temporizadorInterval;

  const temporizadorElemento = document.getElementById('temporizador');
  const iniciarBoton = document.getElementById('iniciar');
  const detenerBoton = document.getElementById('detener');
  const reiniciarBoton = document.getElementById('reiniciar');

  function actualizarTemporizador() {
    const minutos = Math.floor(tiempoRestante / 60);
    const segundos = tiempoRestante % 60;

    const tiempoFormateado = `${minutos}:${segundos < 10 ? '0' : ''}${segundos}`;
    temporizadorElemento.textContent = tiempoFormateado;

    tiempoRestante--;

    if (tiempoRestante < 0) {
      clearInterval(temporizadorInterval);
      temporizadorElemento.textContent = 'Tiempo terminado';
    }
  }

  function iniciarTemporizador() {
    if (!temporizadorInterval) {
      temporizadorInterval = setInterval(actualizarTemporizador, 1000);
    }
  }

  function detenerTemporizador() {
    clearInterval(temporizadorInterval);
    temporizadorInterval = null;
  }

  function reiniciarTemporizador() {
    tiempoRestante = 60;
    clearInterval(temporizadorInterval);
    temporizadorInterval = null;
    actualizarTemporizador();
  }

  iniciarBoton.addEventListener('click', iniciarTemporizador);
  detenerBoton.addEventListener('click', detenerTemporizador);
  reiniciarBoton.addEventListener('click', reiniciarTemporizador);
