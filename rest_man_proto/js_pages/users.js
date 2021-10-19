var user_array;
var length;

window.onload = function () {
    get_users();
    setInterval(update_table,2000)
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

function update_table(){
    var is_equal = false;

    var j = new XMLHttpRequest();
    j.onreadystatechange = function () {
        if (j.readyState == 4 && j.status == 200) {
            new_array = JSON.parse(j.responseText);

            if(!(new_array.length===user_array.length)){
                console.log("UPDATING TABLE")
                get_users();
            }
            else
            {
               console.log("CHECKING FOR UPDATE") 
            }
        }
    };
    j.open('POST', '../php_pages/getusers.php');
    j.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    j.send();
}