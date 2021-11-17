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
    //track where user is in menu so editor can open correct area
    editorInstance.setCurLoc('m');

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

    //remove previous subcategories and their items
    let subcatTbls = document.getElementsByClassName('subcategory');
    while (subcatTbls[0]) {
        subcatTbls[0].remove();
    }
    let subcatEditTbls = document.getElementsByClassName('subcategoryEdit');
    while (subcatEditTbls[0]) subcatEditTbls[0].remove();

    //request category records from database
    fetchCategory(i);
}

function fetchCategory(i) {
    editorInstance.setCurLoc(i);

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

    console.log(subcatsArr);

    if (editorInstance.getState()) {
        //console.log('hi');
        //go through each subcategory
        for (let i = 0; i < subcatsArr.length; i++) {

            //object of array: {"name":"<subcategory>", "items":<array of items>}
            let subcat = subcatsArr[i];



            //subcategory
            let tbl = document.createElement('table');
            tbl.className = 'subcategoryEdit';

            let subcatTr = document.createElement('tr');
            let th = document.createElement('th');

            th.innerText = 'Subcategory:';
            th.id = 'subcategoryTitle';
            subcatTr.appendChild(th);

            let subcatInput = document.createElement('input');
            th = document.createElement('th');
            subcatInput.type = 'text';
            subcatInput.value = subcat["name"];
            subcatInput.id = 'subcategory' + subcat['subcatID'] + 'NameInput';
            th.appendChild(subcatInput);
            subcatTr.appendChild(th);

            //save button
            let saveButton = document.createElement('input');
            th = document.createElement('th');
            saveButton.type = 'button';
            saveButton.value = 'Save';
            saveButton.onclick = function () { saveSubcategory(subcat['subcatID']) };
            th.appendChild(saveButton)
            subcatTr.appendChild(th);

            tbl.appendChild(subcatTr);


            //thead contains column headers.  hidden in css.
            let thead = document.createElement('thead');
            let tr = document.createElement('tr');
            th = document.createElement('th');

            thead.appendChild(subcatTr);

            th.innerText = "Name";
            tr.appendChild(th);
            th = document.createElement('th');
            th.innerText = "Description";
            tr.appendChild(th);  //consider id cell, too
            th = document.createElement('th');
            th.innerText = "Price";
            tr.appendChild(th);
            th = document.createElement('th');
            th.innerText = "Available";
            tr.appendChild(th);


            thead.appendChild(tr);
            tbl.appendChild(thead);


            //array of items from subcategory
            let items = subcat["items"];

            let tbody = document.createElement('tbody');
            //tbody.id = 'subcategoryTBody' + subcat["subcatID"];
            //fill tbody with items
            for (let j = 0; j < items.length; j++) {
                //let itemTbl = document.createElement('table');
                tr = document.createElement('tr');
                tr.className = 'subcategory' + subcat["subcatID"];
                tr.id = 'itemID' + items[j]['id'];

                //item name
                let td = document.createElement('td');
                let input = document.createElement('input');
                input.type = 'text';
                input.value = items[j]['name'];
                //input.id = 'itemID' + items[j]['id'];
                //input.className = 'subcategory' + subcat['subcatID'] + 'ItemName';
                td.appendChild(input);
                tr.appendChild(td);

                //item description
                td = document.createElement('td');
                input = document.createElement('textarea');
                //input.type = 'textarea';
                input.value = items[j]['description'];
                td.appendChild(input);
                tr.appendChild(td);

                //item price
                td = document.createElement('td');
                input = document.createElement('input');
                input.type = 'text';
                input.value = items[j]['price'];
                input.size = 1;
                td.appendChild(input);
                tr.appendChild(td);


                //availability check box
                td = document.createElement('td');
                let availableCheckBox = document.createElement('input');
                availableCheckBox.type = 'checkbox';
                availableCheckBox.id = 'availableCheckBox' + i;
                availableCheckBox.checked = (Number(items[j]['available'])) ? true : false;
                availableCheckBox.className = 'editField';
                td.appendChild(availableCheckBox);
                tr.appendChild(td);

                tbody.appendChild(tr);

            }

            //add this subcategory's table to document
            tbl.appendChild(tbody);
            document.body.appendChild(tbl);

            //rinse & repeat
        }
    }
    else {
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

                //check to see if item should be presented or not based on
                // availability attribute.
                if (Number(items[j]['available'])) {
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
            }

            //add this subcategory's table to document
            tbl.appendChild(tbody);
            document.body.appendChild(tbl);

            //rinse & repeat
        }
    }

}

function editMode() {
    editorInstance.changeState();
    let button = document.getElementById('editModeButton');
    button.value = (editorInstance.getState()) ? 'Switch to View Mode' : 'Switch to Edit Mode';
    let marquee = document.getElementById('editModeLabel');
    marquee.innerText = (editorInstance.getState()) ? 'Currently in Edit Mode' : 'Currently in View Mode';
    //console.log(editorInstance.getState());
    //either recreate table with edit, cancel, and save buttons, or dynamically 
    // add them to current table.
    if (editorInstance.getCurLoc() == 'm') {
        mainMenu();
    }
    else {
        //console.log(editorInstance.getCurLoc());
        catChange(editorInstance.getCurLoc());
    }
}

class editor {
    state = 0;//2 states: off and on; 0 and 1, respectively.
    currentLocation = 'm'; //m for main menu; 0...* for subcategories
    constructor() {

    }
    getState() {
        return this.state;
    }
    changeState() {
        this.state = 1 - this.state;
    }
    getCurLoc() {
        return this.currentLocation;
    }
    setCurLoc(val) {
        this.currentLocation = val;
    }
}

editorInstance = new editor();

function saveCategory(index, categoryId) {
    //alert('Saved (still need to implement)'); 
    //console.log(index + '; ' + categoryId);

    //get values
    let name = document.getElementById('nameInput' + index).value;
    let img = document.getElementById('imgInput' + index).value;
    let available = document.getElementById('availableCheckBox' + index).checked;

    let updateObj = { "id": categoryId, "name": name, "img": img, "available": available };
    //console.log(updateObj);
    let updateStr = JSON.stringify(updateObj);
    //console.log(updateStr);

    let httpRequest = new XMLHttpRequest();
    if (!httpRequest) {
        console.log('Failed to create instance of XMLHttpRequest');
        return false;
    }
    httpRequest.onreadystatechange = function () {
        if (this.readyState == 4 && this.status == 200) {
            //console.log(this.responseText);
            //redisplay menu.  this acts as a confirmation of the database save
            // because the values will be taken from there again to rebuild the page.
            mainMenu();
        }
    }
    httpRequest.open("POST", "../php_pages/menuEditor.php");
    httpRequest.setRequestHeader("content-type", "application/x-www-form-urlencoded");
    httpRequest.send("categoryUpdate=" + updateStr);
}

function saveSubcategory(subcategoryID) {
    //console.log(subcategoryID);

    //get subcategory name, 
    // and then inputted name, description, and price of each item within

    let subcategoryNameID = 'subcategory' + subcategoryID + 'NameInput'
    let subcategoryName = document.getElementById(subcategoryNameID).value;

    let subcat = new subcategory(subcategoryName, subcategoryID);

    let items = document.getElementsByClassName('subcategory' + subcategoryID);

    for (let i = 0; i < items.length; i++) {
        let itemID = items[i].id.substr(6);
        let tds = items[i].children;
        let nameTd = tds[0];
        let itemNewName = nameTd.firstChild.value;

        let descriptionTd = tds[1];
        let itemNewDescr = descriptionTd.firstChild.value;

        //console.log(itemNewName + ' ' + itemNewDescr);

        let priceTd = tds[2];
        let itemNewPrice = priceTd.firstChild.value;
        //console.log(itemNewPrice);

        let availTd = tds[3];
        let itemNewAvail = availTd.firstChild.checked;

        subcat.addItem(new item(itemID, itemNewName,
            itemNewDescr, itemNewPrice, itemNewAvail));
    }


    let updateStr = JSON.stringify(subcat);
    //console.log(updateStr);


    //send updated information to server for save
    let httpRequest = new XMLHttpRequest();
    if (!httpRequest) {
        console.log('Failed to create instance of XMLHttpRequest');
        return false;
    }
    httpRequest.onreadystatechange = function () {
        if (this.readyState == 4 && this.status == 200) {
            //console.log(this.responseText);
            //redisplay category.  this acts as a confirmation of the database save
            // because the values will be taken from there again to rebuild the page.
            //how to determine which category we're in
            catChange(editorInstance.getCurLoc());
        }
    }
    httpRequest.open("POST", "../php_pages/menuEditor.php");
    httpRequest.setRequestHeader("content-type", "application/x-www-form-urlencoded");
    httpRequest.send("subcategoryUpdate=" + encodeURIComponent(updateStr));
}


class subcategory {
    items = [];
    constructor(newName, id) {
        this.newName = newName;
        this.id = id;
    }
    addItem(itemObj) {
        this.items.push(itemObj);
        //console.log(this.items);
    }
}

class item {
    constructor(id, newName, newDescr, newPrice, newAvail) {
        this.id = id;
        this.newName = newName;
        this.newDescr = newDescr;
        this.newPrice = newPrice;
        this.newAvail = newAvail;
    }
}