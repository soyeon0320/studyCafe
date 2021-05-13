/**
 *  가맹점 차트
 */




var MONTHS = ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"];
var config1 = {
	type: 'line',
	data: {
		labels: ["2020년 4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월", "2021년 1월", "2월", "3월"],
		datasets: [{
			label: "2020-2021년 매출통계",
			backgroundColor: window.chartColors.red,
			borderColor: window.chartColors.red,
			data: [
				325000
				,434000
				,234000
				,634000
				,354000
				,345000
				,673000
				,125000
				,512000
				,409000
				,495000
				,873000
			],
			fill: false,
		}]
	},
	options: {
		responsive: true,
		tooltips: {
			mode: 'index',
			intersect: false,
		},
		hover: {
			mode: 'nearest',
			intersect: true
		},
		scales: {
			xAxes: [{
				display: true
			}],
			yAxes: [{
				display: true,
				scaleLabel: {
					display: true,
					labelString: '단위(원)'
				}
			}]
		}
	}
};

var config2 = {
	type: 'line',
	data: {
		labels: ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12","13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24","25", "26", "27", "28", "29", "30"],
		datasets: [{
			label: "4월 매출통계",
			backgroundColor: window.chartColors.blue,
			borderColor: window.chartColors.blue,
			data: [
				325000
				,434000
				,234000
				,634000
				,354000 
				
				,345000
				,673000
				,125000
				,512000
				,409000
				
				,495000
				,873000
				,434000
				,234000
				,634000
				
				,354000 
				,345000
				,673000
				,125000
				,512000
				
				,354000 
				,345000
				,673000
				,125000
				,512000
				
				,409000
				,495000
				,873000
				,873000
				,873000
			],
			fill: false,
		}]
	},
	options: {
		responsive: true,
		tooltips: {
			mode: 'index',
			intersect: false,
		},
		hover: {
			mode: 'nearest',
			intersect: true
		},
		scales: {
			xAxes: [{
				display: true,
				ticks: {
					callback: function(dataLabel, index) {
						// Hide the label of every 2nd dataset. return null to hide the grid line too
						return index % 2 === 0 ? dataLabel : '';
					}
				}
				
			}],
			yAxes: [{
				display: true,
				scaleLabel: {
					display: true,
					labelString: '단위(원)'
				}
			}]
		}
	}
};

var randomScalingFactor = function() {
	return Math.round(Math.random() * 100);
};

var config3 = {
	type: 'pie',
	data: {
		datasets: [{
			data: [
				randomScalingFactor(),
				randomScalingFactor(),
				randomScalingFactor(),
			],
			backgroundColor: [
				window.chartColors.red,
				window.chartColors.orange,
				window.chartColors.yellow,
			]
		}],
		labels: [
			"좌석",
			"스터디룸",
			"교육기기",
		]
	},
	options: {
		responsive: true
	}
};


function newDate(days) {
	return moment().add(days, 'd').toDate();
}

function newDateString(days) {
	return moment().add(days, 'd').format();
}

var color = Chart.helpers.color;
var config4 = {
	type: 'line',
	data: {
		datasets: [{
			label: "시간대별 이용현황",
			backgroundColor: color(window.chartColors.green).alpha(0.5).rgbString(),
			borderColor: window.chartColors.green,
			fill: false,
			data: [{
				x: newDateString(0),
				y: randomScalingFactor()
			}, {
				x: newDateString(0.2),
				y: randomScalingFactor()
			}, {
				x: newDateString(0.4),
				y: randomScalingFactor()
			}, {
				x: newDateString(0.6),
				y: randomScalingFactor()
			}, {
				x: newDateString(0.8),
				y: randomScalingFactor()
			}, {
				x: newDateString(1),
				y: randomScalingFactor()
			}],
		}]
	},
	options: {
		responsive: true,
		scales: {
			xAxes: [{
				type: "time",
				display: true,
// 				ticks: {
// 					callback: function(dataLabel, index) {
// 						// Hide the label of every 2nd dataset. return null to hide the grid line too
// 						return index % 3 === 0 ? dataLabel : '';
// 					}
// 				}
			}],
			yAxes: [{
				display: true,
				scaleLabel: {
					display: true,
					labelString: '이용자수'
				}
			}]
		}
	}
};



window.onload = function() {
	var ctx1 = document.getElementById("chart-1").getContext("2d");
	window.myLine = new Chart(ctx1, config1);
	var ctx2 = document.getElementById("chart-2").getContext("2d");
	window.myLine = new Chart(ctx2, config2);
	var ctx3 = document.getElementById("chart-3").getContext("2d");
	window.myLine = new Chart(ctx3, config3);
	var ctx4 = document.getElementById("chart-4").getContext("2d");
	window.myLine = new Chart(ctx4, config4);
};