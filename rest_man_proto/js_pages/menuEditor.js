//manager will use his portal to access menuEditor.
//this will set a variable in session() that changes this file to editor mode.

//implement drag and drop of items to change their appearance order.
//https://www.w3schools.com/html/html5_draganddrop.asp

//implement change of text and background colors.  <input type='color'>

//privilege level.  0: manager; 1: employee; 2: customer; 3: guest (default)
var privLevel = 3;


function load() {
    //checkUser();
    mainMenu();
}

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

            //remove previous menu if it exists, in order to rebuild it
            if (catTblBod != null) {
                document.getElementById('catTblBod').remove();
            }

            //create category table's body element
            //and append to table
            catTblBod = document.createElement('tbody');
            catTblBod.id = 'catTblBod';
            let catTbl = document.getElementById('catTbl');
            catTbl.appendChild(catTblBod);

            if (editorInstance.getState()) {
                //edit mode
                for (let i = 0; i < responseObj.length; i++) {
                    //insert save button, and make category name cell a
                    // text input
                    // file upload for image.  on save, new image replaces old
                    //checkbox for available or not

                    //table row
                    let tr = document.createElement('tr');
                    tr.className = 'tableRow'; //make edit specific class?

                    let td = document.createElement('td');

                    //category name as text-input
                    let labelCategoryName = document.createElement('label');
                    labelCategoryName.htmlFor = 'nameInput' + i;
                    labelCategoryName.innerText = 'Category Name';
                    labelCategoryName.className = 'editField';
                    td.appendChild(labelCategoryName);
                    let nameInput = document.createElement('input');
                    nameInput.type = 'text';
                    nameInput.size = 10;
                    nameInput.placeholder = responseObj[i][0];
                    nameInput.value = responseObj[i][0];
                    nameInput.className = 'editField';
                    nameInput.id = 'nameInput' + i;
                    td.appendChild(nameInput);

                    //image input
                    let labelFileUpload = document.createElement('label');
                    labelFileUpload.htmlFor = 'imgInput' + i;
                    labelFileUpload.innerText = 'Upload Image File';
                    labelFileUpload.className = 'editField';
                    td.appendChild(labelFileUpload);

                    let imgInput = document.createElement('input');
                    imgInput.type = 'file';
                    imgInput.id = 'imgInput' + i;
                    imgInput.accept = 'image/*';
                    imgInput.className = 'editField';
                    //imgInput.value = "ted.png"; //responseObj[i][3];

                    td.appendChild(imgInput);

                    //availability check box
                    let availableLabel = document.createElement('label');
                    availableLabel.htmlFor = 'availableCheckBox' + i;
                    availableLabel.innerText = 'Available';
                    availableLabel.className = 'editField';
                    let availableCheckBox = document.createElement('input');
                    availableCheckBox.type = 'checkbox';
                    availableCheckBox.id = 'availableCheckBox' + i;
                    availableCheckBox.checked = (responseObj[i][2]) ? true : false;
                    availableCheckBox.className = 'editField';
                    td.appendChild(availableLabel);
                    td.appendChild(availableCheckBox);

                    //save cell (revert, too?)
                    let saveButton = document.createElement('input');
                    saveButton.type = 'button';
                    saveButton.value = 'Save';
                    saveButton.onclick = function () {
                        saveCategory(i, responseObj[i][1]);
                    };
                    saveButton.className = 'editField';
                    td.appendChild(saveButton);
                    td.className = 'editFieldCell';


                    tr.appendChild(td);

                    //image display
                    td = document.createElement('td');
                    let img = document.createElement('img');
                    img.src = "../images/menu/" + responseObj[i][3];
                    img.width = "350";
                    img.height = "300";
                    td.appendChild(img);
                    tr.appendChild(td);



                    //tr.className = 'tableRow';

                    //append row (category) to table
                    catTblBod.appendChild(tr);
                }
            }
            else {

                // view/functional mode
                for (let i = 0; i < responseObj.length; i++) {
                    //only populate category if marked as "available"
                    if (responseObj[i][2] == true) {

                        //table row
                        let tr = document.createElement('tr');
                        tr.onclick = function () { mainToSingleCategory(i); };
                        tr.className = 'tableRow';

                        //table row cell
                        let td = document.createElement('td');
                        //category name
                        td.innerText = responseObj[i][0];
                        td.className = 'catName';
                        td.id = 'catName' + i;
                        //td.onclick = function (){ makeEditable('catName'+i, responseObj[i][1]);};

                        //add category name table cell to table row element
                        tr.appendChild(td);

                        //new table cell element to house image.
                        td = document.createElement('td');
                        td.className = 'imgCell';
                        let img = document.createElement('img');
                        img.src = "../images/menu/" + responseObj[i][3];
                        img.width = "350";
                        img.height = "300";

                        //append image to table cell, table cell to table row,
                        //and table row to table body.
                        td.appendChild(img);
                        tr.appendChild(td);
                        catTblBod.appendChild(tr);
                    }
                }
            }
        }
    }
    httpRequest.open("GET", "../php_pages/menu.php?request=cats", true);
    httpRequest.send();
}

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
    //document.getElementById('h1Title').innerText = selectedCategoryText;
    //document.getElementById('title').innerText = 'Menu: ' + selectedCategoryText;

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
    //document.getElementById('h1Title').innerText = navCats[i].innerText;
    //document.getElementById('title').innerText = 'Menu: ' + navCats[i].innerText;

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

/*
//itemID is found in MySQL database.  itemType identifies which table to use:
// category, subcategory, item.
function makeEditable(elementID, itemID, itemType) {
    console.log('makeEditable');
    let ele = document.getElementById(elementID);
    ele.onclick = '';
    if (ele.className == 'catName') {
        //replace inner text with a text input field, a cancel button, and a
        // save button.
        let text = ele.innerText;
        ele.innerText = '';
        let textInput = document.createElement('input');
        textInput.type = 'text';
        textInput.value = text;
        //textInput.placeholder = text;
        textInput.size = 5;
        ele.appendChild(textInput);
        let cancelButton = document.createElement('input');
        cancelButton.type = 'button';
        cancelButton.value = 'Cancel';
        cancelButton.onclick = function () { cancel(elementID, text, itemID, itemType); };
        ele.appendChild(cancelButton);
        let saveButton = document.createElement('input');
        saveButton.type = 'button';
        saveButton.value = 'Save';
        saveButton.onclick = function () { alert('save'); };
        ele.appendChild(saveButton);
    }
}
*/

/*
function cancel(elementID, originalText, itemID, itemType) {
    console.log('test');
    let ele = document.getElementById(elementID);
    ele.innerText = originalText;
    //ele.onclick = function(){makeEditable(elementID,itemID,itemType);};
    ele.onclick = function () { alert('hey'); };

}
*/

function editMode() {
    editorInstance.changeState();
    let button = document.getElementById('editModeButton');
    button.value = (editorInstance.getState()) ? 'Switch to View Mode' : 'Switch to Edit Mode';
    //either recreate table with edit, cancel, and save buttons, or dynamically 
    // add them to current table.
    mainMenu();
}

class editor {
    state = 0;//2 states: off and on; 0 and 1, respectively.
    constructor() {

    }
    getState() {
        return this.state;
    }
    changeState() {
        this.state = 1 - this.state;
    }
}

editorInstance = new editor();

function saveCategory(index, categoryId) {
    //alert('Saved (still need to implement)'); 
    console.log(index + '; ' + categoryId);

    //get values
    let name = document.getElementById('nameInput' + index).value;
    let img = document.getElementById('imgInput' + index).value;
    let available = document.getElementById('availableCheckBox' + index).checked;

    let updateObj = { "id": categoryId, "name": name, "img": img, "available": available };
    console.log(updateObj);
    let updateStr = JSON.stringify(updateObj);
    console.log(updateStr);

    let httpRequest = new XMLHttpRequest();
    if (!httpRequest) {
        console.log('Failed to create instance of XMLHttpRequest');
        return false;
    }
    httpRequest.onreadystatechange = function () {
        if (this.readyState == 4 && this.status == 200) {
            console.log(this.responseText);
            //redisplay menu.  this acts as a confirmation of the database save
            // because the values will be taken from there again to rebuild the page.
            mainMenu();
        }
    }
    httpRequest.open("POST","../php_pages/menuEditor.php");
    httpRequest.setRequestHeader("content-type", "application/x-www-form-urlencoded");
    httpRequest.send("categoryUpdate=" + updateStr);


}