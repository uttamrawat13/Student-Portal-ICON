<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<%@ Import Namespace="DiamondD.Data.DataAccess.Payment" %>
<%@ Import Namespace="DiamondD.Data.DataAccess.Repositories" %>
<%@ Import Namespace="DiamondD.Web.Controllers" %>
<%@ Import Namespace="DiamondD.Services.Common" %>
<%@ Import Namespace="DiamondD.Web.Helpers" %>



<!DOCTYPE html>
<script src='<%=ResolveUrl("../../Scripts/PayConfirmEmail.html") %>' type="text/javascript"></script>
<script runat="server">
    string strHTML;
    protected void Page_Load(object sender, EventArgs e)
    {

        if (Request.QueryString.ToString().Length > 0)
        {

            if (Request.QueryString["errorCode"] != null)
            {

                try
                {

                    PaymentProcess objpp = new PaymentProcess();
                    objpp.errorCode = Request.QueryString["errorCode"];
                    objpp.errorMsg = Request.QueryString["errorMsg"].ToString();
                    objpp.errorName = Request.QueryString["errorName"].ToString();
                    objpp.ssl_amount = null;
                    objpp.ssl_approval_code = string.Empty;
                    objpp.ssl_result = string.Empty;
                    objpp.ssl_result_message = string.Empty;
                    objpp.ssl_token = string.Empty;
                    objpp.ssl_token_response = string.Empty;
                    objpp.ssl_txn_id = string.Empty;
                    objpp.ssl_txn_time = null;
                    objpp.StudentNo = Convert.ToInt32(Session[UserController.SessionKeyStudentNo]);
                    objpp.PaymentSource = "W";
                    objpp.PaymentType = string.Empty;
                    objpp.MiscID = 0;
                    objpp.LeadsID =0;
                    SqlPaymentRepository obj = new SqlPaymentRepository();
                    obj.InsertPaymentTransactionWithError(objpp);

                    if (Session[UserController.SessionKeyEmailSent] != null)
                    {
                        if (Convert.ToInt32(Session[UserController.SessionKeyEmailSent]) > 0)
                        {
                            sendmail.Instance.fn = Session[UserController.SessionKey].ToString(); //Session["uname"].ToString(); //;
                            sendmail.Instance.ln = "";
                            sendmail.Instance.amt = "0";
                            sendmail.Instance.tid = "";
                            sendmail.Instance.msg = Request.QueryString["errorMsg"].ToString();
                            sendmail.Instance.tdate = "";
                            strHTML = sendmail.Instance.PopulateBody(System.Web.HttpContext.Current.Server.MapPath("PayConfirmEmail.html"));
                            sendmail.Instance.MailGo(strHTML, ConfigurationManager.AppSettings["pcEmailfrom"].ToString(), Session[UserController.SessionKeyEmail].ToString(), ConfigurationManager.AppSettings["pcEmailSubject"].ToString(), ConfigurationManager.AppSettings["pcsmtp"].ToString(), ConfigurationManager.AppSettings["pcEmailPass"].ToString());
                        }
                    }


                }
                catch (System.Data.SqlClient.SqlException ex)
                {

                    throw ex;
                }

                Response.Redirect("../User.mvc/PaymentReceipt?errorCode=" + Request.QueryString["errorCode"] + "&errorMsg=" + Request.QueryString["errorMsg"].ToString() + "&errorName=" + Request.QueryString["errorName"].ToString() + "");

            }

            else
            {


                try
                {
                    PaymentProcess objpp = new PaymentProcess();
                    objpp.errorCode = string.Empty;
                    objpp.errorMsg = string.Empty;
                    objpp.errorName = string.Empty;
                    objpp.ssl_amount = Convert.ToDecimal(Request.QueryString["ssl_amount"]);
                    objpp.ssl_approval_code = Request.QueryString["ssl_approval_code"];
                    objpp.ssl_result = Request.QueryString["ssl_result"];
                    objpp.ssl_result_message = Request.QueryString["ssl_result_message"];
                    objpp.ssl_token = Request.QueryString["ssl_token"];
                    objpp.ssl_token_response = Request.QueryString["ssl_token_response"];
                    objpp.ssl_txn_id = Request.QueryString["ssl_txn_id"];
                    objpp.ssl_txn_time = Convert.ToDateTime(Request.QueryString["ssl_txn_time"]);
                    objpp.StudentNo = Convert.ToInt32(Request.QueryString["StudentID"]);
                    objpp.PaymentSource = "W";
                    if(Request.QueryString["ssl_approval_code"]=="NACREN")
                    {
                        objpp.PaymentType = "ecspurchase";
                    }    
                    else
                    {
                        objpp.PaymentType = "ccsale";
                        
                        
                    }
                    objpp.MiscID = 0;
                    objpp.LeadsID = 0;
                    SqlPaymentRepository obj = new SqlPaymentRepository();
                    obj.InsertPaymentTransactionWithSuccess(objpp);

                    //Convert.ToInt32(Session[UserController.SessionKeyStudentNo]);
                    //Session.Add(SessionKeyEmail, webUser.Email);
                    //Session.Add(SessionKeyEmailSent, webUser.EmailSent);
                    if (Session[UserController.SessionKeyEmailSent] != null)
                    {

                        if (Convert.ToInt32(Session[UserController.SessionKeyEmailSent]) > 0)
                        {
                            sendmail.Instance.fn = Request.QueryString["ssl_first_name"];
                            sendmail.Instance.amt = Request.QueryString["ssl_amount"];
                            sendmail.Instance.tid = Request.QueryString["ssl_txn_id"];
                            sendmail.Instance.msg = Request.QueryString["ssl_result_message"];
                            sendmail.Instance.tdate = Request.QueryString["ssl_txn_time"];
                            strHTML = sendmail.Instance.PopulateBody(System.Web.HttpContext.Current.Server.MapPath("PayConfirmEmail.html"));
                            sendmail.Instance.MailGo(strHTML, ConfigurationManager.AppSettings["pcEmailfrom"].ToString(), Session[UserController.SessionKeyEmail].ToString(), ConfigurationManager.AppSettings["pcEmailSubject"].ToString(), ConfigurationManager.AppSettings["pcsmtp"].ToString(), ConfigurationManager.AppSettings["pcEmailPass"].ToString());
                        }
                    }

                }
                catch (System.Data.SqlClient.SqlException ex)
                {

                    throw ex;
                }

                Response.Redirect("../User.mvc/PaymentReceipt?ssl_result_message=" + Request.QueryString["ssl_result_message"] + "&ssl_amount=" + Request.QueryString["ssl_amount"] + "&ssl_txn_id=" + Request.QueryString["ssl_txn_id"] + "&ssl_txn_time=" + Request.QueryString["ssl_txn_time"] + "");
            }

        }
       else
        {

            Response.Redirect(AppHelper.SharedUrl("Result/Error"));
            
        }
    
    }

    //public void fnPost()
    //{

    //    StringBuilder ob = new StringBuilder();
    //    ob.Append(PaymentAPI + "?" + "");
    //    ob.Append("ssl_merchant_id=" + ssl_merchant_id + "");
    //    ob.Append("&ssl_user_id=" + ssl_user_id + "");
    //    ob.Append("&ssl_pin=" + ssl_pin + "");
    //    ob.Append("&ssl_show_form=false");
    //    ob.Append("&ssl_amount=" + ssl_amount + "");
    //    ob.Append("&ssl_transaction_type=ccsale");
    //    ob.Append("&ssl_first_name=" + ssl_first_name + "");
    //    ob.Append("&StudentID=" + StudentID + "");
    //    ob.Append("&ssl_cvv2cvc2=" + pCVV + "");
    //    ob.Append("&journaltitle=" + pCreditCardHoldername + "");
    //    ob.Append("&ssl_card_number=" + pCreditCardnumber + "");
    //    ob.Append("&ssl_transaction_type=ccsale");
    //    ob.Append("&ssl_exp_date=" + pexpiry + "");
    //    ob.Append("&ssl_show _form=false");
    //    ob.Append("&ssl_get_token=Y");
    //    ob.Append("&ssl_result_format=ASCII");
    //    string sm = ob.ToString();
    //    System.Net.WebRequest request = System.Net.WebRequest.Create(sm);
    //    System.Net.WebResponse response = request.GetResponse();
    //    System.IO.StreamReader reader = new System.IO.StreamReader(response.GetResponseStream());
    //    var ResponseStr = reader.ReadToEnd();
    //    string[] lines = ResponseStr.Split(new Char[] { '\n' });

    //    Dictionary<string, string> dict = new Dictionary<string, string>();

    //    if (lines.Length > 0)
    //    {
    //        for (int i = 0; i < lines.Length; i++)
    //        {
    //            string[] val = lines[i].ToString().Split(new Char[] { '=' });
    //            if (val.Length > 0)
    //            {
    //                dict.Add(val[0].ToString(), val[1].ToString());
    //            }
    //        }

    //        if (dict.ContainsKey("errorCode"))
    //        {

    //            try
    //            {
    //                PaymentProcess objpp = new PaymentProcess();
    //                objpp.errorCode = dict["errorCode"];
    //                objpp.errorMsg = dict["errorMessage"];
    //                objpp.errorName = dict["errorName"];
    //                objpp.ssl_amount = null;
    //                objpp.ssl_approval_code = string.Empty;
    //                objpp.ssl_result = string.Empty;
    //                objpp.ssl_result_message = string.Empty;
    //                objpp.ssl_token = string.Empty;
    //                objpp.ssl_token_response = string.Empty;
    //                objpp.ssl_txn_id = string.Empty;
    //                objpp.ssl_txn_time = null;
    //                objpp.StudentNo = Convert.ToInt32(Session[UserController.SessionKeyStudentNo]);
    //                SqlPaymentRepository obj = new SqlPaymentRepository();
    //                obj.InsertPaymentTransactionWithError(objpp);
    //                Response.Redirect("PaymentReceipt?errorCode=" + dict["errorCode"] + "&errorName=" + dict["errorName"] + "&errorMessage=" + dict["errorMessage"]);
    //            }
    //            catch (System.Data.SqlClient.SqlException ex)
    //            {

    //                throw ex;
    //            }
    //        }
    //        else
    //        {
    //            if (dict.ContainsKey("ssl_txn_id"))
    //            {
    //                Response.Redirect("PaymentReceipt?ssl_result_message=" + dict["ssl_result_message"]);

    //                try
    //                {
    //                    PaymentProcess objpp = new PaymentProcess();
    //                    objpp.errorCode = string.Empty;
    //                    objpp.errorMsg = string.Empty;
    //                    objpp.errorName = string.Empty;
    //                    objpp.ssl_amount = Convert.ToDecimal(dict["ssl_amount"]);
    //                    objpp.ssl_approval_code = dict["ssl_approval_code"];
    //                    objpp.ssl_result = dict["ssl_result"];
    //                    objpp.ssl_result_message = dict["ssl_result_message"];
    //                    objpp.ssl_token = dict["ssl_token"];
    //                    objpp.ssl_token_response = dict["ssl_token_response"];
    //                    objpp.ssl_txn_id = dict["ssl_txn_id"];
    //                    objpp.ssl_txn_time = Convert.ToDateTime(dict["ssl_txn_time"]);
    //                    objpp.StudentNo = Convert.ToInt32(dict["StudentID"]);
    //                    SqlPaymentRepository obj = new SqlPaymentRepository();
    //                    obj.InsertPaymentTransactionWithSuccess(objpp);
    //                }
    //                catch (System.Data.SqlClient.SqlException ex)
    //                {

    //                    throw ex;
    //                }
    //            }


    //        }
    //    }
    //}

    

</script>


<html>
<head runat="server">
    <meta name="viewport" content="width=device-width" />
    <title>PaymentExecution</title>
</head>
<body>
    <div>
    </div>
</body>
</html>
