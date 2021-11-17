function fill_table(current_user) {

    var j_userinfo = JSON.stringify(current_user);
    var j = new XMLHttpRequest();
    j.onreadystatechange = function () {
      if (j.readyState == 4 && j.status == 200) {
      }
    };
    j.open('POST', '../php_pages/add_user.php');
    j.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    j.send("userinfo=" + j_userinfo);

}

function get_person(){
    var person;
    var j = new XMLHttpRequest();
    j.onreadystatechange = function () {
    if (j.readyState == 4 && j.status == 200) {
        
        person = JSON.parse(j.responseText);
        var fname = person.results[0].name.first;
        var lname = person.results[0].name.last;
        var user = person.results[0].login.username;
        var pass = person.results[0].login.password;
        var phone = person.results[0].phone;
        var email = person.results[0].email;
        var level = get_random_level();
        if(level < 2) {
            var position = get_random_position();
            var wage = get_random_wage();
        }
        const current_user = {
            f_name: fname, 
            l_name: lname,
            username: user,
            password: pass,
            level: level,
            phone: phone,
            email: email,
            position: position,
            wage: wage
        };
        fill_table(current_user);
    }
    };
    j.open('GET', 'https://randomuser.me/api/');
    j.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    j.send();
}

function get_random_wage(){
    var precision = 100; // 2 decimals
    var randomnum = Math.floor(Math.random() * (25 * precision - 1 * precision) + 1 * precision) / (1*precision);
    return randomnum;
}

function get_random_level(){
    return Math.floor(Math.random() * (2 + 1));
}

function get_random_position(){
    var positions = ["bartender","waiter", "cook", "janitor", "greeter"];
    var random = Math.floor(Math.random() * ((positions.length-1) + 1));
    return positions[random];
}

function fill(){
    for(var i =0; i< 500; i++){
        get_person();
    }
}