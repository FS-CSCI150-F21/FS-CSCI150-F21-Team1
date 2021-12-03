function CheckIn() {
    var j = new XMLHttpRequest();
    var i="in";
    j.onreadystatechange = function () {
    if (j.readyState == 4 && j.status == 200) {
      console.log(j.responseText);
      
    }
  };
  j.open('GET', '../php_pages/checkIn.php');
  j.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
  j.send("status="+i);
  alert("Checked In");
  document.getElementById("CheckIn").hidden=true;
  document.getElementById("CheckOut").hidden=false;

}

function CheckOut() {
    var j = new XMLHttpRequest();
    var i="out";
    j.onreadystatechange = function () {
    if (j.readyState == 4 && j.status == 200) {
      console.log(j.responseText);
      
    }
  };
  j.open('GET', '../php_pages/checkIn.php');
  j.send("status="+i);
  alert("Checked Out");
  document.getElementById("CheckIn").hidden=false;
  document.getElementById("CheckOut").hidden=true;

}