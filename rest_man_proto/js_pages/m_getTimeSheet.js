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

      var editBtn = document.createElement("button");
      editBtn.type = "button";
      editBtn.innerText = "Edit";
      editBtn.innerHTML = '<i class="fas fa-edit"></i>';
      editBtn.className ="editBtn";

      editBtn.onclick = function() {
      console.log(timesheet.rows[this.parentNode.parentNode.rowIndex-1].innerHTML);

        if(timesheet_array[this.parentNode.parentNode.rowIndex-1]['status']=='in')
        {
          timesheet.rows[this.parentNode.parentNode.rowIndex-1].innerHTML += "<td><input type=\"text\" id=\"newIn\" placeholder=\"Log In\" required></td><td><button onclick=\"update_time_in(timesheet_array[this.parentNode.parentNode.rowIndex-1])\">Change</button><button onclick=\"close_edit_in(this.parentNode.parentNode.rowIndex-1)\">< Back</button></td></tr>";
        }
        else
        {
          timesheet.rows[this.parentNode.parentNode.rowIndex-1].innerHTML += "<td><input type=\"text\" id=\"newOut\" placeholder=\"Log Out\" required></td><td><button onclick=\"update_time_out(timesheet_array[this.parentNode.parentNode.rowIndex-1])\">Change</button><button onclick=\"close_edit_out(this.parentNode.parentNode.rowIndex-1)\">< Back</button></td></tr>";
        }
    }

      var element = document.createElement("button");
      element.type = "button";
      element.innerText = "Delete";
      element.innerHTML = '<i class="fas fa-trash"></i>';
      element.className ="deleteBtn";
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
      edit.appendChild(editBtn);
  }
}

function close_edit_in(data){
  console.log(timesheet.rows[data].innerHTML);
  var newRow = timesheet.rows[data].innerHTML.replace("<td><input type=\"text\" id=\"newIn\" placeholder=\"Log In\" required=\"\"></td><td><button onclick=\"update_time_in(timesheet_array[this.parentNode.parentNode.rowIndex-1])\">Change</button><button onclick=\"close_edit_in(this.parentNode.parentNode.rowIndex-1)\">&lt; Back</button></td>","");
  timesheet.rows[data].innerHTML=newRow;
  console.log(timesheet.rows[data].innerHTML);

}
function close_edit_out(data){
  var newRow = timesheet.rows[data].innerHTML.replace("<td><input type=\"text\" id=\"newOut\" placeholder=\"Log Out\" required=\"\"></td><td><button onclick=\"update_time_out(timesheet_array[this.parentNode.parentNode.rowIndex-1])\">Change</button><button onclick=\"close_edit_out(this.parentNode.parentNode.rowIndex-1)\">&lt; Back</button></td>","");
  timesheet.rows[data].innerHTML=newRow;
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
  j.open('GET', '../php_pages/m_getAllUserName.php');
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
    j.open('GET', '../php_pages/m_getALLtimesheet.php');
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
function update_time_in(data) {
  var name= data['name'];
  var date= data['date'];
  var status= data['status'];
  var newTime = document.getElementById("newIn").value;
  var j = new XMLHttpRequest();
      j.onreadystatechange = function () {
          if (j.readyState == 4 && j.status == 200) {
              alert("Updated");
              get_timesheet();
          }
  };
  j.open('POST', '../php_pages/m_updateTimesheet.php');
  j.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
  j.send("name=" + name + "&date=" + date + "&status=" + status + "&newTime=" + newTime);
}
function update_time_out(data) {
  var name= data['name'];
  var date= data['date'];
  var status= data['status'];
  var newTime = document.getElementById("newOut").value;
  var j = new XMLHttpRequest();
      j.onreadystatechange = function () {
          if (j.readyState == 4 && j.status == 200) {
              alert("Updated");
              get_timesheet();
          }
  };
  j.open('POST', '../php_pages/m_updateTimesheet.php');
  j.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
  j.send("name=" + name + "&date=" + date + "&status=" + status + "&newTime=" + newTime);
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