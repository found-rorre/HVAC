// Set new default font family and font color to mimic Bootstrap's default styling
Chart.defaults.global.defaultFontFamily = 'Nunito', '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
Chart.defaults.global.defaultFontColor = '#858796';




fetch("/test/car/statusCount", {
	method: "POST",
})
.then(response => {
	return response.json();
})
.then(json => {
	if(json.result == "success") {
		const statusList = JSON.parse(json.statusList);
		
		
		var status = [];
		$.each(statusList, function (index, list) {
			status.push(list.status);
		})
		var count = [];
		$.each(statusList, function (index, list) {
			count.push(list.count);
		})
		
		
		
		var ctx = document.getElementById("chart_car");
		var myChart = new Chart(ctx, {
		  type: 'doughnut',
		  data: {
		    labels: [...status],
		    datasets: [{
		      data: [...count],
		      backgroundColor: ['#4e73df', '#FFB266', '#1cc88a'],
		      hoverBackgroundColor: ['#2e59d9', '#FF8000', '#17a673'],
		      hoverBorderColor: "rgba(234, 236, 244, 1)",
		    }],
		  },
		  options: {
		    maintainAspectRatio: false,
		    tooltips: {
		      backgroundColor: "rgb(255,255,255)",
		      bodyFontColor: "#858796",
		      borderColor: '#dddfeb',
		      borderWidth: 1,
		      xPadding: 15,
		      yPadding: 15,
		      displayColors: false,
		      caretPadding: 10,
		    },
		    legend: {
		      display: false
		    },
		    cutoutPercentage: 80,
		  },
		});
		

		
		
		
	}
})




// Pie Chart Example


