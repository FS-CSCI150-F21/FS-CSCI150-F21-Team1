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

        var d = document.createElement("button");
        d.type = "button";
        d.innerHTML = '<i class="fas fa-trash"></i>';
        d.className ="deleteMsg"
        d.onclick = function() {
            delete_message(user_array[this.parentNode.parentNode.rowIndex-1]);
        }

        name.innerHTML = user_array[i]['name'];
        email.innerHTML = user_array[i]['email'];
        sub.innerHTML = user_array[i]['subject'];
        time.innerHTML = user_array[i]['time'];
        message.appendChild(element);
        message.appendChild(d);

    }
    $("table tr").hide();
    $("table tr").each(function(index){
        $(this).delay(index*20).show(0);
    });
}

function view_message(index) {

    var test = index;
    console.log(test);
    document.getElementById('add_modal').style.display="block";
    document.getElementById('current_message').innerText = test.mes;
    document.getElementById('message_title').innerText = test.subject;
}

function delete_message(index) {

  console.log();
  var j = new XMLHttpRequest();
      j.onreadystatechange = function () {
          if (j.readyState == 4 && j.status == 200) {
              console.log(j.responseText);
              create_message_rows();
          }
  };
  j.open('POST', '../php_pages/delete_message.php');
  j.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
  j.send("u=" + index.username);
}

function hide_modal(){
    get_messages();
    document.getElementById('add_modal').style.display="none";
  
  }

function get_messages(){
    document.getElementById("message_list").innerHTML = "";
    var j = new XMLHttpRequest();
        j.onreadystatechange = function () {
            if (j.readyState == 4 && j.status == 200) {

                user_array = JSON.parse(j.responseText);
                length = user_array.length;
                create_message_rows();
                console.log(user_array);
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