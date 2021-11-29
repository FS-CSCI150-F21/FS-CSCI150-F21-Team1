function add_message() {
    var user_info = [];

    var name = document.getElementById("name").value;
    var email = document.getElementById("email").value;
    var subject = document.getElementById("subject").value;
    var msg = document.getElementById("message").value;


    const current_message = {
      name: name, 
      email: email,
      subject: subject,
      msg: msg,
    };

    var user_msg = JSON.stringify(current_message);
    //if (user != "" && pass != "" && f_name != "" && l_name != "" && phone != "" && email != "")
    if (name) {
      var j = new XMLHttpRequest();
      j.onreadystatechange = function () {
        if (j.readyState == 4 && j.status == 200) {
          if(j.responseText == 1){
            document.getElementById("test").innerHTML = "Successfully Sent";
          }
        }
      };
      j.open('POST', '../php_pages/contact.php');
      j.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
      j.send("msg_obj=" + user_msg);
    }
}






