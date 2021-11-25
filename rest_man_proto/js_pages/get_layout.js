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

                table_coords = response.grid;
                create_grid(table_coords, temprows, tempcols);
                paintgrid(temprows,tempcols);
            }
        }
    };
    j.open('POST', '../php_pages/getgrid.php');
    j.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    j.send();

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
                letter_cells(current_coord,i,j, id);
            }
            else if(current_coord==-1){
                deleted_cells(current_coord,i,j,id)
            }
            else if(current_coord ==0){
                if(j==0){
                    document.getElementById(id).style.borderLeft = "2px solid black";
                }
                else if(j == table_coords[0].length - 1)
                {
                    document.getElementById(id).style.borderRight = "2px solid black";
                }
                else if(i ==0){
                    document.getElementById(id).style.borderTop = "2px solid black";
                }
                else if(i == table_coords.length-1){
                    document.getElementById(id).style.borderBottom = "2px solid black";
                }
            }

        }

    }
}
function deleted_cells(current_coord,i,j,id){
    check_delete_above(current_coord,i,j,id);
    check_delete_below(current_coord,i,j,id);
    check_delete_left(current_coord,i,j,id);
    check_delete_right(current_coord,i,j,id);
}
function check_delete_above(current_coord,i,j,id){
    if(i ==0){
    }
    else {
        var up = table_coords[i-1][j];
        if(isCharacterALetter(up) || (up == 0) || (!up == -1)){
            
            document.getElementById(id).style.borderTop = "2px solid black";
        }
    }
}
function check_delete_below(current_coord,i,j,id){
    if(i == table_coords.length -1 ){}
    else {
        var up = table_coords[i+1][j];
        if(isCharacterALetter(up) || (up == 0) || (!up == -1)){
            
            document.getElementById(id).style.borderBottom = "2px solid black";
        }
    }
}
function check_delete_left(current_coord,i,j,id){
    if(j == 0){}
    else {
        var up = table_coords[i][j-1];
        if(isCharacterALetter(up) || (up == 0) || (!up == -1)){
            document.getElementById(id).style.borderLeft = "2px solid black";
        }
    }
}
function check_delete_right(current_coord,i,j,id){
    if(j == table_coords[0].length -1){}
    else {
        var up = table_coords[i][j+1];
        if(isCharacterALetter(up) || (up == 0) || (!up == -1)){
            document.getElementById(id).style.borderRight = "2px solid black";
        }
    }
}
function letter_cells(current_coord,i,j,id){
    check_above(current_coord,i,j,id);
    check_below(current_coord,i,j,id);
    check_left(current_coord,i,j,id);
    check_right(current_coord,i,j,id);
}

function check_above(current_coord, i, j, id){
    if(i==0){
        document.getElementById(id).style.borderTop = "2px solid black";
    }
    else{
        var up = table_coords[i-1][j];
        console.log(up, current_coord);
        if((up != current_coord)){
            document.getElementById(id).style.borderTop = "2px solid black";
        }
    }


}

function check_below(current_coord, i, j, id){
    if(i== table_coords.length-1){
        document.getElementById(id).style.borderBottom = "2px solid black";
    }
    else{
        var down = table_coords[i+1][j];
        console.log(down, current_coord);
        if((down != current_coord)){
            document.getElementById(id).style.borderBottom = "2px solid black";
        }
    }


}

function check_left(current_coord, i, j, id){
    if(j==0){
        document.getElementById(id).style.borderLeft = "2px solid black";
    }
    else{
        var left = table_coords[i][j-1];
        console.log(current_coord, left);
        if((left != current_coord)){
            document.getElementById(id).style.borderLeft = "2px solid black";
        }
    }


}
function check_right(current_coord, i, j, id){
    if(j== table_coords[0].length-1){
        document.getElementById(id).style.borderRight = "2px solid black";
    }
    else{
        var right = table_coords[i][j+1];
        console.log(current_coord, right);
        if((right != current_coord)){
            document.getElementById(id).style.borderRight = "2px solid black";
        }
    }


}

function isCharacterALetter(char) {
  return (/[a-zA-Z]/).test(char)
}

function create_grid(table_coords,numrows, numcols){
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
                if(table_coords[i][j] == 0 || table_coords[i][j] == -1){
                    cell.innerHTML = "\u00A0";
                }
                else{
                    cell.innerText = table_coords[i][j];
                }
                row.appendChild(cell);
            }
            table.appendChild(row);
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