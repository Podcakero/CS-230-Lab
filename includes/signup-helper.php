<?php

if (isset($_POST['signup-submit']))
{
    require 'dbhandler.php';

    $username = $_POST['uname'];
    $email= $_POST['email'];
    $password = $_POST['pwd'];
    $confirm_password = $_POST['con_pwd'];
    $first_name = $_POST['fname'];
    $last_name = $_POST['lname'];

    if ($password !== $confirm_password)
    {
        header("Location: ../signup.php?error=diffPasswords");
        exit();
    }
    else
    {
        $sql = "SELECT uname FROM users WHERE uname=?";
        $stmt = mysqli_stmt_init($conn);
        if (!mysqli_stmt_prepare($stmt, $sql))
        {
            header("Location: ../signup.php?error=SQLInjection");
            exit();
        }
        else
        {
            mysqli_stmt_bind_param($stmt, "s", $username);
            mysqli_stmt_execute($stmt);
            mysqli_stmt_store_result($stmt);
            $check = mysqli_stmt_num_rows($stmt);

            if ($check > 0)
            {
                header("Location: ../signup.php?usernameTaken");
                exit();
            }
            else
            {
                $sql = "INSERT INTO users (fname, lname, uname, password, email) VALUES (?, ?, ?, ?, ?)";
                $stmt = mysqli_stmt_init($conn);
                if (!mysqli_stmt_prepare($stmt, $sql))
                {
                    header("Location: ../signup.php?error=SQLInjection");
                    exit();
                }
                else
                {
                    $hashed = password_hash($password, PASSWORD_BCRYPT);
                    mysqli_stmt_bind_param($stmt, "sssss", $first_name, $last_name, $username, $hashed, $email);
                    mysqli_stmt_execute($stmt);
                    mysqli_stmt_store_result($stmt);

                    $sqlImg = "INSERT INTO profiles (fname, uname) VALUES ('$first_name', '$username')";
                    mysqli_query($conn, $sqlImg);

                    header("Location: ../signup.php?signup=success");
                    exit();
                }
            }
        }
        mysqli_ctmt_close($stmt);
        mysqli_close($conn);
    }
}
else
{
    header("Location: ../signup.php");
    exit();
}