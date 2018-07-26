var login=document.getElementById("login")
var register=document.getElementById("register")

if(document.cookie.length>5){
    let username=document.cookie.split("=")[1]
    login.textContent=username;
    register.textContent="Logout";
}