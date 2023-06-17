using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;

namespace El_Proffesora.Admin.BL
{
    public class SendEmail
    {
        public static bool SendMail(string ToEmail, string subject, string Body)
        {
            try
            {
                MailMessage mail = new MailMessage();
                mail.To.Add(ToEmail);
                // mail.To.Add("Another Email ID where you wanna send same email");
                mail.From = new MailAddress("emailid", "Online Learning");
                mail.Subject = subject;
                mail.Body = Body;
                mail.IsBodyHtml = true;
                SmtpClient smtp = new SmtpClient();
                smtp.Host = "smtp.gmail.com"; //Or Your SMTP Server Address
                smtp.Credentials = new NetworkCredential("emailid", "password");
                //Or your Smtp Email ID and Password
                smtp.EnableSsl = true;
                smtp.Send(mail);
                return true;
            }
            catch (Exception e)
            {
                return false;
            }
        }
    }
}