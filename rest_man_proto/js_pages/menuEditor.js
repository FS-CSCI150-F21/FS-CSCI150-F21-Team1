//manager will use his portal to access menuEditor.
//this will set a variable in session() that changes this file to editor mode.


//privilege level.  0: manager; 1: employee; 2: customer; 3: guest (default)
var privLevel = 3;

var orderInstance;

//used on load to show the main categories of the menu.
//this data is grabbed from the mysql database.  see menu.php file.
function mainMenu() {

    if (navBar = document.getElementById('navBar')) {
        //this is not first load of page.  came from single category view.
        //remove navbar, and single category's information.
        if (nav = document.getElementById('navBar')) {
            nav.remove();
            let subcatTbls = document.getElementsByClassName("subcategory");
            while (subcatTbls[0]) subcatTbls[0].remove();
        }
    }
    let httpRequest = new XMLHttpRequest();
    httpRequest.onreadystatechange = function () {
        if (this.readyState == 4 && this.status == 200) {
            let responseObj = JSON.parse(httpRequest.responseText);
            let catTblBod = document.getElementById('catTblBod');
            if (catTblBod == null) {
                //create category table's body element
                //and append to table
                catTblBod = document.createElement('tbody');
                catTblBod.id = 'catTblBod';
                let catTbl = document.getElementById('catTbl');
                catTbl.appendChild(catTblBod);
            }
            for (let i = 0; i < responseObj.length; i++) {
                //only populate category if marked as "available"
                if (responseObj[i][2] == true) {

                    //table row
                    let tr = document.createElement('tr');
                    tr.onclick = function () { mainToSingleCategory(i) };

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
                    catTblBod.appendChild(tr);
                }
            }
        }
    }
    httpRequest.open("GET", "../php_pages/menu.php?request=cats", true);
    httpRequest.send();

    //orderInstance = new order();
}

/*not used.  delete.
function singleCategoryToMain() {

    //delete nav bar and subcategory tables if exist... or hide?
    //nav bar should always exit at this point.  no need to check for it.
    if (nav = document.getElementById('navBar')) {
        nav.remove();
        let subcatTbls = document.getElementsByClassName("subcategory");
        while (subcatTbls[0]) subcatTbls[0].remove();
    }

    document.getElementById('catTbl').style.display = "";

}
*/


//called by any category (a table row) of the initial page layout.
//loads items of clicked category
function mainToSingleCategory(i) {

    //build nav bar
    nav = document.createElement('nav');
    nav.id = 'navBar';
    let catNames = document.getElementsByClassName('catName');
    let ul = document.createElement('ul');
    let li = document.createElement('li');
    li.innerText = "Menu";
    li.onclick = function () { mainMenu() };
    ul.appendChild(li);
    for (let i = 0; i < catNames.length; i++) {
        li = document.createElement('li');
        li.innerText = catNames[i].innerText;
        li.onclick = function () { catChange(i) };
        li.className = 'navCats';
        ul.appendChild(li);
    }
    //set selected category item so css can highlight
    let selectedNavItem = ul.children[i + 1]
    selectedNavItem.id = 'selectedNavItem';
    selectedNavItem.onclick = '';
    //page titles.
    let selectedCategoryText = ul.children[i + 1].innerText;
    document.getElementById('h1Title').innerText = selectedCategoryText;
    document.getElementById('title').innerText = 'Menu: ' + selectedCategoryText;

    //append unordered list to navigation bar, and nav bar to document body
    nav.appendChild(ul)
    document.body.appendChild(nav);

    //remove categories table body.  table is hidden otherwise.
    //document.getElementById('catTbl').style.display = "none";
    document.getElementById('catTblBod').remove();

    //request category records from database
    fetchCategory(i);
}
function catChange(i) {

    //switch nav bar's selected element through id change
    //need to know which category this represents
    let navCats = document.getElementsByClassName('navCats');
    let j = 0;
    //let selectedNavItem;
    while (navCats[j].id != 'selectedNavItem') { j++; }
    navCats[j].id = '';
    navCats[i].onclick = '';
    navCats[i].id = 'selectedNavItem';
    navCats[j].onclick = function () { catChange(j); }
    document.getElementById('h1Title').innerText = navCats[i].innerText;
    document.getElementById('title').innerText = 'Menu: ' + navCats[i].innerText;

    //remove previous subcategories and their items
    let subcatTbls = document.getElementsByClassName('subcategory');
    while (subcatTbls[0]) {
        subcatTbls[0].remove();
    }

    //request category records from database
    fetchCategory(i);
}

function fetchCategory(i) {
    //access database through php file to get selected category's information
    let httpRequest = new XMLHttpRequest();
    if (!httpRequest) {
        alert('Cannot create an XMLHTTP instance');
        return false;
    }
    httpRequest.onreadystatechange = function () {
        if (this.readyState == 4 && this.status == 200) {
            if (httpRequest.responseText) {
                categoryDisplay(httpRequest.responseText);
            }

        }
    }
    httpRequest.open("GET", "../php_pages/menu.php?request=" + i, true);
    httpRequest.send();
}

//build items tables
function categoryDisplay(jsonStr) {

    //array of 2-element objects: [{"name":"<subcategory>", "items":<array>}]
    let subcatsArr = JSON.parse(jsonStr);

    //go through each subcategory
    for (let i = 0; i < subcatsArr.length; i++) {

        //object of array: {"name":"<subcategory>", "items":<array of items>}
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
            //click or tap an item to add it to an order
            tr.onclick = function () {
                addToOrder(items[j]['id'],
                    items[j]['name'],
                    items[j]['price']);
            };

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

function load() {
    checkUserAndCurOrder();
    mainMenu();
}

function checkUserAndCurOrder() {
    //get username just to test php session()
    let httpRequest = new XMLHttpRequest();
    if (!httpRequest) {
        alert('Cannot create XMLHTTP instance');
        return false;
    }
    else {
        httpRequest.onreadystatechange = function () {
            if (this.readyState == 4 && this.status == 200) {
                //if a user is logged in, retrieve order status
                // and populate this.order object with database
                // information, or create new order
                let openOrder = httpRequest.responseText;
                //console.log(order);
                //console.log(JSON.parse(order));
                if (openOrder) {
                    //console.log(openOrder);
                    orderInstance = new order(JSON.parse(openOrder));
                }
            }
        }
        httpRequest.open("GET", "../php_pages/menuOrder.php", true);
        httpRequest.send();
    }
}

function addToOrder(id, name, price) {

    if (orderInstance) {
        //moved to class order
        //document.getElementById('orderTbl').className = 'active';


        //add item to order instance
        orderInstance.addItem(id, name, price)
        //update order display
        //updateOrderDisplay();

        //console.log(orderInstance);

        //store order in session variable

        updateOrderConsole(id, name);

        let httpRequest = new XMLHttpRequest();
        httpRequest.onreadystatechange = function () {
            if (this.readyState == 4 & this.status == 200) {
                console.log(httpRequest.responseText);
            }
        }
        httpRequest.open("POST", "../php_pages/menuOrder.php");
        httpRequest.setRequestHeader("content-type", "application/x-www-form-urlencoded");
        httpRequest.send('order=' + JSON.stringify(orderInstance.getItems()));
        //console.log(JSON.stringify(orderInstance.getItems()));

    }
    else {
        console.log('no user logged in.  no order instance.');
    }

}

function updateOrderConsole(id, name) {
    //console.log(orderInstance);
    //'Added 1 ' + orderInstance.items[itemId].name + 
    // '.  Current Quantity: ' + orderInstance.items[itemId].quantity

    /*
    document.getElementById('orderItemAdded').innerText =
        orderInstance.items[id].name;
    document.getElementById('orderItemQuantity').innerText =
        orderInstance.items[id].quantity;
    */
    document.getElementById('orderItemAdded').innerText = name;
    document.getElementById('orderItemQuantity').innerText =
        orderInstance.items[id];



}

class order {
    items = {};
    //items = new Array();
    constructor(orderObj) {
        //this.user = username;
        this.displayTblRef = document.getElementById('orderTbl');
        this.displayTblRef.className = 'active';

        //set items
        this.items = (orderObj.items == null)?{}:orderObj.items;
    }
    addItem(id, name, price) {
        if (this.items[id]) {
            //item quantity update, not new item
            //this.items[id].quantity++;
            this.items[id]++;
            /*
            //tell caller function this was an item quantity update, not new item
            return true;
            */
        }
        else {
            //new item
            //this.items[id] = { "name": name, "price": price, "quantity": 1 };
            this.items[id] = 1;

            //price is for a single item, is unaffected by quantity
            /*
            //tell caller function this was a new item
            return true;
            */
        }
    }
    getItems() {
        return this.items;
    }
}

function orderView(){
    location.assign("orderPage.html");
}