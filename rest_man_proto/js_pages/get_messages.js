var user_array;
var length;
var i;


function create_message_rows(){
    var users = document.getElementById("message_list");
    for(i = 0; i < length; i++){
        var row = users.insertRow(-1);

        var name = row.insertCell(-1);
        var email = row.insertCell(-1);
        var sub = row.insertCell(-1);
        var time = row.insertCell(-1);
        var message = row.insertCell(-1);

        var element = document.createElement("button");

        element.type = "button";
        element.innerHTML = '<i class="fas fa-envelope-open-text"></i>';
        element.className ="viewMsg"
        
        element.onclick = function() {
            view_message(user_array[this.parentNode.parentNode.rowIndex-1]);
        }


        name.innerHTML = user_array[i]['name'];
        email.innerHTML = user_array[i]['email'];
        sub.innerHTML = user_array[i]['subject'];
        time.innerHTML = user_array[i]['time'];
        message.appendChild(element);

    }
    $("table tr").hide();
    $("table tr").each(function(index){
        $(this).delay(index*20).show(0);
    });
}

function view_message(index) {

    var test = index;
    console.log(test);
    document.getElementById('add_modal').style.visibility="visible";
    document.getElementById('current_message').innerText = test.mes;
}

function hide_modal(){
    get_messages();
    document.getElementById('add_modal').style.visibility="hidden";
  
  }

function get_messages(){
    document.getElementById("message_list").innerHTML = "";
    var j = new XMLHttpRequest();
        j.onreadystatechange = function () {
            if (j.readyState == 4 && j.status == 200) {
                user_array = JSON.parse(j.responseText);
                length = user_array.length;
                create_message_rows();
            }
    };
    j.open('POST', '../php_pages/getmessages.php');
    j.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    j.send();

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