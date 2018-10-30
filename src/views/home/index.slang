
link rel="stylesheet" href="/css/chartist.min.css"
css:
  body {
    font-family: Arial, Helvetica, sans-serif;
    color: black;
    background: #c2e9fb;
    background-image: linear-gradient(90deg, #a1c4fd 0%, #c2e9fb 100%);
  }

  .wrapper {
    width: 100%;
    text-align: center;
  }

  .ct-label,
  .ct-grid,
  .ct-axis-title {
    color: black;
    fill: black;
  }

  .bigtemp {
    font-size: 50px;
    font-weight: 700;
    color: #d70206;
  }

.wrapper
  h1 Temperatura FIEC
  .bigtemp 0 °C
  a.btn.btn-light.btn-sm href="http://192.168.0.5:3000/?time=3600" Horas
  a.btn.btn-light.btn-sm href="http://192.168.0.5:3000/?time=60" Minutos
  a.btn.btn-light.btn-sm href="http://192.168.0.5:3000/?time=1" Segundos
  .ct-chart
  script src="/js/chartist.min.js"
  script src="/js/jquery-3.3.1.min.js"
  javascript:
    function render(data) {
      var options = {
        height: 400,
        high: 50,
        low: 0,
        fullWidth: true,
        showArea: true,
        axisX: {
          showLabel: false,
          offset: 0
        },
      };
      var responsiveOptions = [
        ['screen and (min-width: 641px) and (max-width: 1024px)', {
          showPoint: false
        }],
        ['screen and (max-width: 640px)', {
          showLine: false
        }]
      ];
      new Chartist.Line('.ct-chart', data, options, responsiveOptions);
    }

    function addData(rawData) {
      var data = {
        labels: [],
        series: [[]]
      };
      for (var i = 0; i < rawData.length; i++) {
        data.series[0].unshift(rawData[i].grados);
        data.labels.unshift(new Date(rawData[i].created_at).toLocaleTimeString());
      }
      $(".bigtemp").text(rawData[0].grados + "°C");
      $("title").text("Temperatura FIEC " + rawData[0].grados + "°C");
      render(data);
    }
    var time = window.location.search;
    setInterval(function () {
      $.getJSON("http://192.168.0.5:3000/temperaturas.json" + time, addData)
    }, 1000);
