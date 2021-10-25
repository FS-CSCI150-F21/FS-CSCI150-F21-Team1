function add_user() {

    var f_name = document.getElementById("modal_fname").value;
    var l_name = document.getElementById("modal_lname").value;
    var user = document.getElementById("modal_username").value;
    var pass = document.getElementById("modal_password").value;
    var level = document.getElementById("modal_level").value;
  
    
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
      j.open('POST', '../php_pages/add_user.php');
      j.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
      j.send("fn=" + f_name + "&" + "ln=" + l_name + "&" + "u=" + user + "&" + "p=" + pass + "&" + "l=" + level);
    }
    else {
      document.getElementById("test").innerHTML = "ERROR: EMPTY FIELDS";
    }
}

function hide(){
    get_users();
    document.getElementById("test").innerHTML = "";
    document.getElementById('add_modal').style.display='none';
}

var modal = document.getElementById('add_modal');
window.onclick = function(event) {
    if (event.target == modal) {
        modal.style.display = "none";
    }
}

// function hide_edit(){
//     get_users();
//     document.getElementById("test").innerHTML = "";
//     document.getElementById('edit_modal').style.display='none';
// }