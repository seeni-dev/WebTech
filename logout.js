var logout=function(){
    console.log("Current User "+document.cookie+" logged Out");
    document.cookie="name=";
}
logout();