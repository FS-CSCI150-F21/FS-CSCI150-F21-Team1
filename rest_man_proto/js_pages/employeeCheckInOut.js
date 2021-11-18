function CheckIn() {
    var j = new XMLHttpRequest();
    j.onreadystatechange = function () {
    if (j.readyState == 4 && j.status == 200) {
      console.log(j.responseText);
      alert("Checked In");
      document.getElementById("CheckIn").hidden=true;
      document.getElementById("CheckOut").hidden=false;
    }
  };
  j.open('POST', '../php_pages/checkIn.php');
  j.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
  j.send("s=in");

}

function CheckOut() {
    var j = new XMLHttpRequest();
    j.onreadystatechange = function () {
    if (j.readyState == 4 && j.status == 200) {
      console.log(j.responseText);
      alert("Checked Out");
  document.getElementById("CheckIn").hidden=false;
  document.getElementById("CheckOut").hidden=true;
    }
  };
  j.open('POST', '../php_pages/checkIn.php');
  j.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
  j.send("s=out");
}