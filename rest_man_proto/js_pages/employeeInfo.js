var employee;
function update(){
    var a = window.location.hash;
    var username=a.substring(1,a.length); //eliminate # 
    var j = new XMLHttpRequest();
        j.onreadystatechange = function () {
            if (j.readyState == 4 && j.status == 200) {
                employee = JSON.parse(j.responseText);
                document.getElementById("f_name").innerHTML = "First name: " + employee['first_name'];
                document.getElementById("l_name").innerHTML = "Last name: " + employee['last_name'];
                document.getElementById("email").innerHTML = "Email: " + employee['email'];
                document.getElementById("phone").innerHTML = "Phone number: " + employee['phone'];
                document.getElementById("position").innerHTML = "Position: " + employee['position'];
                document.getElementById("wage").innerHTML = "Wage: " + employee['wage'];
            }
    };
    j.open('POST', '../php_pages/getAnEmployee.php');
    j.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    j.send("username="+ username);
}
function edit_employee(){
        document.getElementById("f_name").innerHTML="First name: "+ employee['first_name']+ "<input id=\"Inf_name\"></input>";
        document.getElementById("l_name").innerHTML="Last name: " + employee['last_name']+ "<input id=\"Inl_name\"></input>";
        document.getElementById("email").innerHTML="Email: " + employee['email']+ "<input id=\"Inemail\"></input>";
        document.getElementById("phone").innerHTML="Phone number: " + employee['phone']+ "<input id=\"Inphone\"></input>";
        document.getElementById("position").innerHTML="Position:"  + employee['position']+ "<input id=\"Inposition\"></input>";
        document.getElementById("wage").innerHTML="Wage: " + employee['wage']+ "<input id=\"Inwage\"></input> <button onclick=\"edit()\">EDIT</button>";
    }
function edit(){
    f_name = document.getElementById("Inf_name").value;
    l_name = document.getElementById("Inl_name").value;
    email = document.getElementById("Inemail").value;
    phone = document.getElementById("Inphone").value;
    position = document.getElementById("Inposition").value;
    wage = document.getElementById("Inwage").value;
    if(f_name == "")
    {
        f_name=employee['first_name'];
    }
    if (l_name == "")
    {
        l_name=employee['last_name'];
    }
    if (email == "")
    {
        email=employee['email'];
    }
    if (phone == "")
    {
        phone=employee['phone'];
    }
    if (position == "")
    {
        position=employee['position'];
    }
    if (wage == "")
    {
        wage=employee['wage'];
    }
    var j = new XMLHttpRequest();
        j.onreadystatechange = function () {
            if (j.readyState == 4 && j.status == 200) {
                alert(j.responseText);
                update();
            }
    };
    j.open('POST', '../php_pages/update_employee.php');
    j.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    j.send("fname=" + f_name + "&lname=" + l_name + "&email=" + email+ "&phone=" + phone+ "&position=" + position+ "&wage=" + wage);
}
// var user_array;
// var length;
// var i;


// function create_user_rows(){
//     var users = document.getElementById("employee_list");
//     for(i = 0; i < length; i++){
//         var row = users.insertRow(-1);
//         var f_name = row.insertCell(-1);
//         var l_name = row.insertCell(-1);
//         var email = row.insertCell(-1);
//         var phone = row.insertCell(-1);
//         var position = row.insertCell(-1);
//         var wage = row.insertCell(-1);

//         var edit = row.insertCell(-1);
//         //Delete button
//         var element = document.createElement("button");
//         element.type = "button";
//         element.innerHTML = '<i class="fas fa-trash"></i>';
//         element.className ="deleteBtn"
//         element.onclick = function() {
//             delete_user(user_array[this.parentNode.parentNode.rowIndex-1]);
//         }

//         //Edit button
//         var editBtn = document.createElement("button");
//         editBtn.type = "button";
//         editBtn.innerText = "Edit"
//         editBtn.onclick = function() {
//             window.location="./employeeInfo.html?hi";
//         }

//         f_name.innerHTML = user_array[i]['first_name'];
//         l_name.innerHTML = user_array[i]['last_name'];
//         email.innerHTML = user_array[i]['email'];
//         phone.innerHTML = user_array[i]['phone'];
//         position.innerHTML = user_array[i]['position'];
//         wage.innerHTML = user_array[i]['wage'];

//         edit.appendChild(element);
//         edit.appendChild(editBtn);

//     }
//     $("table tr").hide();
//     $("table tr").each(function(index){
//         $(this).delay(index*20).show(0);
//     });
// }

// function update(){
//     console.log("hi");
// }
// function get_employees(){
//     document.getElementById("employee_list").innerHTML = "";
//     var j = new XMLHttpRequest();
//         j.onreadystatechange = function () {
//             if (j.readyState == 4 && j.status == 200) {
//                 user_array = JSON.parse(j.responseText);
//                 length = user_array.length;
//                 create_user_rows();
//             }
//     };
//     j.open('POST', '../php_pages/getemployees.php');
//     j.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
//     j.send();

// }

// function delete_user(data){
//     user = data['username'];
//     var j = new XMLHttpRequest();
//         j.onreadystatechange = function () {
//             if (j.readyState == 4 && j.status == 200) {
//                 console.log(j.responseText);
//                 get_employees();
//             }
//     };
//     j.open('POST', '../php_pages/delete_user.php');
//     j.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
//     j.send("u=" + user);
// }