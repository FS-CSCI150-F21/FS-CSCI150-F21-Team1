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
    let httpRequest = new XMLHttpRequest();
    if (!httpRequest) {
        console.log('httpRequest instance failed');
        return false;
    }
    httpRequest.onreadystatechange = function () {
        if (this.readyState == 4 && this.status == 200) {
            let currentOrders = JSON.parse(this.responseText);
            presentView(currentOrders);
        }
    }
    httpRequest.open("GET", "../php_pages/ordersCurrent.php");
    httpRequest.send();

}

function presentView(currentOrders) {

    console.log(currentOrders);



    //remove previous view
    let table = document.getElementById('ordersTable');
    if (table) table.remove();

    //build new view
    table = document.createElement('table');
    table.id='ordersTable';
    let tbody = document.createElement('tbody');


    //determine which view is used
    if (viewTrackerInstance.getView() == 'server') {
        //server view

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
            td.innerText = (Number(currentOrders[i].paid))?'Yes':'No';
            tr.appendChild(td);


            tr.onclick = function() {orderPage(currentOrders[i].order_id)};
            tbody.appendChild(tr);
        }



    }
    else if (viewTrackerInstance.getView() == 'kitchen') {
        //kitchen view

    }
    else {
        console.log('something wrong with view tracker')
    }

    table.appendChild(tbody);
    document.body.append(table);
}

function orderPage(orderNumber){

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
            window.location.replace('../html_pages/orderPage.html')
        }
    }
    httpRequest.open("POST", "../php_pages/ordersCurrent.php");
    httpRequest.setRequestHeader('content-type','application/x-www-form-urlencoded');
    httpRequest.send('orderNumber='+orderNumber);
}