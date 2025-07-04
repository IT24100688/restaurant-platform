<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body>
<style>


    *{
        font-family: 'Poppins', sans-serif;
        margin:0; padding:0;
        box-sizing: border-box;
        outline: none; border:none;
        text-transform: capitalize;
        transition: all .2s linear;
    }

    .container{
        display: flex;
        justify-content: center;
        align-items: center;
        padding:25px;
        min-height: 100vh;
        background: linear-gradient(to right, #141E30, #243B55); /* background theme */

    }

    .container form{
        padding:20px;
        width:700px;
        background: #fff;
        box-shadow: 0 5px 10px rgba(0,0,0,.1);
    }

    .container form .row{
        display: flex;
        flex-wrap: wrap;
        gap:15px;
    }

    .container form .row .col{
        flex:1 1 250px;
    }

    .container form .row .col .title{
        font-size: 20px;
        color:#333;
        padding-bottom: 5px;
        text-transform: uppercase;
    }

    .container form .row .col .inputBox{
        margin:15px 0;
    }

    .container form .row .col .inputBox span{
        margin-bottom: 10px;
        display: block;
    }

    .container form .row .col .inputBox input{
        width: 100%;
        border:1px solid #ccc;
        padding:10px 15px;
        font-size: 15px;
        text-transform: none;
    }

    .container form .row .col .inputBox input:focus{
        border:1px solid #000;
    }

    .container form .row .col .flex{
        display: flex;
        gap:15px;
    }

    .container form .row .col .flex .inputBox{
        margin-top: 5px;
    }

    .container form .row .col .inputBox img{
        height: 50px;
        margin-right: 20px;
        margin-top: 5px;
        filter: drop-shadow(0 0 1px #000);
    }

    .container form .submit-btn{
        width: 100%;
        padding:12px;
        font-size: 17px;
        background: #141E30;
        color:#fff;
        margin-top: 5px;
        cursor: pointer;
    }

    .container form .submit-btn:hover{
        background: #243B55;
    }
</style>

<div class="container">

    <form action="PaymentConfirm.jsp ">

        <div class="row">

            <div class="col">

                <h3 class="title">billing address</h3>

                <div class="inputBox">
                    <span>full name :</span>
                    <input type="text" placeholder="john deo">
                </div>
                <div class="inputBox">
                    <span>email :</span>
                    <input type="email" placeholder="example@example.com">
                </div>
                <div class="inputBox">
                    <span>address :</span>
                    <input type="text" placeholder="room - street - locality">
                </div>
                <div class="inputBox">
                    <span>city :</span>
                    <input type="text" placeholder="mumbai">
                </div>

                <div class="flex">
                    <div class="inputBox">
                        <span>state :</span>
                        <input type="text" placeholder="india">
                    </div>
                    <div class="inputBox">
                        <span>zip code :</span>
                        <input type="text" placeholder="123 456">
                    </div>
                </div>

            </div>

            <div class="col">

                <h3 class="title">payment</h3>

                <div class="inputBox">
                    <span>cards accepted :</span><br>
                    <img src="https://img.icons8.com/color/48/000000/mastercard-logo.png" alt="MasterCard">
                    <img src="https://img.icons8.com/color/48/000000/visa.png" alt="Visa">
                    <img src="https://img.icons8.com/color/48/000000/amex.png" alt="Amex">
                    <img src="https://img.icons8.com/color/48/000000/paypal.png" alt="PayPal">
                </div>

                <div class="inputBox">
                    <span>name on card :</span>
                    <input type="text" placeholder="mr. john deo">
                </div>
                <div class="inputBox">
                    <span>credit card number :</span>
                    <input type="number" placeholder="1111-2222-3333-4444">
                </div>
                <div class="inputBox">
                    <span>exp month :</span>
                    <input type="text" placeholder="january">
                </div>

                <div class="flex">
                    <div class="inputBox">
                        <span>exp year :</span>
                        <input type="number" placeholder="2022">
                    </div>
                    <div class="inputBox">
                        <span>CVV :</span>
                        <input type="text" placeholder="1234">
                    </div>
                </div>

            </div>

        </div>

        <input type="submit" value="proceed to checkout" class="submit-btn">

    </form>

</div>

</body>
</html>