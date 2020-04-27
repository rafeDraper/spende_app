import { Controller } from "stimulus"

export default class extends Controller {
  /* Toggle between showing and hiding the navigation menu links when the user clicks on the hamburger menu / bar icon */
  nav_extend() {
    var link = document.getElementById("mylinks");
    if (link.style.display === "block") {
      link.style.display = "none";
    } else {
      link.style.display = "block";
    }
  }
}