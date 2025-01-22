
 /* < !--Line Chart-- >*/

document.addEventListener("DOMContentLoaded", () => {
    new ApexCharts(document.querySelector("#lineChart_ApexCharts"), {
        series: [{
            name: "Desktops",
            data: [10, 41, 35, 51, 49, 62, 69, 91, 148]
        }],
        chart: {
            height: 350,
            type: 'line',
            zoom: {
                enabled: false
            }
        },
        dataLabels: {
            enabled: false
        },
        stroke: {
            curve: 'straight'
        },
        grid: {
            row: {
                colors: ['#f3f3f3', 'transparent'], // takes an array which will be repeated on columns
                opacity: 0.5
            },
        },
        xaxis: {
            categories: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep'],
        }
    }).render();
});
//< !--End Line Chart-- >


    //< !--Area Chart-- >
    //          <div id="areaChart_ApexCharts"></div>

    //        <% --  < script >
    document.addEventListener("DOMContentLoaded", () => {
        const series = {
            "monthDataSeries1": {
                "prices": [
                    8107.85,
                    8128.0,
                    8122.9,
                    8165.5,
                    8340.7,
                    8423.7,
                    8423.5,
                    8514.3,
                    8481.85,
                    8487.7,
                    8506.9,
                    8626.2,
                    8668.95,
                    8602.3,
                    8607.55,
                    8512.9,
                    8496.25,
                    8600.65,
                    8881.1,
                    9340.85
                ],
                "dates": [
                    "13 Nov 2017",
                    "14 Nov 2017",
                    "15 Nov 2017",
                    "16 Nov 2017",
                    "17 Nov 2017",
                    "20 Nov 2017",
                    "21 Nov 2017",
                    "22 Nov 2017",
                    "23 Nov 2017",
                    "24 Nov 2017",
                    "27 Nov 2017",
                    "28 Nov 2017",
                    "29 Nov 2017",
                    "30 Nov 2017",
                    "01 Dec 2017",
                    "04 Dec 2017",
                    "05 Dec 2017",
                    "06 Dec 2017",
                    "07 Dec 2017",
                    "08 Dec 2017"
                ]
            },
            "monthDataSeries2": {
                "prices": [
                    8423.7,
                    8423.5,
                    8514.3,
                    8481.85,
                    8487.7,
                    8506.9,
                    8626.2,
                    8668.95,
                    8602.3,
                    8607.55,
                    8512.9,
                    8496.25,
                    8600.65,
                    8881.1,
                    9040.85,
                    8340.7,
                    8165.5,
                    8122.9,
                    8107.85,
                    8128.0
                ],
                "dates": [
                    "13 Nov 2017",
                    "14 Nov 2017",
                    "15 Nov 2017",
                    "16 Nov 2017",
                    "17 Nov 2017",
                    "20 Nov 2017",
                    "21 Nov 2017",
                    "22 Nov 2017",
                    "23 Nov 2017",
                    "24 Nov 2017",
                    "27 Nov 2017",
                    "28 Nov 2017",
                    "29 Nov 2017",
                    "30 Nov 2017",
                    "01 Dec 2017",
                    "04 Dec 2017",
                    "05 Dec 2017",
                    "06 Dec 2017",
                    "07 Dec 2017",
                    "08 Dec 2017"
                ]
            },
            "monthDataSeries3": {
                "prices": [
                    7114.25,
                    7126.6,
                    7116.95,
                    7203.7,
                    7233.75,
                    7451.0,
                    7381.15,
                    7348.95,
                    7347.75,
                    7311.25,
                    7266.4,
                    7253.25,
                    7215.45,
                    7266.35,
                    7315.25,
                    7237.2,
                    7191.4,
                    7238.95,
                    7222.6,
                    7217.9,
                    7359.3,
                    7371.55,
                    7371.15,
                    7469.2,
                    7429.25,
                    7434.65,
                    7451.1,
                    7475.25,
                    7566.25,
                    7556.8,
                    7525.55,
                    7555.45,
                    7560.9,
                    7490.7,
                    7527.6,
                    7551.9,
                    7514.85,
                    7577.95,
                    7592.3,
                    7621.95,
                    7707.95,
                    7859.1,
                    7815.7,
                    7739.0,
                    7778.7,
                    7839.45,
                    7756.45,
                    7669.2,
                    7580.45,
                    7452.85,
                    7617.25,
                    7701.6,
                    7606.8,
                    7620.05,
                    7513.85,
                    7498.45,
                    7575.45,
                    7601.95,
                    7589.1,
                    7525.85,
                    7569.5,
                    7702.5,
                    7812.7,
                    7803.75,
                    7816.3,
                    7851.15,
                    7912.2,
                    7972.8,
                    8145.0,
                    8161.1,
                    8121.05,
                    8071.25,
                    8088.2,
                    8154.45,
                    8148.3,
                    8122.05,
                    8132.65,
                    8074.55,
                    7952.8,
                    7885.55,
                    7733.9,
                    7897.15,
                    7973.15,
                    7888.5,
                    7842.8,
                    7838.4,
                    7909.85,
                    7892.75,
                    7897.75,
                    7820.05,
                    7904.4,
                    7872.2,
                    7847.5,
                    7849.55,
                    7789.6,
                    7736.35,
                    7819.4,
                    7875.35,
                    7871.8,
                    8076.5,
                    8114.8,
                    8193.55,
                    8217.1,
                    8235.05,
                    8215.3,
                    8216.4,
                    8301.55,
                    8235.25,
                    8229.75,
                    8201.95,
                    8164.95,
                    8107.85,
                    8128.0,
                    8122.9,
                    8165.5,
                    8340.7,
                    8423.7,
                    8423.5,
                    8514.3,
                    8481.85,
                    8487.7,
                    8506.9,
                    8626.2
                ],
                "dates": [
                    "02 Jun 2017",
                    "05 Jun 2017",
                    "06 Jun 2017",
                    "07 Jun 2017",
                    "08 Jun 2017",
                    "09 Jun 2017",
                    "12 Jun 2017",
                    "13 Jun 2017",
                    "14 Jun 2017",
                    "15 Jun 2017",
                    "16 Jun 2017",
                    "19 Jun 2017",
                    "20 Jun 2017",
                    "21 Jun 2017",
                    "22 Jun 2017",
                    "23 Jun 2017",
                    "27 Jun 2017",
                    "28 Jun 2017",
                    "29 Jun 2017",
                    "30 Jun 2017",
                    "03 Jul 2017",
                    "04 Jul 2017",
                    "05 Jul 2017",
                    "06 Jul 2017",
                    "07 Jul 2017",
                    "10 Jul 2017",
                    "11 Jul 2017",
                    "12 Jul 2017",
                    "13 Jul 2017",
                    "14 Jul 2017",
                    "17 Jul 2017",
                    "18 Jul 2017",
                    "19 Jul 2017",
                    "20 Jul 2017",
                    "21 Jul 2017",
                    "24 Jul 2017",
                    "25 Jul 2017",
                    "26 Jul 2017",
                    "27 Jul 2017",
                    "28 Jul 2017",
                    "31 Jul 2017",
                    "01 Aug 2017",
                    "02 Aug 2017",
                    "03 Aug 2017",
                    "04 Aug 2017",
                    "07 Aug 2017",
                    "08 Aug 2017",
                    "09 Aug 2017",
                    "10 Aug 2017",
                    "11 Aug 2017",
                    "14 Aug 2017",
                    "16 Aug 2017",
                    "17 Aug 2017",
                    "18 Aug 2017",
                    "21 Aug 2017",
                    "22 Aug 2017",
                    "23 Aug 2017",
                    "24 Aug 2017",
                    "28 Aug 2017",
                    "29 Aug 2017",
                    "30 Aug 2017",
                    "31 Aug 2017",
                    "01 Sep 2017",
                    "04 Sep 2017",
                    "05 Sep 2017",
                    "06 Sep 2017",
                    "07 Sep 2017",
                    "08 Sep 2017",
                    "11 Sep 2017",
                    "12 Sep 2017",
                    "13 Sep 2017",
                    "14 Sep 2017",
                    "15 Sep 2017",
                    "18 Sep 2017",
                    "19 Sep 2017",
                    "20 Sep 2017",
                    "21 Sep 2017",
                    "22 Sep 2017",
                    "25 Sep 2017",
                    "26 Sep 2017",
                    "27 Sep 2017",
                    "28 Sep 2017",
                    "29 Sep 2017",
                    "03 Oct 2017",
                    "04 Oct 2017",
                    "05 Oct 2017",
                    "06 Oct 2017",
                    "09 Oct 2017",
                    "10 Oct 2017",
                    "11 Oct 2017",
                    "12 Oct 2017",
                    "13 Oct 2017",
                    "16 Oct 2017",
                    "17 Oct 2017",
                    "18 Oct 2017",
                    "19 Oct 2017",
                    "23 Oct 2017",
                    "24 Oct 2017",
                    "25 Oct 2017",
                    "26 Oct 2017",
                    "27 Oct 2017",
                    "30 Oct 2017",
                    "31 Oct 2017",
                    "01 Nov 2017",
                    "02 Nov 2017",
                    "03 Nov 2017",
                    "06 Nov 2017",
                    "07 Nov 2017",
                    "08 Nov 2017",
                    "09 Nov 2017",
                    "10 Nov 2017",
                    "13 Nov 2017",
                    "14 Nov 2017",
                    "15 Nov 2017",
                    "16 Nov 2017",
                    "17 Nov 2017",
                    "20 Nov 2017",
                    "21 Nov 2017",
                    "22 Nov 2017",
                    "23 Nov 2017",
                    "24 Nov 2017",
                    "27 Nov 2017",
                    "28 Nov 2017"
                ]
            }
        }
        new ApexCharts(document.querySelector("#areaChart_ApexCharts"), {
            series: [{
                name: "STOCK ABC",
                data: series.monthDataSeries1.prices
            }],
            chart: {
                type: 'area',
                height: 350,
                zoom: {
                    enabled: false
                }
            },
            dataLabels: {
                enabled: false
            },
            stroke: {
                curve: 'straight'
            },
            subtitle: {
                text: 'Price Movements',
                align: 'left'
            },
            labels: series.monthDataSeries1.dates,
            xaxis: {
                type: 'datetime',
            },
            yaxis: {
                opposite: true
            },
            legend: {
                horizontalAlign: 'left'
            }
        }).render();
    });
              //</script > --%>
              //< !--End Area Chart-- >

   //< !--Column Chart-- >
   //           <div id="columnChart_ApexCharts"></div>

   //           <script>
                document.addEventListener("DOMContentLoaded", () => {
                    new ApexCharts(document.querySelector("#columnChart_ApexCharts"), {
                    series: [{
                      name: 'Net Profit',
                      data: [44, 55, 57, 56, 61, 58, 63, 60, 66]
                    }, {
                      name: 'Revenue',
                      data: [76, 85, 101, 98, 87, 105, 91, 114, 94]
                    }, {
                      name: 'Free Cash Flow',
                      data: [35, 41, 36, 26, 45, 48, 52, 53, 41]
                    }],
                    chart: {
                      type: 'bar',
                      height: 350
                    },
                    plotOptions: {
                      bar: {
                        horizontal: false,
                        columnWidth: '55%',
                        endingShape: 'rounded'
                      },
                    },
                    dataLabels: {
                      enabled: false
                    },
                    stroke: {
                      show: true,
                      width: 2,
                      colors: ['transparent']
                    },
                    xaxis: {
                      categories: ['Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct'],
                    },
                    yaxis: {
                      title: {
                        text: '$ (thousands)'
                      }
                    },
                    fill: {
                      opacity: 1
                    },
                    tooltip: {
                      y: {
                        formatter: function(val) {
                          return "$ " + val + " thousands"
                        }
                      }
                    }
                  }).render();
                });
              {/*</script>*/}
              {/*<!--End Column Chart-- >*/}

              // < !--Bar Chart-- >
              //<div id="barChart_ApexCharts"></div>

              //<script>
                document.addEventListener("DOMContentLoaded", () => {
                    new ApexCharts(document.querySelector("#barChart_ApexCharts"), {
                    series: [{
                      data: [400, 430, 448, 470, 540, 580, 690, 1100, 1200, 1380]
                    }],
                    chart: {
                      type: 'bar',
                      height: 350
                    },
                    plotOptions: {
                      bar: {
                        borderRadius: 4,
                        horizontal: true,
                      }
                    },
                    dataLabels: {
                      enabled: false
                    },
                    xaxis: {
                      categories: ['South Korea', 'Canada', 'United Kingdom', 'Netherlands', 'Italy', 'France', 'Japan',
                        'United States', 'China', 'Germany'
                      ],
                    }
                  }).render();
                });
              {/*</script>*/}
              {/*<!--End Bar Chart-- >*/}

              //        < !--Pie Chart-- >
              //<div id="pieChart_ApexCharts"></div>

              //<script>
                document.addEventListener("DOMContentLoaded", () => {
                    new ApexCharts(document.querySelector("#pieChart_ApexCharts"), {
                    series: [44, 55, 13, 43, 22],
                    chart: {
                      height: 350,
                      type: 'pie',
                      toolbar: {
                        show: true
                      }
                    },
                    labels: ['Team A', 'Team B', 'Team C', 'Team D', 'Team E']
                  }).render();
                });
              {/*</script>*/}
{/*<!--End Pie Chart-- >*/ }

    //< !--Donut Chart-- >
    //          <div id="donutChart_ApexCharts"></div>

    //          <script>
                document.addEventListener("DOMContentLoaded", () => {
                    new ApexCharts(document.querySelector("#donutChart_ApexCharts"), {
                    series: [44, 55, 13, 43, 22],
                    chart: {
                      height: 350,
                      type: 'donut',
                      toolbar: {
                        show: true
                      }
                    },
                    labels: ['Team A', 'Team B', 'Team C', 'Team D', 'Team E'],
                  }).render();
                });
              {/*</script>*/}
              {/*<!--End Donut Chart-- >*/}


  //< !--Radar Chart-- >
  //            <div id="radarChart_ApexCharts"></div>

  //            <script>
                document.addEventListener("DOMContentLoaded", () => {
                    new ApexCharts(document.querySelector("#radarChart_ApexCharts"), {
                    series: [{
                      name: 'Series 1',
                      data: [80, 50, 30, 40, 100, 20],
                    }],
                    chart: {
                      height: 350,
                      type: 'radar',
                    },
                    xaxis: {
                      categories: ['January', 'February', 'March', 'April', 'May', 'June']
                    }
                  }).render();
                });
              //</script>
              //<!--End Radar Chart-- >


  //< !--Polar Area Chart-- >
  //            <div id="polarAreaChart_ApexCharts"></div>

  //            <script>
                document.addEventListener("DOMContentLoaded", () => {
                    new ApexCharts(document.querySelector("#polarAreaChart_ApexCharts"), {
                    series: [14, 23, 21, 17, 15, 10, 12, 17, 21],
                    chart: {
                      type: 'polarArea',
                      height: 350,
                      toolbar: {
                        show: true
                      }
                    },
                    stroke: {
                      colors: ['#fff']
                    },
                    fill: {
                      opacity: 0.8
                    }
                  }).render();
                });
              //</script>
              //<!--End Polar Area Chart-- >


 //< !--Radial Bar Chart-- >
 //             <div id="radialBarChart_ApexCharts"></div>

 //             <script>
                document.addEventListener("DOMContentLoaded", () => {
                    new ApexCharts(document.querySelector("#radialBarChart_ApexCharts"), {
                    series: [44, 55, 67, 83],
                    chart: {
                      height: 350,
                      type: 'radialBar',
                      toolbar: {
                        show: true
                      }
                    },
                    plotOptions: {
                      radialBar: {
                        dataLabels: {
                          name: {
                            fontSize: '22px',
                          },
                          value: {
                            fontSize: '16px',
                          },
                          total: {
                            show: true,
                            label: 'Total',
                            formatter: function(w) {
                              // By default this function returns the average of all series. The below is just an example to show the use of custom formatter function
                              return 249
                            }
                          }
                        }
                      }
                    },
                    labels: ['Apples', 'Oranges', 'Bananas', 'Berries'],
                  }).render();
                });
              {/*</script>*/}
              {/*<!--End Radial Bar Chart-- >*/}




   //< !--Bubble Chart-- >
   //           <div id="bubbleChart_ApexCharts"></div>

   //           <script>
                document.addEventListener("DOMContentLoaded", () => {
                  function generateData(baseval, count, yrange) {
                    var i = 0;
                    var series = [];
                    while (i < count) {
                      var x = Math.floor(Math.random() * (750 - 1 + 1)) + 1;;
                      var y = Math.floor(Math.random() * (yrange.max - yrange.min + 1)) + yrange.min;
                      var z = Math.floor(Math.random() * (75 - 15 + 1)) + 15;
                      series.push([x, y, z]);
                      baseval += 86400000;
                      i++;
                    }
                    return series;
                  }
                    new ApexCharts(document.querySelector("#bubbleChart_ApexCharts"), {
                    series: [{
                        name: 'Bubble1',
                        data: generateData(new Date('11 Feb 2017 GMT').getTime(), 20, {
                          min: 10,
                          max: 60
                        })
                      },
                      {
                        name: 'Bubble2',
                        data: generateData(new Date('11 Feb 2017 GMT').getTime(), 20, {
                          min: 10,
                          max: 60
                        })
                      },
                      {
                        name: 'Bubble3',
                        data: generateData(new Date('11 Feb 2017 GMT').getTime(), 20, {
                          min: 10,
                          max: 60
                        })
                      },
                      {
                        name: 'Bubble4',
                        data: generateData(new Date('11 Feb 2017 GMT').getTime(), 20, {
                          min: 10,
                          max: 60
                        })
                      }
                    ],
                    chart: {
                      height: 333,
                      type: 'bubble',
                    },
                    dataLabels: {
                      enabled: false
                    },
                    fill: {
                      opacity: 0.8
                    },
                    xaxis: {
                      tickAmount: 12,
                      type: 'category',
                    },
                    yaxis: {
                      max: 70
                    }
                  }).render();
                });
              {/*</script>*/}
              {/*<!--End Bubble Chart-- >*/}



 //< !--Line Chart-- >
 //             <canvas id="lineChart_Chartjs" style="max-height: 400px;"></canvas>
 //             <script>
                document.addEventListener("DOMContentLoaded", () => {
                    new Chart(document.querySelector('#lineChart_Chartjs'), {
                    type: 'line',
                    data: {
                      labels: ['January', 'February', 'March', 'April', 'May', 'June', 'July'],
                      datasets: [{
                        label: 'Line Chart',
                        data: [65, 59, 80, 81, 56, 55, 40],
                        fill: false,
                        borderColor: 'rgb(75, 192, 192)',
                        tension: 0.1
                      }]
                    },
                    options: {
                      scales: {
                        y: {
                          beginAtZero: true
                        }
                      }
                    }
                  });
                });
              //</script>
              //<!--End Line CHart-- >

   //< !--Bar Chart-- >
   //           <canvas id="barChart_Chartjs" style="max-height: 400px;"></canvas>
   //           <script>
                document.addEventListener("DOMContentLoaded", () => {
                    new Chart(document.querySelector('#barChart_Chartjs'), {
                    type: 'bar',
                    data: {
                      labels: ['January', 'February', 'March', 'April', 'May', 'June', 'July'],
                      datasets: [{
                        label: 'Bar Chart',
                        data: [65, 59, 80, 81, 56, 55, 40],
                        backgroundColor: [
                          'rgba(255, 99, 132, 0.2)',
                          'rgba(255, 159, 64, 0.2)',
                          'rgba(255, 205, 86, 0.2)',
                          'rgba(75, 192, 192, 0.2)',
                          'rgba(54, 162, 235, 0.2)',
                          'rgba(153, 102, 255, 0.2)',
                          'rgba(201, 203, 207, 0.2)'
                        ],
                        borderColor: [
                          'rgb(255, 99, 132)',
                          'rgb(255, 159, 64)',
                          'rgb(255, 205, 86)',
                          'rgb(75, 192, 192)',
                          'rgb(54, 162, 235)',
                          'rgb(153, 102, 255)',
                          'rgb(201, 203, 207)'
                        ],
                        borderWidth: 1
                      }]
                    },
                    options: {
                      scales: {
                        y: {
                          beginAtZero: true
                        }
                      }
                    }
                  });
                });
              {/*</script>*/}
              {/*<!--End Bar CHart-- >*/}


 //< !--Pie Chart-- >
 //             <canvas id="pieChart_Chartjs" style="max-height: 400px;"></canvas>
 //             <script>
                document.addEventListener("DOMContentLoaded", () => {
                    new Chart(document.querySelector('#pieChart_Chartjs'), {
                    type: 'pie',
                    data: {
                      labels: [
                        'Red',
                        'Blue',
                        'Yellow'
                      ],
                      datasets: [{
                        label: 'My First Dataset',
                        data: [300, 50, 100],
                        backgroundColor: [
                          'rgb(255, 99, 132)',
                          'rgb(54, 162, 235)',
                          'rgb(255, 205, 86)'
                        ],
                        hoverOffset: 4
                      }]
                    }
                  });
                });
              //</script>
              //<!--End Pie CHart-- >

//< !--Doughnut Chart-- >
//              <canvas id="doughnutChart_Chartjs" style="max-height: 400px;"></canvas>
//              <script>
                document.addEventListener("DOMContentLoaded", () => {
                    new Chart(document.querySelector('#doughnutChart_Chartjs'), {
                    type: 'doughnut',
                    data: {
                      labels: [
                        'Red',
                        'Blue',
                        'Yellow'
                      ],
                      datasets: [{
                        label: 'My First Dataset',
                        data: [300, 50, 100],
                        backgroundColor: [
                          'rgb(255, 99, 132)',
                          'rgb(54, 162, 235)',
                          'rgb(255, 205, 86)'
                        ],
                        hoverOffset: 4
                      }]
                    }
                  });
                });
              //</script>
              //<!--End Doughnut CHart-- >



  //< !--Radar Chart-- >
  //            <canvas id="radarChart_Chartjs" style="max-height: 400px;"></canvas>
  //            <script>
                document.addEventListener("DOMContentLoaded", () => {
                    new Chart(document.querySelector('#radarChart_Chartjs'), {
                    type: 'radar',
                    data: {
                      labels: [
                        'Eating',
                        'Drinking',
                        'Sleeping',
                        'Designing',
                        'Coding',
                        'Cycling',
                        'Running'
                      ],
                      datasets: [{
                        label: 'First Dataset',
                        data: [65, 59, 90, 81, 56, 55, 40],
                        fill: true,
                        backgroundColor: 'rgba(255, 99, 132, 0.2)',
                        borderColor: 'rgb(255, 99, 132)',
                        pointBackgroundColor: 'rgb(255, 99, 132)',
                        pointBorderColor: '#fff',
                        pointHoverBackgroundColor: '#fff',
                        pointHoverBorderColor: 'rgb(255, 99, 132)'
                      }, {
                        label: 'Second Dataset',
                        data: [28, 48, 40, 19, 96, 27, 100],
                        fill: true,
                        backgroundColor: 'rgba(54, 162, 235, 0.2)',
                        borderColor: 'rgb(54, 162, 235)',
                        pointBackgroundColor: 'rgb(54, 162, 235)',
                        pointBorderColor: '#fff',
                        pointHoverBackgroundColor: '#fff',
                        pointHoverBorderColor: 'rgb(54, 162, 235)'
                      }]
                    },
                    options: {
                      elements: {
                        line: {
                          borderWidth: 3
                        }
                      }
                    }
                  });
                });
              {/*</script>*/}
              {/*<!--End Radar CHart-- >*/}



 //< !--Polar Area Chart-- >
 //             <canvas id="polarAreaChart_Chartjs" style="max-height: 400px;"></canvas>
 //             <script>
                document.addEventListener("DOMContentLoaded", () => {
                    new Chart(document.querySelector('#polarAreaChart_Chartjs'), {
                    type: 'polarArea',
                    data: {
                      labels: [
                        'Red',
                        'Green',
                        'Yellow',
                        'Grey',
                        'Blue'
                      ],
                      datasets: [{
                        label: 'My First Dataset',
                        data: [11, 16, 7, 3, 14],
                        backgroundColor: [
                          'rgb(255, 99, 132)',
                          'rgb(75, 192, 192)',
                          'rgb(255, 205, 86)',
                          'rgb(201, 203, 207)',
                          'rgb(54, 162, 235)'
                        ]
                      }]
                    }
                  });
                });
              //</script>
              //<!--End Polar Area Chart-- >

   //< !--Stacked Bar Chart-- >
   //           <canvas id="stakedBarChart_Chartjs" style="max-height: 400px;"></canvas>
   //           <script>
                document.addEventListener("DOMContentLoaded", () => {
                    new Chart(document.querySelector('#stakedBarChart_Chartjs'), {
                    type: 'bar',
                    data: {
                      labels: ['January', 'February', 'March', 'April', 'May', 'June', 'July'],
                      datasets: [{
                          label: 'Dataset 1',
                          data: [-75, -15, 18, 48, 74],
                          backgroundColor: 'rgb(255, 99, 132)',
                        },
                        {
                          label: 'Dataset 2',
                          data: [-11, -1, 12, 62, 95],
                          backgroundColor: 'rgb(75, 192, 192)',
                        },
                        {
                          label: 'Dataset 3',
                          data: [-44, -5, 22, 35, 62],
                          backgroundColor: 'rgb(255, 205, 86)',
                        },
                      ]
                    },
                    options: {
                      plugins: {
                        title: {
                          display: true,
                          text: 'Chart.js Bar Chart - Stacked'
                        },
                      },
                      responsive: true,
                      scales: {
                        x: {
                          stacked: true,
                        },
                        y: {
                          stacked: true
                        }
                      }
                    }
                  });
                });
              {/*</script>*/}
              {/*<!--End Stacked Bar Chart-- >*/}



 //< !--Bubble Chart-- >
 //             <canvas id="bubbleChart_Chartjs" style="max-height: 400px;"></canvas>
 //             <script>
                document.addEventListener("DOMContentLoaded", () => {
                    new Chart(document.querySelector('#bubbleChart_Chartjs'), {
                    type: 'bubble',
                    data: {
                      labels: ['January', 'February', 'March', 'April', 'May', 'June', 'July'],
                      datasets: [{
                          label: 'Dataset 1',
                          data: [{
                              x: 20,
                              y: 30,
                              r: 15
                            },
                            {
                              x: 40,
                              y: 10,
                              r: 10
                            },
                            {
                              x: 15,
                              y: 37,
                              r: 12
                            },
                            {
                              x: 32,
                              y: 42,
                              r: 33
                            }
                          ],
                          borderColor: 'rgb(255, 99, 132)',
                          backgroundColor: 'rgba(255, 99, 132, 0.5)'
                        },
                        {
                          label: 'Dataset 2',
                          data: [{
                              x: 40,
                              y: 25,
                              r: 22
                            },
                            {
                              x: 24,
                              y: 47,
                              r: 11
                            },
                            {
                              x: 65,
                              y: 11,
                              r: 14
                            },
                            {
                              x: 11,
                              y: 55,
                              r: 8
                            }
                          ],
                          borderColor: 'rgb(75, 192, 192)',
                          backgroundColor: 'rgba(75, 192, 192, 0.5)'
                        }
                      ]
                    },
                    options: {
                      responsive: true,
                      plugins: {
                        legend: {
                          position: 'top',
                        },
                        title: {
                          display: true,
                          text: 'Chart.js Bubble Chart'
                        }
                      }
                    }
                  });
                });
              {/*</script>*/}
              {/*<!--End Bubble Chart-- >*/}



  //< !--Line Chart-- >
  //            <div id="lineChart_ECharts" style="min-height: 400px;" class="echart"></div>

  //            <script>
                document.addEventListener("DOMContentLoaded", () => {
                    echarts.init(document.querySelector("#lineChart_ECharts")).setOption({
                    xAxis: {
                      type: 'category',
                      data: ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun']
                    },
                    yAxis: {
                      type: 'value'
                    },
                    series: [{
                      data: [150, 230, 224, 218, 135, 147, 260],
                      type: 'line',
                      smooth: true
                    }]
                  });
                });
              //</script>
              //<!--End Line Chart-- >


 //< !--Area Chart-- >
 //             <div id="areaChart_ECharts" style="min-height: 400px;" class="echart"></div>

 //             <script>
                document.addEventListener("DOMContentLoaded", () => {
                    echarts.init(document.querySelector("#areaChart_ECharts")).setOption({
                    xAxis: {
                      type: 'category',
                      boundaryGap: false,
                      data: ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun']
                    },
                    yAxis: {
                      type: 'value'
                    },
                    series: [{
                      data: [820, 932, 901, 934, 1290, 1330, 1320],
                      type: 'line',
                      smooth: true,
                      areaStyle: {}
                    }]
                  });
                });
              //</script>
              //<!--End Area Chart-- >

     //< !--Bar Chart-- >
     //         <div id="barChart_ECharts" style="min-height: 400px;" class="echart"></div>

     //         <script>
                document.addEventListener("DOMContentLoaded", () => {
                    echarts.init(document.querySelector("#barChart_ECharts")).setOption({
                    xAxis: {
                      type: 'category',
                      data: ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun']
                    },
                    yAxis: {
                      type: 'value'
                    },
                    series: [{
                      data: [120, 200, 150, 80, 70, 110, 130],
                      type: 'bar'
                    }]
                  });
                });
              //</script>
              //<!--End Bar Chart-- >

  //< !--Vertical Bar Chart-- >
  //            <div id="verticalBarChart_ECharts" style="min-height: 400px;" class="echart"></div>

  //            <script>
                document.addEventListener("DOMContentLoaded", () => {
                    echarts.init(document.querySelector("#verticalBarChart_ECharts")).setOption({
                    title: {
                      text: 'World Population'
                    },
                    tooltip: {
                      trigger: 'axis',
                      axisPointer: {
                        type: 'shadow'
                      }
                    },
                    legend: {},
                    grid: {
                      left: '3%',
                      right: '4%',
                      bottom: '3%',
                      containLabel: true
                    },
                    xAxis: {
                      type: 'value',
                      boundaryGap: [0, 0.01]
                    },
                    yAxis: {
                      type: 'category',
                      data: ['Brazil', 'Indonesia', 'USA', 'India', 'China', 'World']
                    },
                    series: [{
                        name: '2011',
                        type: 'bar',
                        data: [18203, 23489, 29034, 104970, 131744, 630230]
                      },
                      {
                        name: '2012',
                        type: 'bar',
                        data: [19325, 23438, 31000, 121594, 134141, 681807]
                      }
                    ]
                  });
                });
              {/*</script>*/}
              {/*<!--End Vertical Bar Chart-- >*/}


 //< !--Pie Chart-- >
 //             <div id="pieChart_ECharts" style="min-height: 400px;" class="echart"></div>

 //             <script>
                document.addEventListener("DOMContentLoaded", () => {
                    echarts.init(document.querySelector("#pieChart_ECharts")).setOption({
                    title: {
                      text: 'Referer of a Website',
                      subtext: 'Fake Data',
                      left: 'center'
                    },
                    tooltip: {
                      trigger: 'item'
                    },
                    legend: {
                      orient: 'vertical',
                      left: 'left'
                    },
                    series: [{
                      name: 'Access From',
                      type: 'pie',
                      radius: '50%',
                      data: [{
                          value: 1048,
                          name: 'Search Engine'
                        },
                        {
                          value: 735,
                          name: 'Direct'
                        },
                        {
                          value: 580,
                          name: 'Email'
                        },
                        {
                          value: 484,
                          name: 'Union Ads'
                        },
                        {
                          value: 300,
                          name: 'Video Ads'
                        }
                      ],
                      emphasis: {
                        itemStyle: {
                          shadowBlur: 10,
                          shadowOffsetX: 0,
                          shadowColor: 'rgba(0, 0, 0, 0.5)'
                        }
                      }
                    }]
                  });
                });
              {/*</script>*/}
              {/*<!--End Pie Chart-- >*/}


              //    < !--Donut Chart-- >
              //<div id="donutChart_ECharts" style="min-height: 400px;" class="echart"></div>

              //<script>
                document.addEventListener("DOMContentLoaded", () => {
                    echarts.init(document.querySelector("#donutChart_ECharts")).setOption({
                    tooltip: {
                      trigger: 'item'
                    },
                    legend: {
                      top: '5%',
                      left: 'center'
                    },
                    series: [{
                      name: 'Access From',
                      type: 'pie',
                      radius: ['40%', '70%'],
                      avoidLabelOverlap: false,
                      label: {
                        show: false,
                        position: 'center'
                      },
                      emphasis: {
                        label: {
                          show: true,
                          fontSize: '18',
                          fontWeight: 'bold'
                        }
                      },
                      labelLine: {
                        show: false
                      },
                      data: [{
                          value: 1048,
                          name: 'Search Engine'
                        },
                        {
                          value: 735,
                          name: 'Direct'
                        },
                        {
                          value: 580,
                          name: 'Email'
                        },
                        {
                          value: 484,
                          name: 'Union Ads'
                        },
                        {
                          value: 300,
                          name: 'Video Ads'
                        }
                      ]
                    }]
                  });
                });
              {/*</script>*/}
              {/*<!--End Donut Chart-- >*/}



  //< !--Radar Chart-- >
  //            <div id="radarChart_ECharts" style="min-height: 400px;" class="echart"></div>

  //            <script>
                document.addEventListener("DOMContentLoaded", () => {
                    echarts.init(document.querySelector("#radarChart_ECharts")).setOption({
                    legend: {
                      data: ['Allocated Budget', 'Actual Spending']
                    },
                    radar: {
                      // shape: 'circle',
                      indicator: [{
                          name: 'Sales',
                          max: 6500
                        },
                        {
                          name: 'Administration',
                          max: 16000
                        },
                        {
                          name: 'Information Technology',
                          max: 30000
                        },
                        {
                          name: 'Customer Support',
                          max: 38000
                        },
                        {
                          name: 'Development',
                          max: 52000
                        },
                        {
                          name: 'Marketing',
                          max: 25000
                        }
                      ]
                    },
                    series: [{
                      name: 'Budget vs spending',
                      type: 'radar',
                      data: [{
                          value: [4200, 3000, 20000, 35000, 50000, 18000],
                          name: 'Allocated Budget'
                        },
                        {
                          value: [5000, 14000, 28000, 26000, 42000, 21000],
                          name: 'Actual Spending'
                        }
                      ]
                    }]
                  });
                });
              {/*</script>*/}
              {/*<!--End Radar Chart-- >*/}


 //< !--Polar Area Chart-- >
 //             <div id="polarAreaChart_ECharts" style="min-height: 400px;" class="echart"></div>

 //             <script>
                document.addEventListener("DOMContentLoaded", () => {
                    echarts.init(document.querySelector("#polarAreaChart_ECharts")).setOption({
                    angleAxis: {
                      type: 'category',
                      data: ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun']
                    },
                    radiusAxis: {},
                    polar: {},
                    series: [{
                        type: 'bar',
                        data: [1, 2, 3, 4, 3, 5, 1],
                        coordinateSystem: 'polar',
                        name: 'A',
                        stack: 'a',
                        emphasis: {
                          focus: 'series'
                        }
                      },
                      {
                        type: 'bar',
                        data: [2, 4, 6, 1, 3, 2, 1],
                        coordinateSystem: 'polar',
                        name: 'B',
                        stack: 'a',
                        emphasis: {
                          focus: 'series'
                        }
                      },
                      {
                        type: 'bar',
                        data: [1, 2, 3, 4, 1, 2, 5],
                        coordinateSystem: 'polar',
                        name: 'C',
                        stack: 'a',
                        emphasis: {
                          focus: 'series'
                        }
                      }
                    ],
                    legend: {
                      show: true,
                      data: ['A', 'B', 'C']
                    }
                  });
                });
              {/*</script>*/}
              {/*<!--End Polar Area Chart-- >*/}


 //< !--Candle Stick Chart-- >
 //             <div id="candleStickChart_ECharts" style="min-height: 400px;" class="echart"></div>

 //             <script>
                document.addEventListener("DOMContentLoaded", () => {
                    echarts.init(document.querySelector("#candleStickChart_ECharts")).setOption({
                    xAxis: {
                      data: ['2017-10-24', '2017-10-25', '2017-10-26', '2017-10-27']
                    },
                    yAxis: {},
                    series: [{
                      type: 'candlestick',
                      data: [
                        [20, 34, 10, 38],
                        [40, 35, 30, 50],
                        [31, 38, 33, 44],
                        [38, 15, 5, 42]
                      ]
                    }]
                  });
                });
              //</script>
              //<!--End Candle Stick Chart-- >




 //< !--Bubble Chart-- >
 //             <div id="bubbleChart_ECharts" style="min-height: 400px;" class="echart"></div>

 //             <script>
                document.addEventListener("DOMContentLoaded", () => {
                  const data = [
                    [
                      [28604, 77, 17096869, 'Australia', 1990],
                      [31163, 77.4, 27662440, 'Canada', 1990],
                      [1516, 68, 1154605773, 'China', 1990],
                      [13670, 74.7, 10582082, 'Cuba', 1990],
                      [28599, 75, 4986705, 'Finland', 1990],
                      [29476, 77.1, 56943299, 'France', 1990],
                      [31476, 75.4, 78958237, 'Germany', 1990],
                      [28666, 78.1, 254830, 'Iceland', 1990],
                      [1777, 57.7, 870601776, 'India', 1990],
                      [29550, 79.1, 122249285, 'Japan', 1990],
                      [2076, 67.9, 20194354, 'North Korea', 1990],
                      [12087, 72, 42972254, 'South Korea', 1990],
                      [24021, 75.4, 3397534, 'New Zealand', 1990],
                      [43296, 76.8, 4240375, 'Norway', 1990],
                      [10088, 70.8, 38195258, 'Poland', 1990],
                      [19349, 69.6, 147568552, 'Russia', 1990],
                      [10670, 67.3, 53994605, 'Turkey', 1990],
                      [26424, 75.7, 57110117, 'United Kingdom', 1990],
                      [37062, 75.4, 252847810, 'United States', 1990]
                    ],
                    [
                      [44056, 81.8, 23968973, 'Australia', 2015],
                      [43294, 81.7, 35939927, 'Canada', 2015],
                      [13334, 76.9, 1376048943, 'China', 2015],
                      [21291, 78.5, 11389562, 'Cuba', 2015],
                      [38923, 80.8, 5503457, 'Finland', 2015],
                      [37599, 81.9, 64395345, 'France', 2015],
                      [44053, 81.1, 80688545, 'Germany', 2015],
                      [42182, 82.8, 329425, 'Iceland', 2015],
                      [5903, 66.8, 1311050527, 'India', 2015],
                      [36162, 83.5, 126573481, 'Japan', 2015],
                      [1390, 71.4, 25155317, 'North Korea', 2015],
                      [34644, 80.7, 50293439, 'South Korea', 2015],
                      [34186, 80.6, 4528526, 'New Zealand', 2015],
                      [64304, 81.6, 5210967, 'Norway', 2015],
                      [24787, 77.3, 38611794, 'Poland', 2015],
                      [23038, 73.13, 143456918, 'Russia', 2015],
                      [19360, 76.5, 78665830, 'Turkey', 2015],
                      [38225, 81.4, 64715810, 'United Kingdom', 2015],
                      [53354, 79.1, 321773631, 'United States', 2015]
                    ]
                  ];
                    echarts.init(document.querySelector("#bubbleChart_ECharts")).setOption({
                    legend: {
                      right: '10%',
                      top: '3%',
                      data: ['1990', '2015']
                    },
                    grid: {
                      left: '8%',
                      top: '10%'
                    },
                    xAxis: {
                      splitLine: {
                        lineStyle: {
                          type: 'dashed'
                        }
                      }
                    },
                    yAxis: {
                      splitLine: {
                        lineStyle: {
                          type: 'dashed'
                        }
                      },
                      scale: true
                    },
                    series: [{
                        name: '1990',
                        data: data[0],
                        type: 'scatter',
                        symbolSize: function(data) {
                          return Math.sqrt(data[2]) / 5e2;
                        },
                        emphasis: {
                          focus: 'series',
                          label: {
                            show: true,
                            formatter: function(param) {
                              return param.data[3];
                            },
                            position: 'top'
                          }
                        },
                        itemStyle: {
                          color: 'rgb(251, 118, 123)'
                        }
                      },
                      {
                        name: '2015',
                        data: data[1],
                        type: 'scatter',
                        symbolSize: function(data) {
                          return Math.sqrt(data[2]) / 5e2;
                        },
                        emphasis: {
                          focus: 'series',
                          label: {
                            show: true,
                            formatter: function(param) {
                              return param.data[3];
                            },
                            position: 'top'
                          }
                        },
                        itemStyle: {
                          color: 'rgb(129, 227, 238)'
                        }
                      }
                    ]
                  });
                });
              {/*</script>*/}
              {/*<!--End Bubble Chart-- >*/}























































































































































































































