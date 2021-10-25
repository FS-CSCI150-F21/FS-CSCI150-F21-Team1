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

function get_level() {
  var ele = document.getElementsByName('level');
  for(i = 0; i < ele.length; i++) {
      if(ele[i].checked){
        return ele[i].value;
      }
  }
}