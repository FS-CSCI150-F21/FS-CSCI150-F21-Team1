var customer;
function update(){
    var a = window.location.hash;
    var username=a.substring(1,a.length); //eliminate # 
    var j = new XMLHttpRequest();
        j.onreadystatechange = function () {
            if (j.readyState == 4 && j.status == 200) {
                customer = JSON.parse(j.responseText);
                document.getElementById("f_name").innerHTML = "First name: " + customer['first_name'];
                document.getElementById("l_name").innerHTML = "Last name: " + customer['last_name'];
                document.getElementById("email").innerHTML = "Email: " + customer['email'];
                document.getElementById("phone").innerHTML = "Phone number: " + customer['phone'];
            }
    };
    j.open('POST', '../php_pages/getAnEmployee.php');
    j.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    j.send("username="+ username);
}
function edit_customer(){
        document.getElementById("f_name").innerHTML="First name: "+ customer['first_name']+ "<input id=\"Inf_name\"></input>";
        document.getElementById("l_name").innerHTML="Last name: " + customer['last_name']+ "<input id=\"Inl_name\"></input>";
        document.getElementById("email").innerHTML="Email: " + customer['email']+ "<input id=\"Inemail\"></input>";
        document.getElementById("phone").innerHTML="Phone number: " + customer['phone']+ "<input id=\"Inphone\"></input><button onclick=\"edit()\">EDIT</button>";
    }
function edit(){
    f_name = document.getElementById("Inf_name").value;
    l_name = document.getElementById("Inl_name").value;
    email = document.getElementById("Inemail").value;
    phone = document.getElementById("Inphone").value;
    if(f_name == "")
    {
        f_name=customer['first_name'];
    }
    if (l_name == "")
    {
        l_name=customer['last_name'];
    }
    if (email == "")
    {
        email=customer['email'];
    }
    if (phone == "")
    {
        phone=customer['phone'];
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
    j.send("fname=" +customer['first_name']+"&fname1=" + f_name + "&lname=" + l_name + "&email=" + email+ "&phone=" + phone+ "&position=" + ""+ "&wage=" + 0);
}