var user_array;
var length;

window.onload = function () {
    get_users();
}
function create_user_rows(){
    var users = document.getElementById("user_list");
    for(var i = 0; i < length; i++){
        var row = users.insertRow(-1);
        var f_name = row.insertCell(-1);
        var l_name = row.insertCell(-1);
        f_name.innerHTML = user_array[i]['username'];
        l_name.innerHTML = user_array[i]['password'];
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