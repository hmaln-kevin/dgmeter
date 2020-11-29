var date = new Date();
var d = date.getDate();
var m = date.getUTCMonth();
var months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"];
var month = months[date.getUTCMonth()];
var year = date.getUTCFullYear();


function by_year(device){
    Chartkick.charts["chart-energy"].updateData(`/energy_charts/by_year?device=${device}`);
    Chartkick.charts["chart-power"].updateData(`/power_charts/by_year?device=${device}`);
    document.getElementById('title_energy').innerText = `Energy Consumption in ${year}`
    document.getElementById('title_power').innerText = `Measured Demand in ${year}`
}
function by_day(device){
    Chartkick.charts["chart-energy"].updateData(`/energy_charts/by_day?device=${device}`);
    Chartkick.charts["chart-power"].updateData(`/power_charts/by_day?device=${device}`);
    document.getElementById('title_energy').innerText = `Energy Consumption in ${d}/${m}/${year}`
    document.getElementById('title_power').innerText = `Measured Demand in ${d}/${m}/${year}`
}
function by_week(device){
    Chartkick.charts["chart-energy"].updateData(`/energy_charts/by_week?device=${device}`);
    Chartkick.charts["chart-power"].updateData(`/power_charts/by_week?device=${device}`);
    document.getElementById('title_energy').innerText = `Energy Consumption in this week`
    document.getElementById('title_power').innerText = `Measured Demand in this week`
}
function by_month(device){
    Chartkick.charts["chart-energy"].updateData(`/energy_charts/by_month?device=${device}`);
    Chartkick.charts["chart-power"].updateData(`/power_charts/by_month?device=${device}`);
    document.getElementById('title_energy').innerText = `Energy Consumption in ${month}`
    document.getElementById('title_power').innerText = `Measured Demand in ${month}`
}
function by_user(device){
    var startDate = $("#start_date").datepicker( "getDate" );
    var endDate = $("#end_date").datepicker( "getDate" );
    Chartkick.charts["chart-energy"].updateData(`/energy_charts/by_user?start_day=${startDate}&end_day=${endDate}&device=${device}`);
    Chartkick.charts["chart-power"].updateData(`/power_charts/by_user?start_day=${startDate}&end_day=${endDate}&device=${device}`);
    document.getElementById('title_energy').innerText = `Energy Consumption in searched period`;
    document.getElementById('title_power').innerText = `Measured Demand in searched period`;
  }
$(function() {
    $( "#start_date" ).datepicker({
        dateFormat: 'dd-mm-yy',
        changeMonth: true,
        changeYear: true,
        onClose: function( selectedDate ) {
        $( "#end_date" ).datepicker( "option", "minDate", selectedDate );
        }
    });
    $( "#end_date" ).datepicker({
        dateFormat: 'dd-mm-yy',
        changeMonth: true,
        changeYear: true,
        onClose: function( selectedDate ) {
        $( "#start_date" ).datepicker( "option", "maxDate", selectedDate );
        }
    });
});


