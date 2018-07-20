var loginButton=document.getElementById("login");
var username=document.getElementById("username");
var password=document.getElementById("password");
loginButton.addEventListener("click",function(e){
    e.preventDefault();
    const today=new Date();
    const expDate=new Date();
    const exp=10;
    expDate.setDate(today.getDate()+exp);
    document.cookie="name="+username.value+"; expires="+expDate;
    console.log("Cookie set and its contents are  "+document.cookie)
});
