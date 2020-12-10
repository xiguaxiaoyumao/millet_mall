var scanLoginDom = document.getElementById("scan-login");
var idLoginDom = document.getElementById("id-login");
var idLoginBox = document.getElementById("id-login-box");
var scanLoginBox = document.getElementById("scan-login-box");

function scan_login() {
    scanLoginDom.style.color = "#f56600";
    idLoginDom.style.color = "black";
    idLoginBox.style.visibility = "hidden";
    scanLoginBox.style.visibility = "visible";

}

function id_login() {
    scanLoginDom.style.color = "black";
    idLoginDom.style.color = "#f56600";
    idLoginBox.style.visibility = "visible";
    scanLoginBox.style.visibility = "hidden";
}

function to_index() {
    location.href = "index.jsp";
}