var table_coords;
var global_table_id;
var newtables = 0;
var table_objects = [];
var hours_g;
var open_g;
function set_table_coords(){

    var numrows = document.getElementById("x").value;
    var numcols = document.getElementById("y").value;
    table_coords = new Array(numrows);

    for(var i = 0;i<numrows;i++){
        table_coords[i] = new Array(numcols);
    }
    
    for(var i = 0;i<numrows;i++){
        for(var j = 0;j<numcols;j++){
            table_coords[i][j] = 0; 
        }
    }
    console.log(table_coords);
    create_grid(table_coords, numrows, numcols);
    paintgrid(numrows,numcols);

}

function set_table(){
    var j = new XMLHttpRequest();
    j.onreadystatechange = function () {
        if (j.readyState == 4 && j.status == 200) {
            var response = JSON.parse(j.responseText);
            if(response.grid == null){
                set_table_coords()
            }
            else{
                //console.log(response.grid);
                var temprows = response.grid.length;
                var tempcols = response.grid[0].length;

                document.getElementById("x").value = temprows;
                document.getElementById("y").value = tempcols;
                table_coords = response.grid;
                create_grid(table_coords, temprows, tempcols);
                paintgrid(temprows,tempcols);
                //console.log("number of from j response =", response.numberof);
                createtablebuttons(response.numberof);
                get_all_tables();

                

            }
        }
    };
    j.open('POST', '../php_pages/getgrid.php');
    j.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    j.send();

}

function createtablebuttons(numberof){
    //console.log(numberof);
    for(var i = 0; i<(numberof); i++){
        const alphabet = ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"];
        var parent = document.getElementById("table_buttons");
        var element = document.createElement("button");
        element.type = "button";
        element.innerText = "Table " + (alphabet[1 + i]);
        element.id = "table" + alphabet[1 + i];
        element.addEventListener("click", make_interactive.bind(null,"table", "table" + (alphabet[1 + newtables])))
        parent.appendChild(element);
        newtables++;
    }
    //console.log(newtables);
    
}



function deletetablebuttons(){

    const alphabet = ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"];
    var parent = document.getElementById("table_buttons");
    var children = parent.children;
    if(children.length > 1){
        parent.removeChild(children[children.length - 1]);
        newtables--;
    }
    else
    {
        console.log("no more tables");
    }

    var parent2 = document.getElementById("tables");
    var children2 = parent2.children;
    if(children2.length > 1){
        parent2.removeChild(children2[children2.length - 1]);
        table_objects.pop();
    }
    else
    {
        console.log("no more tables");
    }

    console.log(table_objects);

}

function paintgrid(rows,cols){
    var newi, newj;
    for(var i = 0; i < rows; i++){
        for(var j = 0; j < cols; j++){
            var current_coord = table_coords[i][j];
            if(i < 10){
                newi = "0" + String(i);
            }
            else{
                newi = String(i);
            }
            if(j < 10){
                newj = "0" + String(j);
            }
            else{
                newj = String(j);
            }
            var id = newi + newj; 
            if(isCharacterALetter(current_coord)){
                
                document.getElementById(id).style.backgroundColor = "rgb(145, 255, 163)";
            }
            else if(current_coord==0){
                document.getElementById(id).style.border = "1px solid black";
                document.getElementById(id).style.background = "white";
            }
            else if(current_coord==-1){
                document.getElementById(id).style.border = "none";
                document.getElementById(id).style.background = "transparent";
            }

        }

    }
}

function isCharacterALetter(char) {
  return (/[a-zA-Z]/).test(char)
}

function create_grid(table_coords,numrows, numcols){
    if(numrows == 0 || numcols == 0 ){
        document.getElementById("error").innerHTML = "Values must be greater than 0";
    }
    else{
        var table = document.getElementById("grid");
        table.innerHTML = "";
        var table_buttons = document.getElementById("table_buttons");
        // table_buttons.innerHTML = "";

        var newi, newj;
        for(var i = 0; i < numrows; i++){
            var row = document.createElement("tr");
            row.className = "row";
            row.id = "row" + i;
            for(var j = 0; j < numcols; j++){
                var cell = document.createElement("td");
                cell.className = "box";
                if(i < 10){
                    newi = "0" + String(i);
                }
                else{
                    newi = String(i);
                }
                if(j < 10){
                    newj = "0" + String(j);
                }
                else{
                    newj = String(j);
                }
                cell.id = newi + newj;
                cell.innerText = table_coords[i][j];
                row.appendChild(cell);
            }
            table.appendChild(row);
        }

    }

}

function make_interactive(type, tableid){
    //console.log(tableid);
    var boxes = document.getElementsByClassName("box");
    var action = document.getElementById("is_drawing");
    if(type === 'delete'){
        action.innerText = "Deleting Cells";
        for (let i = 0; i < boxes.length; i++) {
            boxes[i].setAttribute("onclick","erase(this.id)");
            boxes[i].style.cursor = "pointer";
        }
    }
    else if(type === 'table'){
        
        global_table_id = tableid[5];
        action.innerText = "Drawing Table " + global_table_id;
        //console.log(global_table_id);
        for (let i = 0; i < boxes.length; i++) {
            boxes[i].setAttribute("onclick","draw_table(this.id)");
            boxes[i].style.cursor = "pointer";
        }
    }
    else if(type === 'default'){
        action.innerText = "Drawing Default Cell";
        for (let i = 0; i < boxes.length; i++) {
            boxes[i].setAttribute("onclick","make_default(this.id)");
            boxes[i].style.cursor = "pointer";
        }
    }

}

function remove_clickable()//removes functionality to prevent accidental clicks
{
    var action = document.getElementById("is_drawing");
    action.innerText = "Click on button to start drawing";
    var boxes = document.getElementsByClassName("box");
    for(var i = 0 ; i<boxes.length ;i++)
    {
        boxes[i].removeAttribute("onclick");
        boxes[i].style.cursor = "default";
    }
}

function erase(id){
    var test = id;
    var i = parseInt(test.substring(0,2));
    var j = parseInt(test.substring(2,4));
    document.getElementById(test).style.background = "transparent";
    document.getElementById(test).style.border = "none";
    document.getElementById(test).innerText = -1;
    table_coords[i][j] = -1; 
}

function draw_table(id){
    var test = id;
    var i = parseInt(test.substring(0,2));
    var j = parseInt(test.substring(2,4));
    document.getElementById(test).style.backgroundColor = "red";
    document.getElementById(test).innerText = global_table_id;  
    table_coords[i][j] = global_table_id;  
}

function make_default(id){
    var test = id;
    var i = parseInt(test.substring(0,2));
    var j = parseInt(test.substring(2,4));
    document.getElementById(id).style.border = "1px solid black";

    document.getElementById(test).style.background = "white";
    document.getElementById(test).innerText = 0;  
    table_coords[i][j] = 0;  
}

function new_table_button(){
    if(newtables < 25){
        const alphabet = ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"];
    
        var parent = document.getElementById("table_buttons");
        var element = document.createElement("button");
        element.type = "button";
        element.className = "tableBtns";
        element.innerText = "Table " + (alphabet[1 + newtables]);
        element.id = "table" + alphabet[1 + newtables];
        element.addEventListener("click", make_interactive.bind(null,"table", "table" + (alphabet[1 + newtables])));
        
        
        parent.appendChild(element);

    
        var selectParent = document.getElementById("tables");
        var option = document.createElement("option");
        option.value = newtables;
        option.innerHTML = "table" + (alphabet[1 + newtables]);

        

        selectParent.appendChild(option);
        
        var test = [];        
        console.log(open_g);
        for(let i = 0; i<open_g; i++){
            const hourly_reservation = {
                time: (hours_g + i),
                reserved: false
            }
            test.push(hourly_reservation);
        }

        var emptyTable = {
            id: (alphabet[1 + newtables]),
            capacity: Math.floor(Math.random() * (10 - 4) + 4),
            reservations: test
        }
        
        var constantTable = {
            id: "A",
            capacity: Math.floor(Math.random() * (10 - 4) + 4),
            reservations: test
        }

        //console.log(emptyTable);
        selectParent.selectedIndex = newtables;
        
        table_objects.push(emptyTable);
        table_objects[0] = constantTable;

        set_capacity(newtables+1);
        newtables++;
        console.log("THIS THING", table_objects);
    }


}

function get_info(table_letter) {
    var j = new XMLHttpRequest();
    j.onreadystatechange = function () {
    if (j.readyState == 4 && j.status == 200) {
        var settings = JSON.parse(j.responseText);
        var open_hour = parseInt(settings.open_time.substring(0, 2));
        var close_hour = parseInt(settings.close_time.substring(0, 2));
        hours_g = close_hour - open_hour;
        open_g = open_hour;
    }
    };
    j.open('POST', '../php_pages/settings.php');
    j.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    j.send();
}

function save_table(){
    update_current_capacity();
    //console.log(newtables);
    //console.log(table_coords);
    var jarray = JSON.stringify(table_coords);
    var j = new XMLHttpRequest();
        j.onreadystatechange = function () {
            if (j.readyState == 4 && j.status == 200) {
                //console.log(JSON.parse(j.responseText));
                
            }
    };
    j.open('POST', '../php_pages/tablegrid.php');
    j.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    j.send("number=" + (newtables) + "&" + "tcoords=" + jarray);
}

function update_current_capacity(){

    var jarray = JSON.stringify(table_objects);
    //console.log(table_objects);
    //console.log(jarray);
    var j = new XMLHttpRequest();
        j.onreadystatechange = function () {
            if (j.readyState == 4 && j.status == 200) {
                console.log(j.responseText);
                
            }
    };
    j.open('POST', '../php_pages/add_table.php');
    j.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    j.send("tables=" + jarray);

}


function set_capacity(idx){
    //console.log("Index in table array =",idx);
    document.getElementById("table_capacity").value = table_objects[idx].capacity;

}

function get_all_tables(){
    
    var j = new XMLHttpRequest();
    j.onreadystatechange = function () {
        if (j.readyState == 4 && j.status == 200) {
            var table = JSON.parse(j.responseText);
            //console.log(j.responseText);
            table_objects = table;
            for(var i =0;i<table_objects.length;i++){
                table_objects[i].capacity = parseInt(table_objects[i].capacity); 

                
            }
            set_capacity(0);
            //console.log(table_objects);
            add_tables_to_dropdown();
            style_btns();
        }
    };
    j.open('POST', '../php_pages/get_table.php');
    j.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    j.send("tableid=" + 1 + "&" + "test=" + 0);
}

function style_btns() {
    var table_list = document.getElementById("table_buttons").childNodes;
    for(let i = 0;i<table_list.length;i++){
        table_list[i].className = "tableBtns";
    }
}

function add_tables_to_dropdown(){
    const alphabet = ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"];
    //console.log("Number of newtables =",newtables);
    var selectParent = document.getElementById("tables");
    selectParent.removeChild
    for (let index = 0; index < newtables; index++) {
        var option = document.createElement("option");
        option.value = index + 1;
        option.innerHTML = "table" + (alphabet[1 + index]);
        selectParent.appendChild(option);
    }
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


