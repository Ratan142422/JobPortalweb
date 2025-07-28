<?php
session_start();

$db_host = 'localhost';
$db_user = 'root';
$db_pass = '';
$db_name = 'job_portal';

$conn = new mysqli($db_host, $db_user, $db_pass, $db_name);
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

$errors = [];
$success = '';

// Handle registration
if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['register'])) {
    $name = trim($_POST['name'] ?? '');
    $email = trim($_POST['email'] ?? '');
    $phonenumber = trim($_POST['phonenumber'] ?? '');
    $password = $_POST['password'] ?? '';
    $confirm_password = $_POST['confirm_password'] ?? '';

    // Validation
    if (!$name) $errors[] = "Name is required.";
    if (!$email) $errors[] = "Email is required.";
    if (!$phonenumber) $errors[] = "Phone number is required.";
    if (!$password) $errors[] = "Password is required.";
    if ($password !== $confirm_password) $errors[] = "Passwords do not match.";
    
    // Email validation
    if ($email && !filter_var($email, FILTER_VALIDATE_EMAIL)) {
        $errors[] = "Please enter a valid email address.";
    }

    // Check if email already exists
    if ($email && empty($errors)) {
        $stmt = $conn->prepare("SELECT id FROM register WHERE email = ?");
        $stmt->bind_param("s", $email);
        $stmt->execute();
        $result = $stmt->get_result();
        if ($result->num_rows > 0) {
            $errors[] = "Email address already exists. Please use a different email.";
        }
        $stmt->close();
    }

    // If no errors, insert the user
    if (empty($errors)) {
        $hashed_password = password_hash($password, PASSWORD_DEFAULT);
        $stmt = $conn->prepare("INSERT INTO register (name, email, phonenumber, password) VALUES (?, ?, ?, ?)");
        $stmt->bind_param("ssss", $name, $email, $phonenumber, $hashed_password);
        
        if ($stmt->execute()) {
            $success = "Registration successful! You can now login.";
            // Clear form data after successful registration
            $_POST = array();
        } else {
            $errors[] = "Registration failed. Please try again.";
        }
        $stmt->close();
    }
}

$conn->close();
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Register - JobPortal Pro</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <style>
        :root {
            --primary-color: #4a90e2;
            --secondary-color: #357ABD;
            --accent-color: #4a90e2;
            --success-color: #28a745;
            --warning-color: #ffc107;
            --danger-color: #dc3545;
            --dark-color: #2c3e50;
            --light-color: #ecf0f1;
            --shadow: 0 10px 30px rgba(0,0,0,0.1);
            --gradient: linear-gradient(135deg, var(--primary-color) 0%, var(--secondary-color) 100%);
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: url('https://wallpapercave.com/wp/wp2019265.jpg') no-repeat center center fixed;
            background-size: cover;
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            color: var(--light-color);
            padding: 20px;
        }

        .register-wrapper {
            background: rgba(0, 0, 0, 0.6);
            padding: 3rem 2.5rem 2.5rem;
            border-radius: 20px;
            box-shadow: 0 15px 40px rgba(0,0,0,0.5);
            width: 450px;
            text-align: center;
            position: relative;
        }

        .register-wrapper::before {
            content: '';
            position: absolute;
            top: -40px;
            left: 50%;
            transform: translateX(-50%);
            width: 80px;
            height: 80px;
            background: var(--gradient);
            border-radius: 50%;
            box-shadow: 0 5px 15px rgba(74, 144, 226, 0.6);
            display: flex;
            justify-content: center;
            align-items: center;
            font-size: 2.5rem;
            color: white;
            font-weight: 700;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        .register-wrapper h2 {
            margin-top: 50px;
            margin-bottom: 1.5rem;
            font-weight: 700;
            font-size: 1.8rem;
            letter-spacing: 1px;
            color: var(--light-color);
        }

        label {
            display: block;
            margin-bottom: 0.5rem;
            font-weight: 600;
            text-align: left;
            color: var(--light-color);
        }

        input[type="text"], 
        input[type="email"], 
        input[type="password"],
        input[type="tel"] {
            width: 100%;
            padding: 0.75rem 1rem;
            margin-bottom: 1.25rem;
            border-radius: 12px;
            border: 1px solid #999;
            font-size: 1rem;
            transition: box-shadow 0.3s ease, border-color 0.3s ease;
            outline: none;
            background-color: #222;
            color: var(--light-color);
        }

        input[type="text"]:focus, 
        input[type="email"]:focus, 
        input[type="password"]:focus,
        input[type="tel"]:focus {
            box-shadow: 0 0 8px 2px var(--primary-color);
            border-color: var(--primary-color);
            background-color: #222;
            color: var(--light-color);
        }

        button {
            width: 100%;
            padding: 0.85rem;
            background: var(--gradient);
            border: none;
            border-radius: 12px;
            font-size: 1.1rem;
            font-weight: 700;
            cursor: pointer;
            color: var(--light-color);
            transition: background 0.3s ease;
            letter-spacing: 1px;
            margin-bottom: 1rem;
        }

        button:hover {
            background: var(--secondary-color);
            color: var(--light-color);
        }

        .error {
            color: #ff6b6b;
            margin-bottom: 1rem;
            text-align: center;
            font-weight: 600;
            background: rgba(255, 107, 107, 0.1);
            padding: 10px;
            border-radius: 8px;
            border: 1px solid rgba(255, 107, 107, 0.3);
        }

        .success {
            color: #28a745;
            margin-bottom: 1rem;
            text-align: center;
            font-weight: 600;
            background: rgba(40, 167, 69, 0.1);
            padding: 10px;
            border-radius: 8px;
            border: 1px solid rgba(40, 167, 69, 0.3);
        }

        .login-link {
            color: var(--primary-color);
            text-decoration: none;
            font-weight: 600;
            transition: color 0.3s ease;
        }

        .login-link:hover {
            color: var(--secondary-color);
            text-decoration: underline;
        }

        .logo {
            font-size: 1.8rem;
            font-weight: bold;
            background: var(--gradient);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
            margin-bottom: 1rem;
        }
    </style>
</head>
<body>
    <div class="register-wrapper">
        <div class="logo">
            <i class="fas fa-briefcase"></i> 
            <span style="font-weight: 900; background: linear-gradient(135deg, #4a90e2 0%, #357ABD 100%); -webkit-background-clip: text; -webkit-text-fill-color: transparent; background-clip: text;">
                JobPortal Pro
            </span>
        </div>
        <h2>Create Account</h2>
        
        <?php if ($errors): ?>
            <div class="error">
                <ul style="list-style: none; padding: 0;">
                    <?php foreach ($errors as $error): ?>
                        <li><?php echo htmlspecialchars($error); ?></li>
                    <?php endforeach; ?>
                </ul>
            </div>
        <?php endif; ?>
        
        <?php if ($success): ?>
            <div class="success"><?php echo htmlspecialchars($success); ?></div>
        <?php endif; ?>
        
        <form method="POST" action="register.php" autocomplete="off">
            <label for="name">Full Name *</label>
            <input type="text" id="name" name="name" required autofocus placeholder="Enter your full name" 
                   value="<?php echo htmlspecialchars($_POST['name'] ?? ''); ?>" />
            
            <label for="email">Email Address *</label>
            <input type="email" id="email" name="email" required placeholder="Enter your email address" 
                   value="<?php echo htmlspecialchars($_POST['email'] ?? ''); ?>" />
            
            <label for="phonenumber">Phone Number *</label>
            <input type="tel" id="phonenumber" name="phonenumber" required placeholder="Enter your phone number" 
                   value="<?php echo htmlspecialchars($_POST['phonenumber'] ?? ''); ?>" />
            
            <label for="password">Password *</label>
            <input type="password" id="password" name="password" required placeholder="Enter your password" />
            
            <label for="confirm_password">Confirm Password *</label>
            <input type="password" id="confirm_password" name="confirm_password" required placeholder="Confirm your password" />
            
            <button type="submit" name="register">Create Account</button>
        </form>
        
        <p style="margin-top: 1rem; color: var(--light-color);">
            Already have an account? 
            <a href="index1.php" class="login-link">Login here</a>
        </p>
        <p style="margin-top: 0.5rem; color: var(--light-color); font-size: 0.9rem; opacity: 0.8;">
            <i class="fas fa-info-circle"></i> You can login with your email or phone number
        </p>
    </div>
</body>
</html> 