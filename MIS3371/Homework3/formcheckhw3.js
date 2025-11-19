window.addEventListener("DOMContentLoaded", () => {

  document.getElementById("today").textContent =
    new Date().toLocaleDateString();

  const today = new Date().toISOString().split("T")[0];
  document.getElementById("dob").setAttribute("max", today);
  document.getElementById("fname").addEventListener("blur", validateFirstName);
  document.getElementById("fname").addEventListener("input", validateFirstName);
  document.getElementById("lname").addEventListener("blur", validateLastName);
  document.getElementById("lname").addEventListener("input", validateLastName);
  document.getElementById("dob").addEventListener("blur", validateDob);
  document.getElementById("email").addEventListener("blur", validateEmail);
  document.getElementById("phone").addEventListener("blur", validatePhone);
  document.getElementById("zip").addEventListener("blur", validateZip);
  document.getElementById("user").addEventListener("blur", () => {
    validateUser();
    validatePasswordFields(); 
  });
  document.getElementById("pass").addEventListener("input", validatePasswordFields);
  document.getElementById("pass2").addEventListener("input", validatePasswordFields);
  document.getElementById("user").addEventListener("input", validatePasswordFields);
  document.getElementById("addr1").addEventListener("blur", validateAddr1);
  document.getElementById("addr2").addEventListener("blur", validateAddr2);
  document.getElementById("state").addEventListener("change", validateState);
  document.getElementById("ssn").addEventListener("blur", validateSSN);
  const form = document.getElementById("registration");
  form.addEventListener("submit", (e) => {
    if (!validatePasswordFields()) {
      e.preventDefault();
      alert("Please fix your password before submitting.");
    }
  });
    document.querySelector('input[type="reset"]').addEventListener("click", () => {
        document.getElementById("reviewArea").innerHTML = "";
        document.querySelectorAll(".error").forEach(span => span.textContent = "");
    });
});
function setError(fieldId, message) {
  const span = document.getElementById(fieldId + "Error");
  if (span) span.textContent = message;
}

function clearError(fieldId) {
  const span = document.getElementById(fieldId + "Error");
  if (span) span.textContent = "";
}

function updateHealth() {
  document.getElementById("healthValue").textContent =
    document.getElementById("health").value;
}
function updatePain() {
  document.getElementById("painValue").textContent =
    document.getElementById("pain").value;
}
function validateFirstName() {
  const value = document.getElementById("fname").value.trim();
  const regex = /^[A-Za-z'-]{1,30}$/;
  if (value === "") {
    setError("fname", "First name is required.");
    return false;
  }
  if (!regex.test(value)) {
    setError("fname", "1–30 letters, apostrophes or dashes only.");
    return false;
  }
  clearError("fname");
  return true;
}
function validateLastName() {
  const value = document.getElementById("lname").value.trim();
  const regex = /^[A-Za-z'-]{1,30}$/;
  if (value === "") {
    setError("lname", "Last name is required.");
    return false;
  }
  if (!regex.test(value)) {
    setError("lname", "1–30 letters, apostrophes or dashes only.");
    return false;
  }
  clearError("lname");
  return true;
}
function validateDob() {
  const dobEl = document.getElementById("dob");
  const value = dobEl.value;
  if (!value) {
    setError("dob", "Date of birth is required.");
    return false;
  }
  const date = new Date(value);
  const today = new Date();
  const oldest = new Date();
  oldest.setFullYear(today.getFullYear() - 120);

  if (date > today) {
    setError("dob", "DOB cannot be in the future.");
    return false;
  }
  if (date < oldest) {
    setError("dob", "DOB cannot be more than 120 years ago.");
    return false;
  }
  clearError("dob");
  return true;
}
function validateEmail() {
  const value = document.getElementById("email").value.trim().toLowerCase();
  const emailField = document.getElementById("email");
  emailField.value = value; 

  const regex = /^[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$/;
  if (value === "") {
    setError("email", "Email is required.");
    return false;
  }
  if (!regex.test(value)) {
    setError("email", "Enter a valid email like name@domain.com.");
    return false;
  }
  clearError("email");
  return true;
}
function validatePhone() {
  const value = document.getElementById("phone").value.trim();
  const regex = /^\d{3}-\d{3}-\d{4}$/;
  if (value === "") {
    setError("phone", "Phone number is required.");
    return false;
  }
  if (!regex.test(value)) {
    setError("phone", "Use format 555-555-5555.");
    return false;
  }
  clearError("phone");
  return true;
}
function validateZip() {
  const value = document.getElementById("zip").value.trim();
  const regex = /^\d{5}$/;
  if (value === "") {
    setError("zip", "ZIP code is required.");
    return false;
  }
  if (!regex.test(value)) {
    setError("zip", "Use 5 digits (e.g. 77002).");
    return false;
  }
  clearError("zip");
  return true;
}
function validateUser() {
  const userField = document.getElementById("user");
  let value = userField.value.trim();
  
  value = value.toLowerCase();
  userField.value = value;

  const regex = /^[A-Za-z][A-Za-z0-9_-]{4,19}$/; 
  if (value === "") {
    setError("user", "User ID is required.");
    return false;
  }
  if (!regex.test(value)) {
    setError(
      "user",
      "5–20 chars, start with a letter, letters/numbers/_/- only."
    );
    return false;
  }
  clearError("user");
  return true;
}
function validatePasswordFields() {
  const p1 = document.getElementById("pass").value;
  const p2 = document.getElementById("pass2").value;
  const user = document.getElementById("user").value.toLowerCase();

  let ok = true;

  const pattern =
    /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[!@#%^&*()_\-+=\\/><.,`~])[A-Za-z\d!@#%^&*()_\-+=\\/><.,`~]{8,30}$/;


  if (!pattern.test(p1)) {
    setError(
      "pass",
      "8–30 chars, with upper, lower, number, and special character."
    );
    ok = false;
  } else if (p1.toLowerCase().includes(user) && user !== "") {
    setError("pass", "Password cannot contain your username.");
    ok = false;
  } else {
    clearError("pass");
  }

  if (p1 !== p2) {
    setError("pass2", "Passwords do not match.");
    ok = false;
  } else if (p2 !== "") {
    clearError("pass2");
  }

  return ok;
}
function validateAddr1() {
  const value = document.getElementById("addr1").value.trim();
  if (value.length < 2 || value.length > 30) {
    setError("addr1", "2–30 characters required.");
    return false;
  }
  clearError("addr1");
  return true;
}
function validateAddr2() {
  const value = document.getElementById("addr2").value.trim();
  if (value === "") {
    clearError("addr2");
    return true;
  }
  if (value.length < 2 || value.length > 30) {
    setError("addr2", "Must be 2–30 characters or leave blank.");
    return false;
  }
  clearError("addr2");
  return true;
}
function validateState() {
  const value = document.getElementById("state").value;
  if (value === "") {
    setError("state", "Please select a state.");
    return false;
  }
  clearError("state");
  return true;
}
function validateSSN() {
  const ssnField = document.getElementById("ssn");
  let value = ssnField.value.replace(/[^0-9]/g, ""); 

  if (value.length < 9) {
    setError("ssn", "Must be 9 digits.");
    return false;
  }

  value = value.replace(/^(\d{3})(\d{2})(\d{4})$/, "$1-$2-$3");
  ssnField.value = value;

  clearError("ssn");
  return true;
}
function validateVacc() {
  const checked = document.querySelector('input[name="vacc"]:checked');
  if (!checked) {
    setError("vacc", "Please select Yes or No.");
    return false;
  }
  clearError("vacc");
  return true;
}
function validateIns() {
  const checked = document.querySelector('input[name="ins"]:checked');
  if (!checked) {
    setError("ins", "Please select Yes or No.");
    return false;
  }
  clearError("ins");
  return true;
}
function validateAll() {
  let ok = true;

  if (!validateFirstName()) ok = false;
  if (!validateLastName()) ok = false;
  if (!validateDob()) ok = false;
  if (!validateEmail()) ok = false;
  if (!validatePhone()) ok = false;
  if (!validateZip()) ok = false;
  if (!validateUser()) ok = false;
  if (!validatePasswordFields()) ok = false;
  if (!validateAddr1()) ok = false;
  if (!validateAddr2()) ok = false;
  if (!validateState()) ok = false;
  if (!validateSSN()) ok = false;
  if (!validateVacc()) ok = false;
  if (!validateIns()) ok = false;

  const submitBtn = document.getElementById("submitBtn");

  if (ok) {
    submitBtn.style.display = "inline-block";
  } else {
    submitBtn.style.display = "none";
  }
}

function reviewForm() {
  const errors = [];
  const pass1 = document.getElementById("pass").value;
  const pass2 = document.getElementById("pass2").value;
  const user = document.getElementById("user").value.toLowerCase();
  const pattern =
    /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[!@#%^&*()_\-+=\\/><.,`~])[A-Za-z\d!@#%^&*()_\-+=\\/><.,`~]{8,30}$/;

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
    document.querySelectorAll('input[name="cond"]:checked'))
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
