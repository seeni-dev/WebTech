var loginButton=document.getElementById("login");
var username=document.getElementById("username");
var password=document.getElementById("password");
var captchaText=document.getElementById("captchaText");
var captchaInput=document.getElementById("captcha");

//Enter Random Text in Captcha
var  getRandomCaptcha=function(){
        var captcha="";
        var possible = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
        for(let i=0;i<10;i++){
            captcha+=possible[Math.floor(Math.random()*possible.length)];
        }
        captchaText.textContent=captcha;
};
getRandomCaptcha();

loginButton.addEventListener("click",function(e){
    e.preventDefault();
    const today=new Date();
    const expDate=new Date();
    const exp=10;
    expDate.setDate(today.getDate()+exp);
    document.cookie="name="+username.value+"; expires="+expDate;
    console.log("Cookie set and its contents are  "+document.cookie)
});
