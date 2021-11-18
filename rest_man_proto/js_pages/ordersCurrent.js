//ordersCurrent.js

class viewTracker {
    view = 'server';// can be 'server' or 'kitchen'
    changeView(viewChar) {
        if (viewChar == this.view) return;
        else {
            this.view = viewChar;
            load();
            serverViewButton = document.getElementById('serverViewButton');
            kitchenViewButton = document.getElementById('kitchenViewButton');
            if (this.view == 'server') {
                serverViewButton.className = "currentViewButton";
                kitchenViewButton.className = "";
            }
            else if (this.view == 'kitchen') {
                serverViewButton.className = "";
                kitchenViewButton.className = "currentViewButton";
            }
        }
    }
    getView() {
        return this.view;
    }
}

let viewTrackerInstance = new viewTracker();

function load() {
    //alert('hello');
    //grab all records from open_order_info table and populate html table

    let view = viewTrackerInstance.getView();
    //console.log(view);

    let httpRequest = new XMLHttpRequest();
    if (!httpRequest) {
        console.log('httpRequest instance failed');
        return false;
    }
    httpRequest.onreadystatechange = function () {
        if (this.readyState == 4 && this.status == 200) {
            //console.log(this.responseText);
            let currentOrders = JSON.parse(this.responseText);
            presentView(currentOrders);
        }
    }
    httpRequest.open("GET", "../php_pages/ordersCurrent.php?view=" + view);
    httpRequest.send();

}

function presentView(currentOrders) {

    console.log(currentOrders);



    //remove previous view
    //server view
    let table = document.getElementById('ordersTable');
    if (table) table.remove();
    //kitchen view
    let kTables = document.getElementsByClassName('kitchenTable');
    while (kTables[0]) kTables[0].remove();


    //determine which view is used
    if (viewTrackerInstance.getView() == 'server') {
        //server view

        //build new table
        table = document.createElement('table');
        table.id = 'ordersTable';

        //build header
        let thead = document.createElement('thead');
        thead.className = 'tableHead';
        let th = document.createElement('th');

        th.innerText = 'Order #';
        thead.append(th);
        th = document.createElement('th');
        th.innerText = 'Table';
        thead.append(th);
        th = document.createElement('th');
        th.innerText = 'Status';
        thead.append(th);
        th = document.createElement('th');
        th.innerText = 'Created';
        thead.append(th);
        th = document.createElement('th');
        th.innerText = 'Paid';
        thead.append(th);

        table.appendChild(thead);

        //build body
        let tbody = document.createElement('tbody');
        for (let i = 0; i < currentOrders.length; i++) {
            let tr = document.createElement('tr');
            let td = document.createElement('td');

            td.innerText = currentOrders[i].order_id;
            tr.appendChild(td);

            td = document.createElement('td');
            td.innerText = (currentOrders[i].dinerTable) ? currentOrders[i].dinerTable : 'To Go';
            tr.appendChild(td);

            td = document.createElement('td');
            td.innerText = currentOrders[i].status;
            tr.appendChild(td);

            td = document.createElement('td');
            td.innerText = currentOrders[i].created;
            tr.appendChild(td);

            td = document.createElement('td');
            td.innerText = (Number(currentOrders[i].paid)) ? 'Yes' : 'No';
            tr.appendChild(td);


            tr.onclick = function () { orderPage(currentOrders[i].order_id) };
            tbody.appendChild(tr);


            table.appendChild(tbody);
            document.body.append(table);
        }



    }
    else if (viewTrackerInstance.getView() == 'kitchen') {
        //kitchen view
        //each order gets its own table.  order number will be caption
        //each item gets its own row with attributes: name, quantity, 
        // accumulated time, and action button [ready].

        table = document.createElement('table');
        table.id = 'ordersTable';

        //build header
        let thead = document.createElement('thead');
        thead.className = 'tableHead';
        let th = document.createElement('th');

        th.innerText = 'Name';
        th.className = 'nameColumn';
        thead.append(th);
        th = document.createElement('th');
        th.innerText = 'Elapsed Time (minutes)';
        thead.append(th);
        th = document.createElement('th');
        th.innerText = 'Completed';
        thead.append(th);

        table.appendChild(thead);

        //build table body
        let tbody = document.createElement('tbody');
        for (let i = 0; i < currentOrders.length; i++) {

            //order number as header of each set of order items
            th = document.createElement('th');
            th.innerText = 'Order ' + currentOrders[i].OrderId;
            //th.colSpan = 3;
            tr = document.createElement('tr');
            tr.appendChild(th);
            tbody.appendChild(tr);


            //build item rows
            let items = currentOrders[i].items;
            for (let j = 0; j < items.length; j++) {
                tr = document.createElement('tr');
                let td = document.createElement('td');

                //item name
                td.innerText = items[j].name;
                td.className = 'nameColumn';
                tr.appendChild(td);

                //Elapsed time
                td = document.createElement('td');
                td.innerText = ((new Date() - new Date(items[j].start))/60000).toFixed(0);
                tr.appendChild(td);

                //action button
                td = document.createElement('td');
                /*
                let checkBox = document.createElement('input');
                checkBox.type = 'checkBox';
                checkBox.onchange = function() {};
                td.appendChild(checkBox);
                */

                //completed count
                td.innerText = items[j].completedCount + '/' + items[j].qty;
                tr.appendChild(td);

                //item completion function
                tr.onclick = function(){
                    incrementItemCompleted(currentOrders[i].OrderId, items[j].id);
                }

                tbody.appendChild(tr);
            }
        }
        table.appendChild(tbody);
        document.body.appendChild(table);

    }
    else {
        console.log('something wrong with view tracker')
    }

}

function orderPage(orderNumber) {

    console.log(orderNumber);
    console.log(JSON.stringify(orderNumber));

    //set user's session order number, and send to order page

    let httpRequest = new XMLHttpRequest();
    if (!httpRequest) {
        console.log('httpRequest instance failed');
        return false;
    }
    httpRequest.onreadystatechange = function () {
        if (this.readyState == 4 && this.status == 200) {
            console.log(this.responseText);
            window.location.replace('../html_pages/orderPage.html');
        }
    }
    httpRequest.open("POST", "../php_pages/ordersCurrent.php");
    httpRequest.setRequestHeader('content-type', 'application/x-www-form-urlencoded');
    httpRequest.send('orderNumber=' + orderNumber);
}

function incrementItemCompleted(orderId, itemId){
    console.log(orderId,itemId);
    let httpRequest = new XMLHttpRequest();
    if (!httpRequest) {
        console.log('httpRequest instance failed');
        return false;
    }
    httpRequest.onreadystatechange = function () {
        if (this.readyState == 4 && this.status == 200) {
            console.log(this.responseText);
            load();
        }
    }
    httpRequest.open("POST", "../php_pages/ordersCurrent.php");
    httpRequest.setRequestHeader('content-type', 'application/x-www-form-urlencoded');
    httpRequest.send('orderId=' + orderId + '&itemId=' + itemId);
}