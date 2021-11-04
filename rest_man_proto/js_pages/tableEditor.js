var table_coords;
var global_table_id;
var newtables = 0;
function set_table(){
    var numrows = document.getElementById("x").value;
    var numcols = document.getElementById("y").value;
    table_coords = new Array(numrows);

    for(var i = 0;i<numcols;i++){
        table_coords[i] = new Array(numcols); //size for both was previously 9 
    }

    for(var i = 0;i<numrows;i++){
        for(var j = 0;j<numcols;j++){
            table_coords[i][j] = 0; 
        }
    }
    
    create_grid(table_coords, numrows, numcols);

}

function create_grid(table_coords,numrows, numcols){
    if(numrows == 0 || numcols == 0 ){
        document.getElementById("error").innerHTML = "Values must be greater than 0";
    }
    else{
        var table = document.getElementById("grid");
        table.innerHTML = "";
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
    var boxes = document.getElementsByClassName("box");
    global_table_id = tableid[5];
    if(type === 'delete'){
        for (let i = 0; i < boxes.length; i++) {
            boxes[i].setAttribute("onclick","erase(this.id)");
            boxes[i].style.cursor = "pointer";
        }
    }
    else if(type === 'table'){
        for (let i = 0; i < boxes.length; i++) {
            boxes[i].setAttribute("onclick","draw_table(this.id)");
            boxes[i].style.cursor = "pointer";
        }
    }

}

function remove_clickable()//removes functionality to prevent accidental clicks
{
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
    document.getElementById(test).style.border = "none";
    document.getElementById(test).innerText = -1;

}

function draw_table(id){
    var test = id;
    var i = parseInt(test.substring(0,2));
    var j = parseInt(test.substring(2,4));
    document.getElementById(test).style.backgroundColor = "red";
    document.getElementById(test).innerText = global_table_id;


    
}

function new_table_button(){
    const alphabet = ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"];
    
    var parent = document.getElementById("table_buttons");
    var element = document.createElement("button");
    element.type = "button";
    element.innerText = "Table " + (4 + newtables);
    element.id = "table" + alphabet[3 + newtables];
    element.onclick = make_interactive('table', ("table" + alphabet[3 + newtables]));

    parent.appendChild(element);

    newtables++;
}