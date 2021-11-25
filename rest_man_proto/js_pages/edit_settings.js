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
;
    const settings = {
        name: res_name,
        location: res_location,
        otime: open_time,
        ctime: close_time,
        day: days,
    }

    //console.log(settings);

    var j_settings = JSON.stringify(settings);

    if (res_name && open_time && close_time && res_location && days) {
      var j = new XMLHttpRequest();
      j.onreadystatechange = function () {
        if (j.readyState == 4 && j.status == 200) {
            console.log(j.responseText);
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

        document.getElementById("rest_name").innerHTML = settings.name;
        document.getElementById("open_time").innerHTML = settings.open_time;
        document.getElementById("close_time").innerHTML = settings.close_time;
        document.getElementById("rest_location").innerHTML = settings.location;
        
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

