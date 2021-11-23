var timesheet_array;

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
  var timesheet = document.getElementById("timesheet");
  for(i = 0; i < length; i++){
    var row = timesheet.insertRow(-1);
      var status = row.insertCell(-1);
      var date = row.insertCell(-1);
      var login = row.insertCell(-1);
      var logout = row.insertCell(-1);
      var totaltime = row.insertCell(-1);
      var edit = row.insertCell(-1);
      var element = document.createElement("button");
      element.type = "button";
      element.innerText = "Delete"
      element.onclick = function() {
          delete_time(timesheet_array[this.parentNode.parentNode.rowIndex-1]);
      }
      status.innerHTML = timesheet_array[i]['status'];
      date.innerHTML = timesheet_array[i]['date'];
      login.innerHTML = timesheet_array[i]['time_loggedIn'];
      logout.innerHTML = timesheet_array[i]['time_loggedOut'];
      totaltime.innerHTML = timesheet_array[i]['total_hours_worked'];
      edit.appendChild(element);
  }
}

function get_timesheet() {
  document.getElementById("timesheet").innerHTML = "";
  var j = new XMLHttpRequest();
      j.onreadystatechange = function () {
          if (j.readyState == 4 && j.status == 200) {
            console.log(j.responseText);
              timesheet_array = JSON.parse(j.responseText);
              length = timesheet_array.length;
              create_timesheet_rows();
          }
  };
  j.open('POST', '../php_pages/e_getusertimesheet.php');
  j.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
  j.send();
}

function delete_time(data){
  item = data['name'];
  status = data['status'];
  logIn = data['time_loggedIn'];
  
  console.log(item);
  console.log(logIn);
  console.log(status);

  var j = new XMLHttpRequest();
      j.onreadystatechange = function () {
          console.log(j.responseText);
          if (j.readyState == 4 && j.status == 200) {
              alert(j.responseText);
              get_timesheet();
          }
  };
  j.open('POST', '../php_pages/delete_time.php');
  j.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
  j.send("i=" + item +"&s="+ status +"&lI="+logIn);
}

function delete_all_time(){
  var k = 0;
  console.log(timesheet_array.length);
  while(k<timesheet_array.length)
  {
          var j = new XMLHttpRequest();
      j.open('POST', '../php_pages/delete_time.php');
      j.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
      j.send("i=" + timesheet_array[k]['name']);
      k++;
      
  }
  get_timesheet();
  
}