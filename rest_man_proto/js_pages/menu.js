/*
menu.js requests information from menu.php in order to present appropriate
food items on menu.html
*/

/*
changed logic from deletion of main categories menu to hide and show.
*/


//used on load to show the main categories of the menu.
//this data is grabbed from the mysql database.  see menu.php file.
function categories() {

    let httpRequest = new XMLHttpRequest();
    httpRequest.onreadystatechange = function () {
        if (this.readyState == 4 && this.status == 200) {
            let responseObj = JSON.parse(httpRequest.responseText);
            let catBod = document.getElementById('catTblBod');
            for (let i = 0; i < responseObj.length; i++) {
                //only populate category if marked as "available"
                if (responseObj[i][2] == true) {

                    //table row
                    let tr = document.createElement('tr');
                    tr.onclick = function () { firstCategoryChange(i) };

                    //table row cell
                    let td = document.createElement('td');
                    td.innerText = responseObj[i][0];
                    td.className = 'catName';

                    /*
                    //may not need "odd vs even" anymore.  was for css.
                    colorClass = (i % 2) ? "odd" : "even";
                    td.className = 'catName + ' + colorClass;
                    */

                    //add category name table cell to table row element
                    tr.appendChild(td);

                    //new table cell element to house image.
                    td = document.createElement('td');
                    td.className = 'imgCell';
                    let img = document.createElement('img');
                    img.src = "../images/menu/" + responseObj[i][3];
                    img.width = "350";
                    img.height = "300";

                    //smaller sizes like these could be used for menuEditor
                    //img.width = "50";
                    //img.height = "50";

                    //append image to table cell, table cell to table row,
                    //and table row to table body.
                    td.appendChild(img);
                    tr.appendChild(td);
                    catBod.appendChild(tr);
                }
            }
        }
    }
    httpRequest.open("GET", "../php_pages/menu.php?request=cats", true);
    httpRequest.send();
}

function menu(){

    //delete nav bar and subcategory tables if exist
    if(nav = document.getElementById('navBar')){
        nav.remove();
        let subcatTbls = document.getElementsByClassName("subcategory");
        while(subcatTbls[0]) subcatTbls[0].remove();
    }

    document.getElementById('catTbl').style.display = "";

}


//called by any category (a table row) of the initial page layout.
//never used afterwards
//loads items of clicked category
function firstCategoryChange(i) {

    let nav = document.createElement('nav');
    nav.id = 'navBar';
    let catNames = document.getElementsByClassName('catName');

    let ul = document.createElement('ul');
    let li = document.createElement('li');
    li.innerText = "Menu";
    li.onclick = function(){menu()};
    ul.appendChild(li);
    for (let i = 0; i < catNames.length; i++) {
        li = document.createElement('li');
        li.innerText = catNames[i].innerText;
        li.onclick = function () { catChange(i) };
        ul.appendChild(li);
    }

    //alert(ul.children[i].innerText);
    ul.children[i+1].id = 'selectedNavItem';
    let selectedCategoryText = ul.children[i+1].innerText;
    document.getElementById('h1Title').innerText = selectedCategoryText;
    document.getElementById('title').innerText = 'Menu: ' + selectedCategoryText;

    //append unordered list to navigation bar, and nav bar to document body
    nav.appendChild(ul)
    document.body.appendChild(nav);

    //remove categories table
    document.getElementById('catTbl').style.display = "none";
    //document.getElementById('catTbl').remove();

    //access database through php page to get selected category's information
    let httpRequest = new XMLHttpRequest();
    if (!httpRequest) {
        alert('Cannot create an XMLHTTP instance');
        return false;
    }
    httpRequest.onreadystatechange = function () {
        if (this.readyState == 4 && this.status == 200) {
            if (httpRequest.responseText) {
                categoryDisplay(httpRequest.responseText, i);
            }

        }
    }
    httpRequest.open("GET", "../php_pages/menu.php?request=" + i, true);
    httpRequest.send();
}
function catChange(i) {
    let subcatTbls = document.getElementsByClassName('subcategory');
    while (subcatTbls[0]) {
        subcatTbls[0].remove();
    }

    //might package this in another function.  redundant.
    let httpRequest = new XMLHttpRequest();
    if (!httpRequest) {
        alert('Cannot create XMLHttpRequest instance');
        return false;
    }
    httpRequest.onreadystatechange = function () {
        if (this.readyState == 4 && this.status == 200) {
            categoryDisplay(httpRequest.responseText, i);
        }
    }
    httpRequest.open("GET", "../php_pages/menu.php?request=" + i);
    httpRequest.send();
}

function categoryDisplay(jsonStr, catIndex) {

    //remove previous category's information, if it exists.
    let subcatTbls = document.getElementsByClassName('subcategory');
    while (subcatTbls[0]) {
        subcatTbls[0].remove();
    }

    //array of 2-element objects: "name":"<subcategory>" and "items":<array>
    let subcatsArr = JSON.parse(jsonStr);

    //go through each subcategory
    for (let i = 0; i < subcatsArr.length; i++) {

        //object of array
        //"subcategory" and "items"
        let subcat = subcatsArr[i];

        //use table's caption element as title
        let tbl = document.createElement('table');
        tbl.className = 'subcategory';
        let caption = document.createElement('caption');
        caption.innerText = subcat["name"];
        tbl.appendChild(caption);


        //thead contains column headers.  will be hidden in css.
        let thead = document.createElement('thead');
        let tr = document.createElement('tr');
        let th = document.createElement('th');
        th.innerText = "Name";
        tr.appendChild(th);
        th = document.createElement('th');
        th.innerText = "Description";
        tr.appendChild(th);  //consider id cell, too
        th = document.createElement('th');
        th.innerText = "Price";
        tr.appendChild(th);
        thead.appendChild(tr);
        tbl.appendChild(thead);


        //array of items from subcategory
        let items = subcat["items"];

        let tbody = document.createElement('tbody');
        //fill tbody with items
        for (let j = 0; j < items.length; j++) {
            //let itemTbl = document.createElement('table');
            tr = document.createElement('tr');

            //item name
            let td = document.createElement('td');
            td.innerText = items[j]['name'];
            td.className = "itemName";
            tr.appendChild(td);

            //item description
            td = document.createElement('td');
            td.innerText = items[j]['description'];
            td.className = 'itemDescription';
            tr.appendChild(td);

            //item price
            td = document.createElement('td');
            td.innerText = items[j]['price'];
            td.className = 'itemPrice';
            tr.appendChild(td);

            tbody.appendChild(tr);
        }

        //add this subcategory's table to document
        tbl.appendChild(tbody);
        document.body.appendChild(tbl);

        //rinse & repeat
    }
}
