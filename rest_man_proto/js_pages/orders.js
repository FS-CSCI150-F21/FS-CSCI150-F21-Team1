
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
    status;
    //paymentTableDisplay;
    constructor(orderObj) {
        if (orderObj.items != null) {
            for (let i = 0; i < orderObj.items.length; i++) {
                this.items.push(new item(orderObj.items[i]));
            }
        }

        //build table body of items and table footer of subtotal 
        this.status = orderObj.status;
        this.orderID = orderObj.orderID;
        this.dinerTable = orderObj.dinerTable;
        this.creationTime = orderObj.created;
        this.lastModified = orderObj.last_modified;
        this.eRTime = orderObj.eRTime;
        this.paid = orderObj.paid;
        this.presentCurrentOrder();

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
        td.innerText = formatter.format(this.calculateSubtotal());
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
        return subtotal;
    }
    presentCurrentOrder() {


        //update order stats
        document.getElementById('orderNumber').innerText = this.orderID;
        let table = (this.dinerTable) ? this.dinerTable : 'To Go';
        document.getElementById('table').innerText = table;
        document.getElementById('orderStatus').innerText = this.status;
        document.getElementById('creationTime').innerText = this.creationTime;
        document.getElementById('lastModified').innerText = this.lastModified;

        //console.log(this);

        //delete leftover items table elements if they exist.  
        document.getElementById('itemsTableBody').remove();
        document.getElementById('itemsTableFooter').remove();

        //display list of ordered items (name, quantity, and price)
        let itemsTable = document.getElementById('itemsTable');
        itemsTable.appendChild(this.createTableBody());
        //display subtotal
        itemsTable.appendChild(this.createTableFooter());

        //different presentation based on order status.
        // Opened = payment, item increment and decrement.
        // !Opened = only estimated wait time.
        if (this.status != 'Opened') {


            //remove action buttons
            let actionButtons = document.getElementsByClassName('actionButton');
            //debug
            //console.log(actionButtons);
            //console.log(actionButtons[0]);
            while (actionButtons[0]) {
                actionButtons[0].remove();
                //console.log(actionButtons);
            }

            if (this.status == 'Kitchen') {

                //see if element already exists and remove to prevent duplicate
                let ul = document.getElementById('eRTUL');
                if (ul) ul.remove();
                
                //build estimated wait time table: 'Estimated Order Ready Time',
                ul = document.createElement('ul');
                ul.id = 'eRTUL';
                document.body.appendChild(ul);
                let li = document.createElement('li');
                ul.appendChild(li);
                li.innerText = 'Estimated Ready Time';
                li = document.createElement('li');
                li.innerText = new Date(this.eRTime).toLocaleTimeString();
                ul.appendChild(li);
                li = document.createElement('li');
                ul.appendChild(li);
                li.innerText = 'Countdown';

                // 'Countdown to Estimated Order Ready Time in Minutes'
                li = document.createElement('li');
                let minutes = (((new Date(this.eRTime)) - (new Date())) / 60000).toFixed(0);
                li.innerText = minutes + ' minutes';

                setInterval(function () {
                    let minutes = (((new Date(orderInstance.eRTime)) - (new Date())) / 60000).toFixed(0);
                    li.innerText = minutes + ' minutes';
                }, 15000);


                ul.appendChild(li);
            }

        }

        if (Number(this.paid)) {
            let paymentTable = document.getElementById('paymentTable');
            //this.paymentTableDisplay = paymentTable.style.display;
            //console.log(this.paymentTableDisplay);
            //paymentTable.style.display = 'none';

            if (paymentTable) paymentTable.remove();
        }

    }
    getStatus() {
        return this.status;
    }
    getId(){
        return this.orderID;
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
        td.onclick = function () {
            orderInstance.decrementItem(id);
            paymentInstance.updateChange();
        }

        //action buttons.
        td.className = 'actionButton';
        tr.appendChild(td);
        td = document.createElement('td');
        td.innerText = '+';
        td.onclick = function () {
            orderInstance.incrementItem(id);
            paymentInstance.updateChange();
        };
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


class payment {
    state = null;
    cC() {
        if (this.state == 'cc') return;
        this.state = 'cc';

        //clear out paymentTableBody
        let pTB = document.getElementById('paymentTableBody');
        while (pTB.children[0]) {
            pTB.children[0].remove();
        }


        //make paymentTableBody a CC form
        //let pTB = document.getElementById('paymentTableBody');
        let tr = document.createElement('tr');
        let td = document.createElement('td');
        let label = document.createElement('label');
        let input = document.createElement('input');
        input.type = 'text';
        input.id = 'ccName';
        input.placeholder = 'Name on Card';
        td.colSpan = 2;
        td.appendChild(input);
        tr.appendChild(td);
        pTB.appendChild(tr);

        td = document.createElement('td');
        tr = document.createElement('tr');
        input = document.createElement('input');
        input.type = 'tel';
        input.id = 'ccNum';
        input.placeholder = 'Card Number';
        td.colSpan = 2;
        td.appendChild(input);
        tr.appendChild(td);
        //tr.appendChild(input);
        pTB.appendChild(tr);

        //input = document.createElement('input');
        //input.type = 'date';
        td = document.createElement('td');
        tr = document.createElement('tr');
        input = document.createElement('input');
        input.type = 'text';
        input.placeholder = 'MM/YY'
        input.id = 'ccExpM';
        input.size = 3;
        td.appendChild(input);
        td.colSpan = 2;
        //tr.appendChild(td);

        //td = document.createElement('td');
        input = document.createElement('input');
        input.type = 'text';
        input.id = 'ccCSV';
        input.placeholder = 'CSV';
        input.size = 3;
        td.appendChild(input);
        tr.appendChild(td);
        pTB.appendChild(tr);

        document.getElementById('completeTransaction').hidden = false;
    }

    cash() {
        if (this.state == 'cash') return;
        this.state = 'cash';

        //clear out paymentTableBody
        let pTB = document.getElementById('paymentTableBody');
        while (pTB.children[0]) {
            pTB.children[0].remove();
        }

        //tendered input
        let tr = document.createElement('tr');
        let td = document.createElement('td');
        let input = document.createElement('input');
        input.type = 'text';
        input.id = 'cashTendered';
        input.placeholder = 'Tendered';
        td.colSpan = 2;
        input.oninput = function () { paymentInstance.updateChange(this.value); };
        this.TenderedDisplay = input;
        input.style.textAlign = 'right';
        td.appendChild(input);
        tr.appendChild(td);
        pTB.appendChild(tr);

        //change
        tr = document.createElement('tr');
        td = document.createElement('td');
        input = document.createElement('input');
        input.type = 'text';
        input.disabled = true;
        input.placeholder = 'Change';
        input.style.textAlign = 'right';
        this.changeDisplay = input;
        td.colSpan = 2;
        td.appendChild(input);
        tr.appendChild(td);
        pTB.appendChild(tr);

        document.getElementById('completeTransaction').hidden = false;
    }

    updateChange() {
        if (this.state != 'cash') return;
        this.changeDisplay.value = this.TenderedDisplay.value - orderInstance.calculateSubtotal();
    }

    completeTransaction() {
        //if customer uses this function, automatically send order to kitchen
        //if employee uses it, check to see that order has not already been sent
        // to kitchen.  send if not.  if(status==Opened) sendKitchen()
        //return estimated wait time if sent to kitchen
        //update 'paid' field to true
        // remove action buttons to increment or decrement items.
        // update status display to kitchen, or closed
        let httpRequest = new XMLHttpRequest();
        if (!httpRequest) {
            console.log('httpRequest instance failed');
            return;
        }
        httpRequest.onreadystatechange = function () {
            if (this.readyState == 4 && this.status == 200) {
                //estimated wait time
                console.log('completeTransaction() response text and JSON parse');
                console.log(this.responseText);
                load();
            }
        }
        httpRequest.open('POST', '../php_pages/ordersCompleteTransaction.php');
        httpRequest.setRequestHeader("content-type", "application/x-www-form-urlencoded");
        httpRequest.send('paid=true');
    }
}

var orderInstance;

var paymentInstance = new payment();


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
            //console.log(responseObj);
            if (!responseObj.privilegeLevel) {
                //client is not logged-in.  redirect to login.
                location.replace('account.html');
                return;
            }

            //client is logged in.  check which authorization he has
            if (responseObj.privilegeLevel == 0
                || responseObj.privilegeLevel == 1) {
                //employee+.  reveal privileged features
                let empPrivElmts = document.getElementsByClassName('employeePrivilege');
                for (let i = 0; i < empPrivElmts.length; i++) {
                    empPrivElmts[i].style.visibility = 'visible';
                    //console.log(empPrivElmts[i]);
                }
            }
            else if (responseObj.privilegeLevel != 2) {
                //database has an error in a user's privlege level field
                console.log('Check database for correct privilege level format on '
                    + 'this user');
            }

            //create order object
            orderInstance = new order(responseObj.order);
            //console.log(responseObj);

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



function kitchen() {
    //implemt another feature at some point:
    //hide 'Send to Kitchen' button when it isn't applicable (status!='Opened').

    if (orderInstance.getStatus() != 'Opened') return;

    let httpRequest = new XMLHttpRequest();
    if (!httpRequest) {
        console.log("Failed to make httpRequest instance");
        return false;
    }
    httpRequest.onreadystatechange = function () {
        if (this.readyState == 4 && this.status == 200) {
            console.log(this.responseText);
            load();
        }
    }
    httpRequest.open("GET", "../php_pages/ordersSendToKitchen.php");
    httpRequest.send();

}

function newOrder() {
    //alert('This will create a new order and load it into order form');


    let httpRequest = new XMLHttpRequest();
    if (!httpRequest) {
        console.log("Failed to make httpRequest instance");
        return false;
    }
    httpRequest.onreadystatechange = function () {
        if (this.readyState == 4 && this.status == 200) {
            console.log(this.responseText);
            window.location.reload();
        }
    }
    httpRequest.open("GET", "../php_pages/ordersNew.php");
    httpRequest.send();
}

function served(){
    //updates order status to 'Served'.
    //if order has already been paid, changes status to closed and
    // moves to closed_order_info

    console.log('hello');

    let httpRequest = new XMLHttpRequest();
    if (!httpRequest) {
        console.log("Failed to make httpRequest instance");
        return false;
    }
    httpRequest.onreadystatechange = function () {
        if (this.readyState == 4 && this.status == 200) {
            console.log('world');
            console.log(this.responseText);
            window.location.reload();
        }
    }
    httpRequest.open("POST", "../php_pages/orderPageMarkServed.php");
    httpRequest.setRequestHeader('content-type','application/x-www-form-urlencoded');
    httpRequest.send('orderId='+orderInstance.getId());
    

}

function openOrders(){
    window.location.replace('../html_pages/currentOrders.html');
}