$(document).ready(function() {
  // This is called after the document has loaded in its entirety
  // This guarantees that any elements we bind to will exist on the page
  // when we try to bind to them

  $("#outer").on("submit", "#get-cons-data-form", function(event) {
    event.preventDefault();

      var $obj = $(this);
      var url = $obj.attr("action");
      var method = $obj.attr("method");

      // console.log($obj);
      // console.log(url);
      // console.log(method);

      $.ajax({
        method: method,
        url: url
      })

      .done(function(response){
        console.log(response);
        console.log(JSON.parse(response));
        //$obj.next().next().html(response);
        Highcharts.chart('get-data', {
            title: {
                text: 'NYC Water Consumption (million_gallons/day), 1979-2016'
            },
            subtitle: {
                text: 'Source: https://opendata.cityofnewyork.us/'
            },
            yAxis: {
                title: {
                    text: 'Water Consumption'
                }
            },
            legend: {
                layout: 'vertical',
                align: 'right',
                verticalAlign: 'middle'
            },
            plotOptions: {
                series: {
                    label: {
                        connectorAllowed: false
                    },
                    pointStart: 1979
                }
            },
            series: JSON.parse(response),
            responsive: {
                rules: [{
                    condition: {
                        maxWidth: 500
                    },
                    chartOptions: {
                        legend: {
                            layout: 'horizontal',
                            align: 'center',
                            verticalAlign: 'bottom'
                        }
                    }
                }]
            }
});
      })

    });

  $("#outer").on("submit", "#get-pop-data-form", function(event) {
    event.preventDefault();

      var $obj = $(this);
      var url = $obj.attr("action");
      var method = $obj.attr("method");

      // console.log($obj);
      // console.log(url);
      // console.log(method);

      $.ajax({
        method: method,
        url: url
      })

      .done(function(response){
        console.log(response);
        console.log(JSON.parse(response));
        //$obj.next().next().html(response);
        Highcharts.chart('get-data', {
            title: {
                text: 'NYC Population, 1979-2016'
            },
            subtitle: {
                text: 'Source: https://opendata.cityofnewyork.us/'
            },
            yAxis: {
                title: {
                    text: 'Population'
                }
            },
            legend: {
                layout: 'vertical',
                align: 'right',
                verticalAlign: 'middle'
            },
            plotOptions: {
                series: {
                    label: {
                        connectorAllowed: false
                    },
                    pointStart: 1979
                }
            },
            series: JSON.parse(response),
            responsive: {
                rules: [{
                    condition: {
                        maxWidth: 500
                    },
                    chartOptions: {
                        legend: {
                            layout: 'horizontal',
                            align: 'center',
                            verticalAlign: 'bottom'
                        }
                    }
                }]
            }
});
      })

    });

});
