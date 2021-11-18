
var isLoggedIn = false;
function check() {
var j = new XMLHttpRequest();
j.onreadystatechange = function () {
    if (j.readyState == 4 && j.status == 200) {
        var check = j.responseText;
        if (check == 0) {
          isLoggedIn = false;
          document.getElementById("login_form").style.display = "block";
          document.getElementById("btn_logout").style.display = "none";
        }
        else{
          isLoggedIn = true;
          document.getElementById("login_form").style.display = "none";
          document.getElementById("btn_logout").style.display = "block";
        }
    }
};
j.open('POST', '../php_pages/check.php', true);
j.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
j.send();
}

function signup() {
  var good;
  var user = document.getElementById("username").value;
  var pass = document.getElementById("password").value;

  if (user != "" && pass != "") {
    var j = new XMLHttpRequest();
    j.onreadystatechange = function () {
      if (j.readyState == 4 && j.status == 200) {
        good = j.responseText;
        document.getElementById("response").innerHTML = j.responseText;
        if (good == "1") {
        }
      }
    };
    j.open('POST', '../php_pages/signup.php');
    j.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    j.send("u=" + user + "&" + "p=" + pass);
  }
  else {
    document.getElementById("response").innerHTML = "ERROR: EMPTY FIELDS";
  }
}

function login() {
  var good;
  var user = document.getElementById("username").value;
  var pass = document.getElementById("password").value;
  var level = get_level();
  var j = new XMLHttpRequest();
  if (user != "" && pass != "" && level != "") {
    var j = new XMLHttpRequest();
    j.onreadystatechange = function () {
      if (j.readyState == 4 && j.status == 200) {
        good = j.responseText;
        document.getElementById("response").innerHTML = j.responseText;
        alert(j.responseText);
        if (good == "Logged in.") {
          switch(level){
            case '0':
              location.replace("../html_pages/m_dash.html");
              break;
            case '1':
              location.replace("../html_pages/e_dash.html");
              break;
            case '2':
              location.replace("../html_pages/c_dash.html");
              break;
          }
        }
      }
    };
    j.open('POST', '../php_pages/login.php');
    j.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    j.send("u=" + user + "&" + "p=" + pass + "&" + "l=" + level);
  }
  else {
    document.getElementById("response").innerHTML = "ERROR: EMPTY FIELDS";
    alert(j.responseText);
  }
}



function to_dashboard(){
  var j = new XMLHttpRequest();
  j.onreadystatechange = function () {
    if (j.readyState == 4 && j.status == 200) {
      var value = j.responseText;
      switch(value) {
        case '0':
          location.replace("../html_pages/m_dash.html");
          break;
        case '1':
          location.replace("../html_pages/e_dash.html");
          break;
        case '2':
          location.replace("../html_pages/c_dash.html");
          break;
      }
    }
  };
  j.open('GET', '../php_pages/get_level.php');
  j.send();

}


function add_customer() {

  var f_name = document.getElementById("c_fname").value;
  var l_name = document.getElementById("c_lname").value;
  var user = document.getElementById("c_username").value;
  var pass = document.getElementById("c_password").value;
  
  if (user != "" && pass != "" && f_name != "" && l_name != "") {
    var j = new XMLHttpRequest();
    j.onreadystatechange = function () {
      if (j.readyState == 4 && j.status == 200) {
        console.log(j.responseText)  
        if(j.responseText == 1){
          document.getElementById("test").innerHTML = "Successfully Added";
        }
        else {
          document.getElementById("test").innerHTML = "Username already exists";
          alert("Username already exists");
        }
      }
    };
    j.open('POST', '../php_pages/add_customer.php');
    j.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    j.send("fn=" + f_name + "&" + "ln=" + l_name + "&" + "u=" + user + "&" + "p=" + pass + "&");
  }
  else {
    document.getElementById("test").innerHTML = "ERROR: EMPTY FIELDS";
  }
}

function logout() {
  var j = new XMLHttpRequest();
  j.onreadystatechange = function () {
    if (j.readyState == 4 && j.status == 200) {
      location.replace("../html_pages/index.html");
    }
  };
  j.open('GET', '../php_pages/logout.php');
  j.send();
}

function hide(){
  document.getElementById('customer_modal').style.display='none';
}

function get_level() {
  var ele = document.getElementById('user_level');
  
  return ele.value;
}

var wait_time_array;
function get_WaitTime(){
  var j = new XMLHttpRequest();
  j.onreadystatechange = function () {
    if (j.readyState == 4 && j.status == 200) {
      wait_time_array=JSON.parse(j.responseText);
      length=wait_time_array.length;
      console.log(j.responseText);
      document.getElementById("numInside").innerHTML=wait_time_array['num_people_inside'];
      document.getElementById("numInLine").innerHTML=wait_time_array['num_people_in_line'];
      document.getElementById("waittime").innerHTML=wait_time_array['wait_time'];
      document.getElementById("updatedtime").innerHTML=wait_time_array['date_time'];

    }
  };
  j.open('GET', '../php_pages/getwaittime.php');
  j.send();
}
