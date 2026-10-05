import { calculateTotal, renderExpenses } from "./budget.js";

let expenses = [];

const form = document.getElementById("expenseForm");
const descriptionInput = document.getElementById("description");
const amountInput = document.getElementById("amount");
const categoryInput = document.getElementById("category");
const expenseList = document.getElementById("expenseList");
const totalDisplay = document.getElementById("total");

form.addEventListener("submit", function (event) {
    event.preventDefault();

    const description = descriptionInput.value.trim();
    const amount = Number(amountInput.value);
    const category = categoryInput.value;

    if (!description || amount <= 0 || !category) {
        alert("Please enter valid expense details.");
        return;
    }

    expenses.push({
        description,
        amount,
        category
    });

    renderExpenses(expenses, expenseList);

    const total = calculateTotal(expenses);
    totalDisplay.textContent = `KSh ${total.toFixed(2)}`;

    form.reset();
});
