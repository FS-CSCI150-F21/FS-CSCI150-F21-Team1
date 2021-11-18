function add_user() {
    var user_info = [];
    var f_name = document.getElementById("modal_fname").value;
    var l_name = document.getElementById("modal_lname").value;
    var user = document.getElementById("modal_username").value;
    var pass = document.getElementById("modal_password").value;
    var level = document.getElementById("modal_level").value;
    var phone = document.getElementById("modal_phone").value;
    var email = document.getElementById("modal_email").value;
    var wage = document.getElementById("modal_wage").value;
    var position = document.getElementById("modal_position").value; 

    const current_user = {
      f_name: f_name, 
      l_name: l_name,
      username: user,
      password: pass,
      level: level,
      phone: phone,
      email: email,
      position: position,
      wage: wage
    };

    var j_userinfo = JSON.stringify(current_user);
    //if (user != "" && pass != "" && f_name != "" && l_name != "" && phone != "" && email != "")
    if (user) {
      var j = new XMLHttpRequest();
      j.onreadystatechange = function () {
        if (j.readyState == 4 && j.status == 200) {
          if(j.responseText == 1){
            document.getElementById("test").innerHTML = "Successfully Added";
          }
          else {
            document.getElementById("test").innerHTML = "Username already exists";
          }
        }
      };
      j.open('POST', '../php_pages/add_user.php');
      j.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
      j.send("userinfo=" + j_userinfo);
    }
    else {
      document.getElementById("test").innerHTML = "ERROR: EMPTY FIELDS";
    }
}


var modal = document.getElementById('add_modal');
window.onclick = function(event) {
    if (event.target == modal) {
        modal.style.visibility = "hidden";
    }
}

function customer_input(data){
  if(data == 2){
    document.getElementById("employeeOnly").style.display = "none";
  }
  else{
    document.getElementById("employeeOnly").style.display = "block";
  }
}


// function hide_modal(){
//   get_users();
//   document.getElementById("test").innerHTML = "";
//   document.getElementById('add_modal').style.display='none';
// }

function hide_modal(){
  get_users();
  document.getElementById("test").innerHTML = "";
  document.getElementById('add_modal').style.visibility="hidden";
}

// function hide_edit(){
//     get_users();
//     document.getElementById("test").innerHTML = "";
//     document.getElementById('edit_modal').style.display='none';
// }