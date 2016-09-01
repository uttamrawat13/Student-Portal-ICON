using System.Net.Mail;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.IO;
using System.Net;

/// <summary>
/// Summary description for sendmail
/// </summary>
public class sendmail
{
	 private static sendmail instance;

     private sendmail() { }

     public static sendmail Instance
    {
        get
        {
            if (instance == null)
            {
                instance = new sendmail();
            }
            return instance;
        }
    }

     private string _fn, _ln, _amt, _module, _tid, _tdate, _msg;
     public string fn { get { return _fn; } set { _fn = value; } }
     public string ln { get { return _ln; } set { _ln = value; } }
     public string amt { get { return _amt; } set { _amt = value; } }
     public string tid { get { return _tid; } set { _tid = value; } }
     public string tdate { get { return _tdate; } set { _tdate = value; } }
     public string msg { get { return _msg; } set { _msg = value; } }
     

     public bool MailGo(string strHTML, string From, string Too, string Subject, string SMTP, string pass)
     {
         bool sucess = true;
         try
         {
             
             System.Net.Mail.MailMessage mailUserAdmin = new System.Net.Mail.MailMessage();
             mailUserAdmin.From = new MailAddress(From,"Diamond SIS Mailer");
             mailUserAdmin.To.Add(Too);
             mailUserAdmin.Subject = Subject;
             mailUserAdmin.IsBodyHtml = true;
             mailUserAdmin.Body = strHTML;           
             SmtpClient smtp = new SmtpClient();
             smtp.Host = "smtp.gmail.com";
             smtp.EnableSsl = true;
             smtp.DeliveryMethod = SmtpDeliveryMethod.Network;
             NetworkCredential NetworkCred = new NetworkCredential(From, pass);
             smtp.UseDefaultCredentials = false;
             smtp.Credentials = NetworkCred;
             smtp.Port = 587;
             smtp.Send(mailUserAdmin);
         }
         catch ( Exception ex)
         {
             sucess = false;
             throw;
         }
         return sucess;

     }


     public string PopulateBody(string templateurl)
     {
         string body = string.Empty;
         StreamReader reader = new StreamReader(templateurl);
         body = reader.ReadToEnd();
         body = body.Replace("[FN]", _fn);
         body = body.Replace("[LN]", _ln);
         body = body.Replace("[amt]", _amt);
         body = body.Replace("[tid]", _tid);
         body = body.Replace("[tdate]", _tdate);
         body = body.Replace("[msg]", _msg);
         return body;
     }
}