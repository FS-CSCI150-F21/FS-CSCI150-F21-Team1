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

  if (user != "" && pass != "" && level != "") {
    var j = new XMLHttpRequest();
    j.onreadystatechange = function () {
      if (j.readyState == 4 && j.status == 200) {
        good = j.responseText;
        document.getElementById("response").innerHTML = j.responseText;
        if (good == "1") {
          document.getElementById("response").innerHTML = "Logging In";
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
  }
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
  var ele = document.getElementsByName('level');
  for(i = 0; i < ele.length; i++) {
      if(ele[i].checked){
        return ele[i].value;
      }
  }
}