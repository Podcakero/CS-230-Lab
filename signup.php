<?php
require "includes/header.php"
?>

<main>
    <link rel="stylesheet" href="../css/signup.css">

    <div class="bg-cover">
        <div class="h-100 container center-me">
            <div class="my-auto">
                <div class="signup-form">

                    <form action="includes/signup-helper.php" method="post">

                        <h1 class="h3 mb-3 font-weight-normal">
                            Please sign up
                        </h1>

                        <p class="hint-text">
                            Create Your Account!
                        </p>

                        <div class="form-group">
                            <div class="row">
                                <div class="col">
                                    <input type="text" class="form-control" name="fname" placeholder="First name" required autofocus>
                                </div>
                                <div class="col">
                                    <input type="text" class="form-control" name="lname" placeholder="Last name" required>
                                </div>
                            </div>
                        </div>

                        <input type="text" class="form-control" name="uname" placeholder="Username" required>

                        <input type="email" id="inputEmail" class="form-control" name="email" placeholder="Email address" required>

                        <div class="formgroup">
                            <div class="row">
                                <div class="col">
                                    <input type="password" id="inputPassword" class="form-control" name="pwd" placeholder="Password" required>
                                </div>
                                <div class="col">
                                    <input type="password" id="inputPassword" class="form-control" name="con_pwd" placeholder="Confirm Password" required>
                                </div>
                            </div>
                        </div>

                        <button class="btn btn-lg btn-outline-primary btn-block" name="signup-submit" type="submit">
                            Sign in
                        </button>

                        <p class="mt-5 mb-3 text-muted">
                            &copy; 2021
                        </p>
                    </form>
                </div>
            </div>
        </div>
    </div>
</main>