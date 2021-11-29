var timesheet_array;
var user_timesheet_array;
var username_array;

window.onload= function()
{
  get_timesheet();
}
function create_timesheet_rows(){
  var timesheet = document.getElementById("timesheet");
  for(i = 0; i < length; i++){
    var row = timesheet.insertRow(-1);
    var name = row.insertCell(-1);
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
      name.innerHTML = timesheet_array[i]['name'];
      status.innerHTML = timesheet_array[i]['status'];
      date.innerHTML = timesheet_array[i]['date'];
      login.innerHTML = timesheet_array[i]['time_loggedIn'];
      logout.innerHTML = timesheet_array[i]['time_loggedOut'];
      totaltime.innerHTML = timesheet_array[i]['total_hours_worked'];
      edit.appendChild(element);
  }
}

function get_name()
{
  var selection = document.getElementById("options");
  var j = new XMLHttpRequest();
  j.onreadystatechange = function () {
      if (j.readyState == 4 && j.status == 200) {
        username_array = JSON.parse(j.responseText);
        length2 = username_array.length;
        selection.innerHTML="<option value=\"0\">Select Employee Name</option>";
        for(j=0;j<length2;j++)
        {
          selection.innerHTML += "<option value="+username_array[j]['name']+">"+ username_array[j]['name']+" </option>"
        }
      }
    };
  j.open('POST', '../php_pages/m_getAllUserName.php');
  j.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
  j.send();
}

function get_timesheet() {
    document.getElementById("options").innerHTML = "";
    document.getElementById("timesheet").innerHTML = "";
    var j = new XMLHttpRequest();
        j.onreadystatechange = function () {
            if (j.readyState == 4 && j.status == 200) {
                timesheet_array = JSON.parse(j.responseText);
                length = timesheet_array.length;
                get_name();
                create_timesheet_rows();
            }
    };
    j.open('POST', '../php_pages/m_getALLtimesheet.php');
    j.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    j.send();
}
function get_user_timesheet() {
  var selected =document.getElementById("options").value;
  if(selected==0)
  {
    get_timesheet();
    return;
  }
  document.getElementById("timesheet").innerHTML = "";
  var j = new XMLHttpRequest();
      j.onreadystatechange = function () {
          if (j.readyState == 4 && j.status == 200) {
            user_timesheet_array = JSON.parse(j.responseText);
            length1 = user_timesheet_array.length;
            create_user_timesheet_rows();
          }
  };
  j.open('POST', '../php_pages/m_getUSERtimesheet.php');
  j.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
  j.send('n='+selected);
}
function create_user_timesheet_rows(){
  var timesheet = document.getElementById("timesheet");
  for(i = 0; i < length1; i++){
    var row = timesheet.insertRow(-1);
    var name = row.insertCell(-1);
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
      name.innerHTML = user_timesheet_array[i]['name'];
      status.innerHTML = user_timesheet_array[i]['status'];
      date.innerHTML = user_timesheet_array[i]['date'];
      login.innerHTML = user_timesheet_array[i]['time_loggedIn'];
      logout.innerHTML = user_timesheet_array[i]['time_loggedOut'];
      totaltime.innerHTML = user_timesheet_array[i]['total_hours_worked'];
      edit.appendChild(element);
  }
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