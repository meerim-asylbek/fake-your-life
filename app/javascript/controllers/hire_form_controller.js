import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="hire-form"
export default class extends Controller {
  static targets = [ 'startDate', 'endDate', 'fullPrice', 'dailyPrice', 'totalForm']

  connect() {
    this.priceUpdate()
  }

  minEnd() {
    console.log("minEnd")
    const addMinDate = this.startDateTarget.value
    this.endDateTarget.setAttribute("min", addMinDate)
    this.priceUpdate()
  }

  totalDays() {
    this.priceUpdate()
  };

  startDate() {
    return Date.parse(this.startDateTarget.value);
  }

  endDate() {
    return Date.parse(this.endDateTarget.value);
  }

  fullPrice() {
    const one_day = 1000*60*60*24;
    const date = Math.round(Math.abs((this.startDate() - this.endDate())/(one_day))) + 1
    const price = this.dailyPriceTarget.innerText
    const total_price = price * date
    this.fullPriceTarget.innerText = total_price
    this.totalFormTarget.value = total_price
  }

  priceUpdate() {
   if (this.startDateTarget.value && this.endDateTarget.value) {
    this.fullPrice()  
    } else {
    this.fullPriceTarget.innerText = 0
    }
  }
}
