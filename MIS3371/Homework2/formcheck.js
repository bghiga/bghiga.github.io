window.addEventListener("DOMContentLoaded", () => {

  document.getElementById("today").textContent =
    new Date().toLocaleDateString();

  const today = new Date().toISOString().split("T")[0];
  document.getElementById("dob").setAttribute("max", today);
  const form = document.getElementById("registration");
  form.addEventListener("submit", (e) => {
    if (!validatePassword()) {
      e.preventDefault();
      alert("Please fix your password before submitting.");
    }
  });
    document.querySelector('input[type="reset"]').addEventListener("click", () => {
        document.getElementById("reviewArea").innerHTML = "";
    });
});

function updateHealth() {
  document.getElementById("healthValue").textContent =
    document.getElementById("health").value;
}
function updatePain() {
  document.getElementById("painValue").textContent =
    document.getElementById("pain").value;
}

function validatePassword() {
  const p1 = document.getElementById("pass").value;
  const p2 = document.getElementById("pass2").value;
  const user = document.getElementById("user").value.toLowerCase();
  const pattern =
    /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[!@#%^&*()_\-+=\\/><.,`~]).{8,30}$/;

  if (!pattern.test(p1)) {
    alert(
      "Password must contain uppercase, lowercase, number, and special character."
    );
    return false;
  }
  if (p1.toLowerCase().includes(user)) {
    alert("Password cannot contain your username.");
    return false;
  }
  if (p1 !== p2) {
    alert("Passwords do not match.");
    return false;
  }
  return true;
}

function reviewForm() {
  const errors = [];
  const pass1 = document.getElementById("pass").value;
  const pass2 = document.getElementById("pass2").value;
  const user = document.getElementById("user").value.toLowerCase();
  const pattern =
    /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[!@#%^&*()_\-+=\\/><.,`~]).{8,30}$/;

  if (!pattern.test(pass1)) {
    errors.push("Password must include uppercase, lowercase, number, and special character (8–30 chars).");
  }
  if (pass1.toLowerCase().includes(user)) {
    errors.push("Password cannot include your username.");
  }
  if (pass1 !== pass2) {
    errors.push("Passwords do not match.");
  }
  const dobVal = document.getElementById("dob").value;
  if (dobVal) {
    const date = new Date(dobVal);
    const today = new Date();
    const oldest = new Date();
    oldest.setFullYear(today.getFullYear() - 120);
    if (date > today) errors.push("Date of birth cannot be in the future.");
    if (date < oldest)
      errors.push("Date of birth cannot be earlier than 120 years ago.");
  }

  const fname = document.getElementById("fname").value;
  const mi = document.getElementById("mi").value;
  const lname = document.getElementById("lname").value;
  const dob = dobVal;
  const email = document.getElementById("email").value;
  const phone = document.getElementById("phone").value;
  const addr1 = document.getElementById("addr1").value;
  const addr2 = document.getElementById("addr2").value;
  const city = document.getElementById("city").value;
  const state = document.getElementById("state").value;
  const zip = document.getElementById("zip").value;
  const pain = document.getElementById("painValue").textContent;
  const health = document.getElementById("healthValue").textContent;
  const userid = user;
  const notes = document.getElementById("notes").value;

  const gender = document.querySelector('input[name="sex"]:checked')?.value || "N/A";
  const vacc = document.querySelector('input[name="vacc"]:checked')?.value || "N/A";
  const ins = document.querySelector('input[name="ins"]:checked')?.value || "N/A";

  const conditions = Array.from(
    document.querySelectorAll('input[name="cond"]:checked')
  )
    .map((c) => c.value)
    .join(",") || "None";

  const errorHtml = errors.length
    ? `<div style="border:1px solid red; background:#fee; padding:8px; margin-bottom:10px;">
        <strong>Please fix the following before submitting:</strong>
        <ul>${errors.map((e) => `<li>${e}</li>`).join("")}</ul>
      </div>`
    : `<div style="border:1px solid green; background:#efe; padding:8px; margin-bottom:10px;">
        <strong>All checks passed so far.</strong>
      </div>`;

  document.getElementById("reviewArea").innerHTML = `
    ${errorHtml}
    <h2>PLEASE REVIEW THIS INFORMATION</h2>
    <p><strong>Name:</strong> ${fname} ${mi} ${lname}</p>
    <p><strong>Date of Birth:</strong> ${dob || "N/A"}</p>
    <p><strong>Gender:</strong> ${gender}</p>
    <p><strong>Email:</strong> ${email}</p>
    <p><strong>Phone:</strong> ${phone}</p>
    <p><strong>Address:</strong><br>
       ${addr1}${addr2 ? "<br>" + addr2 : ""}<br>
       ${city}, ${state} ${zip}</p>
    <p><strong>Medical Conditions:</strong> ${conditions}</p>
    <p><strong>Vaccinated:</strong> ${vacc}</p>
    <p><strong>Insurance:</strong> ${ins}</p>
    <p><strong>Health Rating:</strong> ${health}/10</p>
    <p><strong>Pain Level:</strong> ${pain}/10</p>
    <p><strong>Additional Notes:</strong> ${notes || "None"}</p>
    <p><strong>User ID:</strong> ${userid}</p>
  `;
}
