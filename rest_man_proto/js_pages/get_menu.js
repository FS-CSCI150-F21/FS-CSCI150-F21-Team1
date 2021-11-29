var user_array;
var length;
var i;

window.onload = function () {
    get_employees();
}

function create_user_rows(){
    var users = document.getElementById("employee_list");
    for(i = 0; i < length; i++){
        var row = users.insertRow(-1);
        var f_name = row.insertCell(-1);
        var l_name = row.insertCell(-1);
        var email = row.insertCell(-1);
        var phone = row.insertCell(-1);
        var position = row.insertCell(-1);
        var wage = row.insertCell(-1);

        var edit = row.insertCell(-1);
        var element = document.createElement("button");
        element.type = "button";
        element.innerText = "Delete"
        element.onclick = function() {
            delete_user(user_array[this.parentNode.parentNode.rowIndex-1]);
        }
        f_name.innerHTML = user_array[i]['first_name'];
        l_name.innerHTML = user_array[i]['last_name'];
        email.innerHTML = user_array[i]['email'];
        phone.innerHTML = user_array[i]['phone'];
        position.innerHTML = user_array[i]['position'];
        wage.innerHTML = user_array[i]['wage'];

        edit.appendChild(element);
    }
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