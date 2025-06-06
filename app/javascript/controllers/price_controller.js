import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["startDate", "endDate", "currency", "totalBox"];

  update() {
    this.calculateTotal();
  }

  startDateTargetChanged() {
    this.calculateTotal();
  }

  endDateTargetChanged() {
    this.calculateTotal();
  }

  calculateTotal() {
    const start = this.startDateTarget.value;
    const end = this.endDateTarget.value;

    if (!start || !end) {
      this.totalBoxTarget.innerHTML = "<p class='fst-italic'>Total will appear after selecting valid start and end dates.</p>";
      return;
    }

    const startDate = new Date(start);
    const endDate = new Date(end);
    const nights = (endDate - startDate) / (1000 * 60 * 60 * 24);

    if (nights <= 0) {
      this.totalBoxTarget.innerHTML = "<p class='text-danger'>End date must be after start date.</p>";
      return;
    }

    const pricePerNight = parseFloat(this.data.get("price")) || 100; // fallback price
    const currency = this.currencyTarget.value;
    const conversions = { EUR: 1, USD: 1.1, GBP: 0.85 };
    const symbol = { EUR: "€", USD: "$", GBP: "£" }[currency] || "€";

    const total = nights * pricePerNight * conversions[currency];

    this.totalBoxTarget.innerHTML = `
      <p><strong>Price per night:</strong> ${symbol}${(pricePerNight * conversions[currency]).toFixed(2)}</p>
      <p><strong>Total for ${nights} nights:</strong> ${symbol}${total.toFixed(2)}</p>
    `;
  }
}
