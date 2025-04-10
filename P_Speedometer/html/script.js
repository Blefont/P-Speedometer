window.addEventListener('message', function (event) {
  const data = event.data;

  if (data.action === 'update') {
    document.querySelector('.hud').style.display = 'flex';

    const speed = Math.floor(data.speed || 0);
    const rpm = Math.min(100, data.rpm || 0);
    const fuel = Math.min(100, data.fuel || 0);

    document.getElementById('speed').textContent = speed.toString().padStart(3, '0');
    document.getElementById('rpm-bar').style.width = rpm + '%';
    document.getElementById('fuel-bar').style.width = fuel + '%';
  }

  if (data.action === 'hide') {
    document.querySelector('.hud').style.display = 'none';
  }
});
