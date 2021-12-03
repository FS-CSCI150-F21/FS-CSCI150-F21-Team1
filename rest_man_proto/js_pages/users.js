var user_array;
var length;
var i;

window.onload = function () {
    
}

function create_user_rows(){
    var users = document.getElementById("user_list");
    for(i = 0; i < length; i++){
        var row = users.insertRow(-1);
        var f_name = row.insertCell(-1);
        var l_name = row.insertCell(-1);
        var username = row.insertCell(-1);
        // var password = row.insertCell(-1);
        var level = row.insertCell(-1);
        var edit = row.insertCell(-1);
        var element = document.createElement("button");
        element.type = "button";
        element.innerHTML = '<i class="fas fa-trash"></i>';
        element.className ="deleteBtn"

        element.onclick = function() {
            delete_user(user_array[this.parentNode.parentNode.rowIndex-1]);
        }
        
        f_name.innerHTML = user_array[i]['first_name'];
        l_name.innerHTML = user_array[i]['last_name'];
        username.innerHTML = user_array[i]['username'];
        // password.innerHTML = user_array[i]['password'];
        level.innerHTML = level_to_name(user_array[i]['level']);
        edit.appendChild(element);
    }
    $("table tr").hide();
    $("table tr").each(function(index){
        $(this).delay(index*20).show(0);
    });
}

function level_to_name(level){
    if(level == 0){
        return "Manager";
    }
    else if(level == 1){
        return "Employee";
    }
    else{
        return "Customer";
    }
}

function get_users(){
    document.getElementById("user_list").innerHTML = "";
    var j = new XMLHttpRequest();
        j.onreadystatechange = function () {
            if (j.readyState == 4 && j.status == 200) {
                user_array = JSON.parse(j.responseText);
                length = user_array.length;
                create_user_rows();
            }
    };
    j.open('POST', '../php_pages/getusers.php');
    j.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    j.send();

}

function delete_user(data){
    user = data['username'];
    var j = new XMLHttpRequest();
        j.onreadystatechange = function () {
            if (j.readyState == 4 && j.status == 200) {
                console.log(j.responseText);
                get_users();
            }
    };
    j.open('POST', '../php_pages/delete_user.php');
    j.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    j.send("u=" + user);
}

function to_dashboard() {
    var j = new XMLHttpRequest();
    j.onreadystatechange = function () {
      if (j.readyState == 4 && j.status == 200) {
        var value = j.responseText;
        switch (value) {
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


  function myFunction() {
    // Declare variables
    var input, filter, table, tr, td, i, txtValue;
    input = document.getElementById("myInput");
    filter = input.value.toUpperCase();
    table = document.getElementById("myTable");
    tr = table.getElementsByTagName("tr");
  
    // Loop through all table rows, and hide those who don't match the search query
    for (i = 0; i < tr.length; i++) {
      td = tr[i].getElementsByTagName("td")[0];
      if (td) {
        txtValue = td.textContent || td.innerText;
        if (txtValue.toUpperCase().indexOf(filter) > -1) {
          tr[i].style.display = "";
        } else {
          tr[i].style.display = "none";
        }
      }
    }
  }