
//first verify user is logged-in.  if not, redirect them to log-in page.
// if logged-in, get current order number.  if none, create order and assign
// number to user.  Update display stats.
// If order number, retrieve order item details and present.

var formatter = new Intl.NumberFormat('en-US', {
    style: 'currency', currency: 'USD',
});

class order {
    items = [];
    //itemsAss = {};
    //itemsAss2 = {};
    constructor(itemsArr) {
        if (itemsArr != null) {
            for (let i = 0; i < itemsArr.length; i++) {
                this.items.push(new item(itemsArr[i]));
            }
        }
    }
    createTableBody() {
        let tableBody = document.createElement('tbody');
        tableBody.id = 'itemsTableBody';
        for (let i = 0; i < this.items.length; i++) {
            tableBody.appendChild(this.items[i].createRow());
        }
        return tableBody;
    }
    createTableFooter() {
        let tfoot = document.createElement('tfoot');
        tfoot.id = 'itemsTableFooter';
        let td = document.createElement('td');
        td.innerText = 'Subtotal';
        td.colSpan = "1";
        tfoot.appendChild(td);
        td = document.createElement('td');
        tfoot.appendChild(td);
        td = document.createElement('td');
        td.innerText = this.calculateSubtotal();
        tfoot.appendChild(td);
        return tfoot;
    }
    decrementItem(id) {
        let updatedItems = {};
        for (let i = 0; i < this.items.length; i++) {
            updatedItems[this.items[i].getID()] = this.items[i].getQty();
        }
        if (updatedItems[id] == 1) {
            //item quantity will be zero.  remove.
            delete updatedItems[id];
        }
        else {
            //item quantity will be above zero.
            updatedItems[id]--;

        }
        updateDB(updatedItems);//update database
    }
    incrementItem(id) {
        //console.log(id);
        let updatedItems = {};
        for (let i = 0; i < this.items.length; i++) {
            updatedItems[this.items[i].getID()] = this.items[i].getQty();
        }
        updatedItems[id]++;
        updateDB(updatedItems);//update database
    }
    calculateSubtotal() {
        let subtotal = 0;
        for (let i = 0; i < this.items.length; i++) {
            subtotal += this.items[i].getCost();
        }
        return formatter.format(subtotal);
    }
}

class item {
    constructor(itemObj) {
        this.id = itemObj.id;
        this.quantity = itemObj.qty;
        this.price = itemObj.price;
        this.name = itemObj.name;
        this.category = itemObj.category;
    }
    createRow() {
        let tr = document.createElement('tr');
        //this.tr = tr;
        let td = document.createElement('td');
        td.innerText = this.name;
        td.className = 'itemName';
        tr.appendChild(td);
        td = document.createElement('td');
        td.innerText = this.quantity;
        //this.quantityDisplay = td;
        tr.appendChild(td);
        td = document.createElement('td');
        td.innerText = formatter.format(this.price * this.quantity);
        //this.priceDisplay = td;
        tr.appendChild(td);
        td = document.createElement('td');
        td.innerText = '-';
        let id = this.id;
        td.onclick = function () { orderInstance.decrementItem(id); }
        td.className = 'actionButton';
        tr.appendChild(td);
        td = document.createElement('td');
        td.innerText = '+';
        td.onclick = function () { orderInstance.incrementItem(id); };
        td.className = 'actionButton';
        tr.appendChild(td);
        return tr;
    }
    getCost() {
        return this.price * this.quantity;
    }
    getID() {
        return this.id;
    }
    getQty() {
        return this.quantity;
    }
}

var orderInstance;

function load() {
    //console.log('worked');
    let httpRequest = new XMLHttpRequest();
    if (!httpRequest) {
        console.log('Failed to create XMLHttpRequest Instance');
        return false;
    }
    httpRequest.onreadystatechange = function () {
        if (this.readyState == 4 && this.status == 200) {
            //response will be privilege level (number), or boolean false
            // for 'guest' (not logged-in client)
            let responseObj = JSON.parse(this.responseText);
            console.log(responseObj);
            if (!responseObj.privilegeLevel) {
                //client is not logged-in.  redirect to login.
                location.replace('account.html');
            }
            else if (responseObj.privilegeLevel >= 0
                && responseObj.privilegeLevel <= 2) {
                //treat all logged-in users as the same privilege level: customer.

                //create order object
                orderInstance = new order(responseObj.order.items);

                //build table body of items and table footer of subtotal 
                presentCurrentOrder(responseObj.order);
            }

            else {
                //database has an error in a user's privlege level field
                console.log('Check database for correct privilege level format on '
                    + 'this user');
            }
        }
    }
    httpRequest.open("GET", "../php_pages/orders.php");
    httpRequest.send();
}

function updateDB(itemsObj) {
    let httpRequest = new XMLHttpRequest();
    if (!httpRequest) {
        console.log("Failed to make httpRequest instance");
        return false;
    }
    httpRequest.onreadystatechange = function () {
        if (this.readyState == 4 && this.status == 200) {
            load();
        }
    }
    httpRequest.open("POST", "../php_pages/menuOrder.php");
    httpRequest.setRequestHeader("content-type",
        "application/x-www-form-urlencoded");
    httpRequest.send("order=" + JSON.stringify(itemsObj));
}

function presentCurrentOrder(dbOrderObj) {
    console.log(dbOrderObj);
    //update order stats
    document.getElementById('orderNumber').innerText = dbOrderObj.orderID;
    document.getElementById('orderType').innerText = (dbOrderObj.togo)?'To Go':'Dine In';
    document.getElementById('orderStatus').innerText = dbOrderObj.status;
    document.getElementById('creationTime').innerText = dbOrderObj.created;
    document.getElementById('lastModified').innerText = dbOrderObj.last_modified;

    //delete leftover items table elements if they exist.  
    document.getElementById('itemsTableBody').remove();
    document.getElementById('itemsTableFooter').remove();

    //display list of ordered items (name, quantity, and price)
    let itemsTable = document.getElementById('itemsTable');
    itemsTable.appendChild(orderInstance.createTableBody());
    //display subtotal
    itemsTable.appendChild(orderInstance.createTableFooter());
}