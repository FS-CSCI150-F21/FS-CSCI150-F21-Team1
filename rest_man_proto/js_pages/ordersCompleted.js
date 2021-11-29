
//get records from server
function load() {
    let httpRequest = new XMLHttpRequest();
    if (!httpRequest) {
        console.log('http request instance failed');
        return false;
    }

    httpRequest.onreadystatechange = function () {
        if (this.readyState == 4 && this.status == 200) {
            //console.log(this.responseText);
            presentOrders(JSON.parse(this.responseText));
        }
    }

    httpRequest.open('GET', '../php_pages/ordersCompleted.php');
    httpRequest.send();
}

function presentOrders(orders) {
    console.log(orders);
    let tbody = document.createElement('tbody');
    document.getElementById('table').appendChild(tbody);

    for (let i = 0; i < orders.length; i++) {
        let tr = document.createElement('tr');
        let td = document.createElement('td');
        td.innerText = orders[i].order_id;
        tr.appendChild(td);

        td = document.createElement('td');
        let tableNumber = (orders[i].dinerTable==0)?'To Go':orders[i].dinerTable;
        td.innerText = tableNumber;
        tr.appendChild(td);

        td = document.createElement('td');
        td.innerText = orders[i].username;
        tr.appendChild(td);

        td = document.createElement('td');
        td.innerText = orders[i].created;
        tr.appendChild(td);

        td = document.createElement('td');
        td.innerText = orders[i].finished;
        tr.appendChild(td);

        tr.onclick = function () { orderPage(orders[i].order_id) };

        tbody.appendChild(tr);
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
            window.location.assign('../html_pages/orderPage.html');
        }
    }
    httpRequest.open("POST", "../php_pages/ordersCurrent.php");
    httpRequest.setRequestHeader('content-type', 'application/x-www-form-urlencoded');
    httpRequest.send('orderNumber=' + orderNumber);
}