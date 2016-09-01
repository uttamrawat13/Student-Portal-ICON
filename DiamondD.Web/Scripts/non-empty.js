function required()
{
    var creditcardnumber = document.forms["form1"]["creditcardnumber"].value;
    if (creditcardnumber == "")
    {
    alert("Please enter credit card number");
    return false;
    }

   












    var CVV = document.forms["form1"]["CVV"].value;
    if (CVV == "") {
        alert("Please enter CVV");
        return false;
    }









    var CreditCardHoldername = document.forms["form1"]["CreditCardHoldername"].value;
    if (CreditCardHoldername == "") {
        alert("Please enter credit card holder name");
        return false;
    }




    var expiry = document.forms["form1"]["expiry"].value;
    if (expiry == "") {
        alert("Please enter expiry date of credit card");
        return false;
    }
    
}