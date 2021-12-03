function send_info() {
    var res_name = document.getElementById("rest_name").value;
    var open_time = document.getElementById("open_time").value;
    var close_time = document.getElementById("close_time").value;
    var res_location = document.getElementById("rest_location").value
    var days_element = document.getElementsByName("days");
    var days = []

    for(let i = 0; i < days_element.length; i++){
        if(days_element[i].checked){
            days.push(days_element[i].value)
        }
    }
    const settings = {
        name: res_name,
        location: res_location,
        otime: open_time,
        ctime: close_time,
        day: days,
    }

    var j_settings = JSON.stringify(settings);

    if (res_name && open_time && close_time && res_location && days) {
      var j = new XMLHttpRequest();
      j.onreadystatechange = function () {
        if (j.readyState == 4 && j.status == 200) {
            //console.log(j.responseText);
            get_info();
        }
      };
      j.open('POST', '../php_pages/settings.php');
      j.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
      j.send("settings=" + j_settings);
    }
    else
    {
        console.log("empty fields");
    }

}

function get_info() {
    var j = new XMLHttpRequest();
    j.onreadystatechange = function () {
    if (j.readyState == 4 && j.status == 200) {
        var settings = JSON.parse(j.responseText);
        console.log("here");
        //console.log(JSON.parse(j.responseText));
        document.getElementById("rest_name").innerText = settings.name;
        document.getElementById("open_time").innerText = settings.open_time;
        document.getElementById("close_time").innerText = settings.close_time;
        document.getElementById("rest_location").innerText = settings.location;
        
        var days_element = document.getElementsByName("days");

        for(let i = 0; i<7;i++){
            for(let j = 0; j<settings.days.length;j++){

                if(days_element[i].value == settings.days[j]){
                    days_element[i].checked = true;
                }
            }
        }
    }
    };
    j.open('POST', '../php_pages/settings.php');
    j.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    j.send();
}

function get_info_edit() {
  var j = new XMLHttpRequest();
  j.onreadystatechange = function () {
  if (j.readyState == 4 && j.status == 200) {
      var settings = JSON.parse(j.responseText);
      //console.log(JSON.parse(j.responseText));
      document.getElementById("rest_name").value = settings.name;
      document.getElementById("open_time").value = settings.open_time;
      document.getElementById("close_time").value = settings.close_time;
      document.getElementById("rest_location").value = settings.location;
      
      var days_element = document.getElementsByName("days");
      for(let i = 0; i<7;i++){
          for(let j = 0; j<settings.days.length;j++){

              if(days_element[i].value == settings.days[j]){
                  days_element[i].checked = true;
              }
          }
      }

  }
  };
  j.open('POST', '../php_pages/settings.php');
  j.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
  j.send();
}

function get_name() {
  var j = new XMLHttpRequest();
  j.onreadystatechange = function () {
  if (j.readyState == 4 && j.status == 200) {
      var settings = JSON.parse(j.responseText);
      //console.log(JSON.parse(j.responseText));
      document.getElementById("rest_name_title").innerText = settings.name;

  }
  };
  j.open('POST', '../php_pages/settings.php');
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


function fill_reservations(settings_obj, numberof) {
  var reservation_array = []
  var number_of_tables = parseInt(numberof) + 1;
  var opentime = settings_obj.open_time.substring(0, 2);
  var closetime = settings_obj.close_time.substring(0, 2);

  var totalhoursopen = closetime - opentime;
  const alphabet = ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"];

  for (let i = 0; i < totalhoursopen; i++) {
    const reservation_obj = {
      time: parseInt(settings_obj.open_time.substring(0, 2)) + i,
      reserved: false,

    }
    reservation_array.push(reservation_obj);
    
  }
  var json = JSON.stringify(reservation_array);
  //console.log(reservation_array);


  var j = new XMLHttpRequest();
  j.onreadystatechange = function () {
  if (j.readyState == 4 && j.status == 200) {
      //console.log(j.responseText);
  }
  };
  j.open('POST', '../php_pages/fillreservations.php');
  j.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
  j.send("empty=" + json);
  

}

function get_info() {
  var j = new XMLHttpRequest();
  j.onreadystatechange = function () {
  if (j.readyState == 4 && j.status == 200) {
      var settings = JSON.parse(j.responseText);
      get_numberof(settings)
  }
  };
  j.open('POST', '../php_pages/settings.php');
  j.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
  j.send();
}

function get_numberof(settings){
  var j = new XMLHttpRequest();
  j.onreadystatechange = function () {
      if (j.readyState == 4 && j.status == 200) {
        var response = JSON.parse(j.responseText);
        fill_reservations(settings, response.numberof);
      }
  };
  j.open('POST', '../php_pages/getgrid.php');
  j.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
  j.send();

}


function get_info_about() {
  var j = new XMLHttpRequest();
  j.onreadystatechange = function () {
  if (j.readyState == 4 && j.status == 200) {
      var settings = JSON.parse(j.responseText);
      console.log(JSON.parse(j.responseText));

      var op = parseInt(settings.open_time.substring(0, 2));
      var cl = parseInt(settings.close_time.substring(0, 2));

      
      var o = (((op) + 11) % 12 + 1);
      var c = (((cl) + 11) % 12 + 1);

      console.log(o, c);

      var suffix_o = (op) >= 12 ? " PM":" AM";
      var suffix_c = (cl) >= 12 ? " PM":" AM";


      document.getElementById("rest_name").innerText = settings.name;
      document.getElementById("open_time").innerText = o + suffix_o + " - " +  c + suffix_c;
      document.getElementById("rest_location").innerText = settings.location;
      
      var days_element = document.getElementsByName("days");

      for(let i = 0; i<7;i++){
          for(let j = 0; j<settings.days.length;j++){

              if(days_element[i].value == settings.days[j]){
                  days_element[i].checked = true;
              }
          }
      }
  }
  };
  j.open('POST', '../php_pages/settings.php');
  j.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
  j.send();
}