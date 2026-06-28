const minNumber = 1;
const maxNumber = 100;
const answer = Math.floor(Math.random() * (maxNumber - minNumber + 1)) + minNumber;

let attempts = 0;
let guess;

while (true) {
    guess = window.prompt(`Guess a number between ${minNumber} - ${maxNumber}`);
    guess = Number(guess);
    if (isNaN(guess)) {
        window.alert("please enter a valid number");
    }
    if (guess < minNumber || guess > maxNumber) {
        window.alert(`you'are out of range numbers (${minNumber} - ${maxNumber})`)
    }
    else {
        attempets++;
        if (guess > answer) {
            window.alert("TOO HIGH, TRY AGAIN!");
        }
        else if (guess < answer) {
            window.alert("TOO LOW, TRY AGAIN!");
        }
        else {
            window.alert(`Correct Answer, after ${attempts} attempts.`);
            break;
        }
    }
}