// How to accept user input

// 1. Easy Way: window prompt
// let username = window.prompt("What's your name");
// console.log(username);

// 2. Proffessional Way = HTML textnox

let username;

document.getElementById("MySubmit").onclick=function()
{
    username = document.getElementById("MyText").value;
    document.getElementById("MyH1").textContent=`Hello ${username}`;
    console.log(username);
};