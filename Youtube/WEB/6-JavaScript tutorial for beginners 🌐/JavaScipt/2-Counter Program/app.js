const Btn_decrease = document.getElementById("Btn_decrease");
const Btn_reset = document.getElementById("Btn_reset");
const Btn_increase = document.getElementById("Btn_increase");
let CounterNumber = document.getElementById("CounterNumber");
let counter = 0;


Btn_decrease.onclick = function () {
    counter--;
    CounterNumber.textContent = counter;
}
Btn_reset.onclick = function () {
    counter = 0;
    CounterNumber.textContent = counter;
}
Btn_increase.onclick = function () {
    counter++;
    CounterNumber.textContent = counter;
}