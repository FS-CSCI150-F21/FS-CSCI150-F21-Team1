var reservation_array = []
var current_table;
var table_time;
var last_clicked;
function get_table_info(letter) {
    document.getElementById('add_modal').style.display="block";
    document.getElementById('add_modal').style.visibility="visible";
    var j = new XMLHttpRequest();
    j.onreadystatechange = function () {
        if (j.readyState == 4 && j.status == 200) {
            var table = JSON.parse(j.responseText);
            var cap = table[0].capacity;
            get_info(letter, cap);
        }
    };
    j.open('POST', '../php_pages/get_table_info.php');
    j.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    j.send("tableid=" + letter);
}

// function get_tables() {
//     const alphabet = ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"];

//     var j = new XMLHttpRequest();
//     j.onreadystatechange = function () {
//         if (j.readyState == 4 && j.status == 200) {
//             var table = JSON.parse(j.responseText);
//             //console.log(table.length);

//             for(let i = 0;i<table.length;i++){
//                 const table_obj = {
//                     id: alphabet[i],
//                     reservations: []
//                 }
//                 reservation_array[i] = (table_obj);
//             }
//             //console.log(reservation_array);
//         }
//     };
//     j.open('POST', '../php_pages/get_table.php');
//     j.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
//     j.send("tableid=" + 1 + "&" + "test=" + 0);
// }


function get_info(table_letter, cap) {
    var j = new XMLHttpRequest();
    j.onreadystatechange = function () {
    if (j.readyState == 4 && j.status == 200) {
        var settings = JSON.parse(j.responseText);
        var open_hour = parseInt(settings.open_time.substring(0, 2));
        var close_hour = parseInt(settings.close_time.substring(0, 2));
        //console.log(cap);
        draw_reservations(open_hour, close_hour, table_letter, cap);
    }
    };
    j.open('POST', '../php_pages/settings.php');
    j.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    j.send();
}

function draw_reservations(open, close, letter, cap) {
    document.getElementById("reservation_text").innerHTML = "";

    var total_hours = close - open;
    //console.log(total_hours);


    var modal = document.getElementById("reservation_list");
    modal.innerHTML = "";
    document.getElementById("tabletitle").innerHTML = "Reservations for Table " + letter + "<br>" + "Capacity of " + cap;

    //modal.innerHTML = "";
    //console.log(reservation_array);

    for (let i = 0; i < total_hours; i++) {
        idx = reservation_array.findIndex(x => x.id === letter);
        var row = modal.insertRow(-1);
        var btn = row.insertCell(-1);

        var element = document.createElement("button");
        var suffix = (open+i) >= 12 ? " PM":" AM";
        element.type = "button";
        element.id = letter + (open+i);
        element.innerHTML = (((open+i) + 11) % 12 + 1) + suffix;
        element.className = "reserveBtn";
        
        idx = reservation_array.findIndex(x => x.id === letter);
        if(reservation_array[idx].reservations[i].reserved){
            element.style.background = "rgb(255, 157, 157)";
            element.disabled = true;
            element.innerHTML = "";
            element.innerHTML = "Reserved";
        }
        element.onclick = function() {
            make_reservation(reservation_array[idx].reservations, letter, i);
        }
        btn.appendChild(element);

    }
    current_table = letter;
    
}

function make_reservation(reservation_for_letter, letter, idx) {
    var hours = reservation_for_letter[idx].time;
    
    //console.log(reservation_for_letter[idx]);

    var suffix = (hours) >= 12 ? " PM":" AM";
    document.getElementById("reservation_text").innerHTML = 
    "Make reservation for table " + letter + " at the time of " + (((hours) + 11) % 12 + 1) + suffix + " ?";
    document.getElementById(letter + hours).style.background = "rgb(221, 255, 208)";
    paint_rest(letter,hours);
    current_table = letter;
    table_time = hours;

    last_clicked = idx;

}

function paint_rest(letter,hours) {
    var button_list = document.getElementById("reservation_list").children;
    var suffix = (hours) >= 12 ? " PM":" AM";
    var current_time = (((hours) + 11) % 12 + 1) + suffix;

    idx = reservation_array.findIndex(x => x.id === letter);

    
    
    for (let i = 0; i < button_list.length; i++) {
        //console.log(current_time);
        //console.log(button_list[i].children[0].innerText == current_time);

        if(reservation_array[idx].reservations[i].reserved){
            button_list[i].children[0].children[0].style.background = "rgb(255, 157, 157)";
            button_list[i].children[0].children[0].disabled = true;
        }
        else if(button_list[i].children[0].innerText !== current_time){
            button_list[i].children[0].children[0].style.background = "white";
        } 
        // else
        // {
        //     console.log( button_list[i].children[0].children[0]);
        //     button_list[i].children[0].children[0].style.background = "white";
        // }
    }
}

function hide_modal(){
    var modal = document.getElementById("reservation_list");
    modal.innerHTML = "";
    document.getElementById('add_modal').style.display ="none";
}


function save_reservations() {
    document.getElementById("reservation_text").innerHTML = "Successfully Reserved";
    var button_list = document.getElementById("reservation_list").children;
    console.log(last_clicked);
    console.log(table_time, current_table);
    var idx_for_main_array = reservation_array.findIndex(x => x.id === current_table);
    var idx_for_sub_array = reservation_array[idx_for_main_array].reservations.findIndex(x => x.time === table_time);
    reservation_array[idx_for_main_array].reservations[idx_for_sub_array].reserved = true;

    button_list[idx_for_sub_array].children[0].children[0].style.background = "rgb(255, 157, 157)";
    button_list[idx_for_sub_array].children[0].children[0].disabled = true;
    button_list[idx_for_sub_array].children[0].children[0].innerHTML = "Reserved";

    var tableid = current_table;
    var table_reservation_time = table_time;
    json_array = JSON.stringify(reservation_array[idx_for_main_array].reservations);
    var j = new XMLHttpRequest();
    j.onreadystatechange = function () {
    if (j.readyState == 4 && j.status == 200) {

    }
    };
    j.open('POST', '../php_pages/reservations.php');
    j.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    j.send("id=" + current_table + "&" + "res=" + json_array);
}

function get_all_table_reservations() {
    idx = reservation_array.findIndex(x => x.id === current_table);
    var j = new XMLHttpRequest();
    j.onreadystatechange = function () {
    if (j.readyState == 4 && j.status == 200) {
        var response_array = JSON.parse(j.responseText);
        reservation_array = response_array;
        //console.log(reservation_array);
    }
    };
    j.open('POST', '../php_pages/get_reservations.php');
    j.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    j.send("id=" + current_table);
}


