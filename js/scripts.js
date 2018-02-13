var userId = 1; /// hardcoded user id
function makeRequestGet(url, successCallBack, errorCallBack) {
    $.ajax({
        url: url,
        type: 'GET',
        contentType: false,
        processData: false,
        crossDomain: true,
        success: function(response) {
            //console.log(response);
            successCallBack(response);
            return false;
        },
        error: function(jqXHR, textStatus, errorMessage) {
            errorCallBack(jqXHR);
        },
    });
}


function showSignupNewplan() {
    return makeRequestGet('/php/Utils.php?info=allplans', function(response){
        var parseJ = JSON.parse(response);
        var table =  document.getElementById('new_signup');
        var count = 1;
        parseJ.forEach(function( obj) {
            var row = table.insertRow(count);
            var cell1 = row.insertCell(0)
            var cell2 = row.insertCell(1);
            var cell3 = row.insertCell(2)
            var cell4 = row.insertCell(3);
            var cell5 = row.insertCell(4)
            var cell6 = row.insertCell(5);

            cell1.innerHTML = '<img src="images/providers/'+obj.provider+'.png" alt="" height="60" width="60" srcset=""> </img>';
            cell2.innerText = obj.title;
            cell3.innerText = obj.name;
            cell4.innerHTML = obj.description;
            cell5.innerHTML = obj.price;
            cell6.innerHTML = '<button> Signup for plan </button>';
            cell6.onclick =  function () { doSignup(obj.planid) };

            count +=1;

        });
    },function (err) {
        document.write(err);
    });
}

function planinfo(planId){
    return makeRequestGet('/php/Utils.php?planid='+planId+'&info=plan', function(response){
        var parseJ = JSON.parse(response);
        var table = document.getElementById('plan_info');
        if(table.rows.length > 1){
            table.deleteRow(1);
        }
        var row = table.insertRow(1);
        var cell1 = row.insertCell(0)
        var cell2 = row.insertCell(1);
        var cell3 = row.insertCell(2)
        var cell4 = row.insertCell(3);

        cell1.innerHTML = '<img src="images/providers/'+parseJ.provider+'.png" alt="" height="60" width="60" srcset=""> </img>';
        cell2.innerText = parseJ.title;
        cell3.innerText = parseJ.name;
        cell4.innerHTML = parseJ.description;

        console.log(parseJ);
    },function (err) {
        document.write(err);
    });
}

function getUserPlans() { // refractor url
    return makeRequestGet('/php/User.php?userid='+userId+'&info=plans', function(response){
        var parseJ = JSON.parse(response);
        var table =  document.getElementById('user_plans');
        var count = 1;
        parseJ.forEach(function( obj) {
            var row = table.insertRow(count);
            var cell1 = row.insertCell(0)
            var cell2 = row.insertCell(1);

            cell1.innerHTML = obj.signup_title;
            cell2.innerHTML = '<button>info</button>'
            cell2.onclick = function () { planinfo(obj.internet_plan_id) };

            count +=1;

        });
    },function (err) {
        document.write(err);
    });
}

function doSignup(planid) { // refractor url
    makeRequestGet('/php/User.php?userid='+userId+'&planid='+planid+'&action=signup_plan', function(response){
        alert(response)
        location.reload();
    },function (err) {
        document.write(err);
    });
}


function getUserData() {
    makeRequestGet('/php/User.php?userid='+userId+'&info=userdata', function(response){
        document.write(response[0]);
    },function (err) {
        document.write(err);
    });
}
