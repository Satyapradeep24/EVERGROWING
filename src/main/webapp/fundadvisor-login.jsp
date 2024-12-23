<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<%
    String msg = (String) session.getAttribute("error");
    if (msg == null) {
        msg = "";
    }
    session.removeAttribute("error");
%>
<html lang="EN">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <script src="https://kit.fontawesome.com/64d58efce2.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="assets/css/login.css" />
    <title>Fund Advisor Login & Registration</title>
    <script>
        window.onload = function() {
            const message = '<%= session.getAttribute("message") != null ? session.getAttribute("message") : "" %>';
            if (message) {
                alert(message); 
                <% session.removeAttribute("message"); %>
            }
        };
    </script>
  </head>
  <body>
    <div class="container">
      <div class="forms-container">
        <div class="signin-signup">
          <!-- Fund Advisor Login Form -->
          <form action="checkfundadvisorlogin" method="post" class="sign-in-form">
            <h4 style="color: red"><% out.print(msg); %></h4>
            <% String errorMessage = (String) session.getAttribute("error"); %>
            <% if (errorMessage != null && !errorMessage.isEmpty()) { %>
                <div class="error-message" style="color: red; font-weight: bold;">
                    <%= errorMessage %>
                </div>
            <% session.removeAttribute("error"); %>
            <% } %>

            <h2 class="title">Login</h2>

            <div class="input-field">
              <i class="fas fa-envelope"></i>
              <input type="email" id="login-email" name="login-email" placeholder="Email" required onchange="validateEmail(this)" />
            </div>

            <div class="input-field">
              <i class="fas fa-lock"></i>
              <input type="password" name="login-password" placeholder="Password" required />
            </div>

            <a href="#" class="href">Forgot Password?</a>

            <input type="submit" value="Log In" class="btn solid" id="login-button" />
          </form>

          <!-- Fund Advisor Registration Form -->
          <form action="registerFundAdvisor" method="post" class="sign-up-form" enctype="multipart/form-data">
            <h2 class="title">Fund Advisor Registration</h2>

            <div class="input-field">
              <i class="fas fa-user"></i>
              <input type="text" name="name" placeholder="Full Name" required />
            </div>

            <div class="input-field">
              <i class="fas fa-envelope"></i>
              <input type="email" id="register-email" name="register-email" placeholder="Email" required onchange="validateEmail(this)" />
            </div>

            <div class="input-field">
              <i class="fas fa-phone"></i>
              <input type="text" id="phoneNumber" name="phone" placeholder="Phone Number" required onchange="validatePhoneNumber(this)" />
            </div>

            <div class="input-field">
              <i class="fas fa-calendar"></i>
              <input type="number" name="yearsOfExperience" placeholder="Years of Experience" required />
            </div>

            <div class="input-field">
              <i class="fas fa-flag"></i>
              <input type="text" name="specialization" placeholder="Specialization" required />
            </div>

            <div class="input-field">
              <i class="fas fa-info-circle"></i>
              <textarea name="bio" placeholder="Short Bio" rows="4" required></textarea>
            </div>

            

            <div class="input-field">
              <i class="fas fa-briefcase"></i>
              <input type="password" name="password" placeholder="Password" required />
            </div>
            
            <div class="input-field">
              <i class="fas fa-briefcase"></i>
              <input type="file" name="profileimage" placeholder="Profile Photo" />
            </div>

           

            <input type="submit" class="btn" value="Register" id="register-button" />
          </form>
        </div>
      </div>

      <div class="panels-container">
        <div class="panel left-panel">
          <div class="content">
            <h3>Don't have an account?</h3>
            <br />
            <button class="btn transparent" id="sign-up-btn">Register Now</button>
          </div>
          <img src="assets/images/register.svg" class="image" alt="Register" />
        </div>
        <div class="panel right-panel">
          <div class="content">
            <h3>Already have an account?</h3>
            <br />
            <button class="btn transparent" id="sign-in-btn">Login Now</button>
          </div>
          <img src="assets/images/login.svg" class="image" alt="Login" />
        </div>
      </div>
    </div>
    <script src="assets/js/script.js"></script>
    <script>
      const countryStateInfo = {
        USA: ["California", "Texas", "Florida", "New York"],
        India: ["Delhi", "Maharashtra", "Karnataka", "Tamil Nadu"],
        Canada: ["Ontario", "Quebec", "British Columbia", "Alberta"],
        Australia: ["New South Wales", "Victoria", "Queensland", "Western Australia"],
      };

      window.onload = function () {
        const countrySelect = document.getElementById("country");
        const stateSelect = document.getElementById("state");

        // Populate country dropdown
        for (let country in countryStateInfo) {
          let option = document.createElement("option");
          option.value = country;
          option.text = country;
          countrySelect.appendChild(option);
        }

        // When country changes, update state options
        countrySelect.onchange = function () {
          stateSelect.innerHTML = "<option value=''>Select State</option>";
          let selectedCountry = countrySelect.value;

          if (selectedCountry !== "") {
            let states = countryStateInfo[selectedCountry];
            for (let i = 0; i < states.length; i++) {
              let option = document.createElement("option");
              option.value = states[i];
              option.text = states[i];
              stateSelect.appendChild(option);
            }
          }
        };
      };

      // Email validation
      function validateEmail(emailField) {
        const validDomains = ["gmail.com", "kluniversity.in"];
        const emailDomain = emailField.value.split("@")[1];

        if (!validDomains.includes(emailDomain)) {
          emailField.setCustomValidity("Email must be from gmail.com or kluniversity.in");
        } else {
          emailField.setCustomValidity("");
        }
      }

      // Phone number validation
      function validatePhoneNumber(phoneField) {
        const phoneNumber = phoneField.value;
        const validStartDigits = ["9", "6", "8", "7"];

        if (!validStartDigits.includes(phoneNumber.charAt(0))) {
          phoneField.setCustomValidity("Phone number must start with 9, 6, 7 or 8");
        } else {
          phoneField.setCustomValidity("");
        }
      }
    </script>
  </body>
</html>
