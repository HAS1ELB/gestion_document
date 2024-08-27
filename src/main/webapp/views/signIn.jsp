<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="ISO-8859-1">
    <title>Sign In</title>
    <link rel="stylesheet" href="css/signIn.css">
    <script type="text/javascript">
        function toggleConfidentialPassword() {
            var userType = document.getElementById("userType").value;
            var confidentialPasswordDiv = document.getElementById("confidentialPasswordDiv");
            if (userType === "admin") {
                confidentialPasswordDiv.style.display = "block";
            } else {
                confidentialPasswordDiv.style.display = "none";
            }
        }

        function validateForm() {
            var userType = document.getElementById("userType").value;
            if (userType === "admin") {
                var confidentialPass = document.getElementById("confidentialPass").value;
                if (confidentialPass !== "1111") {
                    alert("Invalid confidential password. Please try again.");
                    return false;
                }
            }
            return true;
        }
    </script>
</head>
<body>
    <header>
        <h1>Compte Verrouillé</h1>
    </header>
    <main>
        <h2>S'enregistrer</h2>
        <form action="submitSignIn.do" method="post" onsubmit="return validateForm()">
            <div class="form-group">
                <label for="username">Nom d'utilisateur:</label>
                <input type="text" id="username" name="username" required>
            </div>
            <div class="form-group">
                <label for="pass">Mot de passe:</label>
                <input type="password" id="pass" name="pass" required>
            </div>
            <div class="form-group">
                <label for="userType">Type d'utilisateur:</label>
                <select id="userType" name="userType" onchange="toggleConfidentialPassword()" required>
                    <option value="user">User</option>
                    <option value="admin">Admin</option>
                </select>
            </div>
            <div id="confidentialPasswordDiv" class="form-group" style="display:none;">
                <label for="confidentialPass">Mot de passe confidentiel:</label>
                <input type="password" id="confidentialPass" name="confidentialPass">
            </div>
            <h4 class="error-message"><%=request.getAttribute("message") %></h4>
            <button type="submit">S'enregistrer</button>
        </form>
    </main>
    <footer>
        <p>&copy; 2024 - Gestion des documents</p>
    </footer>
</body>
</html>
