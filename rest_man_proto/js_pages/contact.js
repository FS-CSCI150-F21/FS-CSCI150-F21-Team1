var user_name;

function add_message() {
    var user_info = [];

    var name = document.getElementById("name").value;
    var email = document.getElementById("email").value;
    var subject = document.getElementById("subject").value;
    var msg = document.getElementById("message").value;

  console.log(user_name);
    const current_message = {
      name: name, 
      email: email,
      subject: subject,
      msg: msg,
      user: user_name
    };

    var user_msg = JSON.stringify(current_message);
    //if (user != "" && pass != "" && f_name != "" && l_name != "" && phone != "" && email != "")
    if (name && email && subject && msg) {
      var j = new XMLHttpRequest();
      j.onreadystatechange = function () {
        if (j.readyState == 4 && j.status == 200) {
          //console.log(j.responseText);
          if(j.responseText == 1){
            alert("Successfully Sent");
          }
        }
      };
      j.open('POST', '../php_pages/contact.php');
      j.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
      j.send("msg_obj=" + user_msg);
    }
    else{
      alert("Missing Field!");
    }
}

function get_user_info() {
  var j = new XMLHttpRequest();
      j.onreadystatechange = function () {
        if (j.readyState == 4 && j.status == 200) {
          var user_obj = JSON.parse(j.responseText);
          console.log(user_obj);
          document.getElementById("name").value = user_obj.name;
          document.getElementById("email").value = user_obj.email;
          user_name = user_obj.username;
          
        }
      };
      j.open('GET', '../php_pages/check.php');
      j.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
      j.send();
}





