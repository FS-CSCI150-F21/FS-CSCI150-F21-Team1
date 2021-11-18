window.onload = function () {
  get_timesheet();
}

function CheckIn() {
    var j = new XMLHttpRequest();
    j.onreadystatechange = function () {
    if (j.readyState == 4 && j.status == 200) {
      console.log(j.responseText);
      alert("Checked In");
      document.getElementById("CheckIn").hidden=true;
      document.getElementById("CheckOut").hidden=false;
    }
  };
  j.open('POST', '../php_pages/checkIn.php');
  j.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
  j.send("s=in");

}

function CheckOut() {
    var j = new XMLHttpRequest();
    j.onreadystatechange = function () {
    if (j.readyState == 4 && j.status == 200) {
      console.log(j.responseText);
      alert("Checked Out");
  document.getElementById("CheckIn").hidden=false;
  document.getElementById("CheckOut").hidden=true;
    }
  };
  j.open('POST', '../php_pages/checkIn.php');
  j.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
  j.send("s=out");
}

function create_timesheet_rows(){
  var users = document.getElementById("timesheet");
  for(i = 0; i < length; i++){
      var status = users.insertRow(-1);
      var login = row.insertCell(-1);
      var logout = row.insertCell(-1);
      var totaltime = row.insertCell(-1);
      var edit = row.insertCell(-1);
      var element = document.createElement("button");
      element.type = "button";
      element.innerText = "Delete"
      element.onclick = function() {
          delete_user(user_array[this.parentNode.parentNode.rowIndex-1]);
      }
      status.innerHTML = timesheet_array[i]['status'];
      login.innerHTML = timesheet_array[i]['time_loggedIn'];
      logout.innerHTML = timesheet_array[i]['time_loggedOut'];
      totaltime.innerHTML = timesheet_array[i]['total_hours_worked'];
      edit.appendChild(element);
  }
}

function get_timesheet() {
  document.getElementById("timesheet").innerHTML = "";
  console.log("hi");
  var j = new XMLHttpRequest();
      j.onreadystatechange = function () {
        console.log(j.responseText);
          if (j.readyState == 4 && j.status == 200) {
              timesheet_array = JSON.parse(j.responseText);
              // length = timesheet_array.length;
              // create_timesheet_rows();
          }
  };
  j.open('POST', '../php_pages/getusertimesheet.php');
  j.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
  j.send();
}