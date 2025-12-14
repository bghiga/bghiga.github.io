const toggle = document.querySelector(".navToggle");
const nav = document.querySelector("#nav");
if (toggle && nav) {
  toggle.addEventListener("click", () => {
    const isOpen = nav.classList.toggle("open");
    toggle.setAttribute("aria-expanded", String(isOpen));
  });
}
const year = document.querySelector("#year");
if (year) year.textContent = new Date().getFullYear();
