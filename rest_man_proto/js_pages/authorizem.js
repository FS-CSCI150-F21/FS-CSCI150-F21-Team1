function authorize() {
    var j = new XMLHttpRequest();
    j.onreadystatechange = function () {
      if (j.readyState == 4 && j.status == 200) {
  
        //console.log(j.responseText);
        
        if(!j.responseText){
            var markup = document.documentElement;
            markup.style.visibility = "hidden";

            window.location = 'account.html';
        }
  
      }
    };
    j.open('GET', '../php_pages/authorizem.php');
    j.send();
  }