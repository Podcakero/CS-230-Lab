<?php
if (isset($_POST['login-submit']))
{
    require 'dbhandler.php';

    $username = $_POST['uname-email'];
    $password = $_POST['pwd'];

    if (empty($username) || empty($password))
    {
        header("Location: ../login.php?error=emptyField");
        exit();
    }

    $sql = "SELECT * FROM users WHERE uname=? OR email=?";
    $stmt = mysqli_stmt_init($conn);

    if (!mysqli_stmt_prepare($stmt, $sql))
    {
        header("Location: ../login.php?error=SQLInjection");
        exit();
    }
    else
    {
        mysqli_stmt_bind_param($stmt, "ss", $username, $username);
        mysqli_stmt_execute($stmt);
        $result = mysqli_stmt_get_result($stmt);
        $data = mysqli_fetch_assoc($result);

        if (empty($data))
        {
            header("Location: ../login.php?error=userNotFound");
            exit();
        }
        else
        {
            $pass_check = password_verify($password, $data['password']);

            if ($pass_check == true)
            {
                session_start();
                $_SESSION['uid'] = $data['uid'];
                $_SESSION['fname'] = $data['fname'];
                $_SESSION['lname'] = $data['lname'];
                $_SESSION['uname'] = $data['uname'];

                echo "<h1> Success!</h1><p>$username</p>";
            }
            else
            {
                header("Location: ../login.php?error=wrongPassword");
                exit();
            }
        }
    }
}
else
{
    header("Location: ../login.php");
    exit();
}