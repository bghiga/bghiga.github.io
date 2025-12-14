const nav = document.getElementById("nav");
const toggle = document.querySelector(".navToggle");

function openNav() {
  nav.classList.add("open");
  toggle.setAttribute("aria-expanded", "true");
}

function closeNav() {
  nav.classList.remove("open");
  toggle.setAttribute("aria-expanded", "false");
}

if (nav && toggle) {
  toggle.addEventListener("click", (e) => {
    e.stopPropagation();
    nav.classList.contains("open") ? closeNav() : openNav();
  });

  // Close menu when clicking outside
  document.addEventListener("click", (e) => {
    if (!nav.classList.contains("open")) return;
    if (!nav.contains(e.target) && e.target !== toggle) {
      closeNav();
    }
  });

  // Close menu when clicking a link
  nav.querySelectorAll("a").forEach(link => {
    link.addEventListener("click", closeNav);
  });

  // Close on ESC key
  document.addEventListener("keydown", (e) => {
    if (e.key === "Escape") closeNav();
  });
}

// Auto-update footer year
const year = document.getElementById("year");
if (year) {
  year.textContent = new Date().getFullYear();
}
