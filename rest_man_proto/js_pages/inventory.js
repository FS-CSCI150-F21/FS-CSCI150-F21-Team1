var inventory_array;
var length;
var i;

window.onload = function () {
    get_inventory();
}

function create_inventory_rows(){
    var inventory = document.getElementById("inventory_list");
    for(i = 0; i < length; i++){
        var row = inventory.insertRow(-1);
        var name = row.insertCell(-1);
        var currentQuantity = row.insertCell(-1);
        var requiredQuantity = row.insertCell(-1);
        var lastupdate = row.insertCell(-1);
        var edit = row.insertCell(-1);

        //Edit button
        // var
        var editBtn = document.createElement("button");
        editBtn.type = "button";
        editBtn.innerText = "Edit"
        editBtn.onclick = function() {
            // edit_inventory(inventory_array[this.parentNode.parentNode.rowIndex-1]);
            console.log(inventory_array[this.parentNode.parentNode.rowIndex-1]);
            console.log(inventory.rows[this.parentNode.parentNode.rowIndex-1]);
            inventory.rows[this.parentNode.parentNode.rowIndex-1].innerHTML = 
            "<tr><td>"+ inventory_array[this.parentNode.parentNode.rowIndex-1]['name']+"</td>"+
            "<td><input type=\"text\" id=\"currentQuantity\" placeholder=\"Current Quantity\" required></td>"+
            "<td><input type=\"text\" id=\"requiredQuantity\" placeholder=\"Required Quantity\" required></td></tr>"+
            "<td>"+inventory_array[this.parentNode.parentNode.rowIndex-1]['lastupdate']+"</td>"+
            "<td><button onclick=\"edit_inventory(inventory_array[this.parentNode.parentNode.rowIndex-1])\">Change</button><button onclick=\"get_inventory()\">< Back</button></td>";
        }

        //Delete button
        var deleteBtn = document.createElement("button");
        deleteBtn.type = "button";
        deleteBtn.innerText = "Delete"
        deleteBtn.onclick = function() {
            delete_inventory(inventory_array[this.parentNode.parentNode.rowIndex-1]);
        }

        name.innerHTML = inventory_array[i]['name'];
        currentQuantity.innerHTML = inventory_array[i]['currentQuantity'];
        requiredQuantity.innerHTML = inventory_array[i]['requiredQuantity'];
        lastupdate.innerHTML = inventory_array[i]['lastupdate'];
        edit.appendChild(editBtn);
        edit.appendChild(deleteBtn);
    }
}

function get_inventory(){
    document.getElementById("inventory_list").innerHTML = "";
    var j = new XMLHttpRequest();
        j.onreadystatechange = function () {
            if (j.readyState == 4 && j.status == 200) {
                inventory_array = JSON.parse(j.responseText);
                length = inventory_array.length;
                create_inventory_rows();
            }
    };
    j.open('POST', '../php_pages/getInventory.php');
    j.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    j.send();
}

function add_inventory() {
    var name = document.getElementById("modal_name").value;
    var currentQuantity = document.getElementById("modal_currentQuantity").value;
    var requiredQuantity = document.getElementById("modal_requiredQuantity").value;

    if(name=="")
    {
        alert("Name needed");
        return;
    }
    const created_inventory = {
      name: name, 
      currentQuantity: currentQuantity,
      requiredQuantity: requiredQuantity,
    };

    var j_iteminfo = JSON.stringify(created_inventory);
    if (name) {
      var j = new XMLHttpRequest();
      j.onreadystatechange = function () {
        if (j.readyState == 4 && j.status == 200) {
            console.log(j.responseText);
          if(j.responseText == 1){
            document.getElementById("test").innerHTML = "Item is successfully added";
          }
          else {
            document.getElementById("test").innerHTML = "Item already exists";
          }
        }
      };
      j.open('POST', '../php_pages/add_inventory.php');
      j.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
      j.send("inventory=" + j_iteminfo);
    }
    else {
      document.getElementById("test").innerHTML = "ERROR: EMPTY FIELDS";
    }
}
function hide_modal(){
    document.getElementById("test").innerHTML = "";
    document.getElementById('add_modal').style.display='none';
    get_inventory();
    }

function edit_inventory(data){
    item = data['name'];
    newCurrentQuantity = document.getElementById("currentQuantity").value;
    newRequiredQuantity = document.getElementById("requiredQuantity").value;
    var j = new XMLHttpRequest();
        j.onreadystatechange = function () {
            
            if (j.readyState == 4 && j.status == 200) {
                alert(j.responseText);
                get_inventory();
            }
    };
    j.open('POST', '../php_pages/update_inventory.php');
    j.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    j.send("i=" + item + "&cQ=" + newCurrentQuantity + "&rQ=" + newRequiredQuantity);
}

function delete_inventory(data){
    item = data['name'];
    var j = new XMLHttpRequest();
        j.onreadystatechange = function () {
            
            if (j.readyState == 4 && j.status == 200) {
                alert(j.responseText);
                get_inventory();
            }
    };
    j.open('POST', '../php_pages/delete_inventory.php');
    j.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    j.send("i=" + item);
}