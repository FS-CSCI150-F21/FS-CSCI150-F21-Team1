var user_array;
var length;
var i;


function create_user_rows(){
    var users = document.getElementById("employee_list");
    for(i = 0; i < length; i++){
        var row = users.insertRow(-1);
        var f_name = row.insertCell(-1);
        var l_name = row.insertCell(-1);
        var phone = row.insertCell(-1);
        var position = row.insertCell(-1);

        var edit = row.insertCell(-1);
        //Delete button
        var element = document.createElement("button");
        element.type = "button";
        element.innerHTML = '<i class="fas fa-trash"></i>';
        element.className ="deleteBtn"
        element.onclick = function() {
            delete_user(user_array[this.parentNode.parentNode.rowIndex-1]);
        }

        //Edit button
        var editBtn = document.createElement("button");
        editBtn.type = "button";
        editBtn.innerText = "Edit"
        editBtn.onclick = function() {
            window.location="./employeeInfo.html#"+user_array[this.parentNode.parentNode.rowIndex-1]['username'];
        }

        f_name.innerHTML = user_array[i]['first_name'];
        l_name.innerHTML = user_array[i]['last_name'];
        phone.innerHTML = user_array[i]['phone'];
        position.innerHTML = user_array[i]['position'];

        edit.appendChild(element);
        edit.appendChild(editBtn);

    }
    $("table tr").hide();
    $("table tr").each(function(index){
        $(this).delay(index*20).show(0);
    });
}

function update(){
    console.log("hi");
}
function get_employees(){
    document.getElementById("employee_list").innerHTML = "";
    var j = new XMLHttpRequest();
        j.onreadystatechange = function () {
            if (j.readyState == 4 && j.status == 200) {
                user_array = JSON.parse(j.responseText);
                length = user_array.length;
                create_user_rows();
            }
    };
    j.open('POST', '../php_pages/getemployees.php');
    j.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    j.send();

}

function delete_user(data){
    user = data['username'];
    var j = new XMLHttpRequest();
        j.onreadystatechange = function () {
            if (j.readyState == 4 && j.status == 200) {
                console.log(j.responseText);
                get_employees();
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