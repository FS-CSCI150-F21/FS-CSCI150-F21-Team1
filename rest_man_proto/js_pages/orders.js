
//first verify user is logged-in.  if not, redirect them to another page, like menu,
// or account registration


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
            else if (responseObj.privilegeLevel == 2) {
                //customer is logged in.  retrieve order number if it exists.
                console.log('customer');

                if (responseObj.order) {
                    //fill in order object
                    orderInstance = new order(responseObj.order);

                    presentCurrentOrder();
                }
                else {
                    //create new order
                }

            }
            else if (responseObj.privilegeLevel == 0
                || responseObj.privilegeLevel == 1) {
                //employee or managaer is logged in.  retrieve order number
                // if it exists.  also reveal privileged features that show all
                // open orders
                console.log('employee or manager');

                if (responseObj.order) {
                    //fill in order obj
                    //orderInstance = new order(responseObj.order);

                    //reveal extra privileges

                    presentCurrentOrder(responseObj.order);
                }
                else {
                    presentOpenOrders();
                }

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

function presentCurrentOrder(dbOrderObj) {
    //console.log(dbOrderObj);
    orderInstance = new order(dbOrderObj.items);

    document.getElementById('orderNumber').innerText = dbOrderObj.orderID;
    document.getElementById('orderType').innerText = dbOrderObj.togo;
    document.getElementById('orderStatus').innerText = dbOrderObj.status;
    document.getElementById('creationTime').innerText = dbOrderObj.created;
    document.getElementById('action').innerText = 'n/a';

    //delete leftover items table if it's even there.  
    //probably could remove this code.
    document.getElementById('itemsTableBody').remove();
    /*
    for (let i = 0; i < orderInstance.getItemsCount(); i++) {
        let tr = document.createElement('tr');
        let td = document.createElement('td');
        td.innerText = 
    }
    */

    let itemsTable = document.getElementById('itemsTable');
    itemsTable.appendChild(orderInstance.createTableBody());
    itemsTable.appendChild(orderInstance.createTableFooter());

}

function presentOpenOrders() {

}

class order {
    items = [];
    constructor(itemsArr) {

        for (let i = 0; i < itemsArr.length; i++) {
            this.items.push(new item(itemsArr[i]));
        }
        console.log(this.items);
    }
    getItemsCount() {
        return this.items.length;
    }
    getItems() {
        return this.items;
    }
    createTableBody() {
        let tableBody = document.createElement('tbody');
        for (let i = 0; i < this.items.length; i++) {
            tableBody.appendChild(this.items[i].createRow());
        }
        return tableBody;
    }
    createTableFooter(){
        let subtotal = 0;
        for(let i =0;i<this.items.length;i++){
            subtotal+=this.items[i].getCost();
        }
        let tfoot = document.createElement('tfoot');
        let td = document.createElement('td');
        td.innerText = 'Subtotal';
        td.colSpan = "1";
        tfoot.appendChild(td);
        td = document.createElement('td');
        tfoot.appendChild(td);
        td = document.createElement('td');
        td.innerText = subtotal;
        tfoot.appendChild(td);
        return tfoot;
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
        let td = document.createElement('td');
        td.innerText = this.name;
        td.className = 'itemName';
        tr.appendChild(td);
        td = document.createElement('td');
        td.innerText = this.quantity;
        tr.appendChild(td);
        td = document.createElement('td');
        td.innerText = (this.price * this.quantity);
        tr.appendChild(td);
        return tr;
    }
    getCost(){
        return this.price * this.quantity;
    }
}