using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Web;

namespace El_Proffesora.Admin.BL
{
    public class SendSms
    {
        public static bool SendMessage(string Number, string Message)
        {
            try
            {
                // Lifetimesms.com POST URL
                string url = "http://Lifetimesms.com/plain?username=un&password=pass";
                // XML-formatted data

                string senderSender = "CompanyName";
                string mobileMobile = Number;
                string messageMessage = Message;


                string fields = "&to=" + mobileMobile +
                "&from=" + senderSender + "&message=" + messageMessage;

                url = url + fields;



                // web request start

                Uri uri = new Uri(url);
                string data = "field-keywords=ASP.NET2.0";

                if (uri.Scheme == Uri.UriSchemeHttp)
                {
                    // create a request on behalf of uri
                    HttpWebRequest request =
                    (HttpWebRequest)HttpWebRequest.Create(uri);
                    // setting parameter for the request
                    request.Method = WebRequestMethods.Http.Post;
                    request.ContentLength = data.Length;
                    request.ContentType = "application/x-www-form-urlencoded";
                    // a stream writer for the request
                    StreamWriter writer = new
                    StreamWriter(request.GetRequestStream());
                    // write down the date
                    writer.Write(data);
                    //close the stream writer
                    writer.Close();
                    // GET / POSTting response from the request
                    HttpWebResponse response =
                    (HttpWebResponse)request.GetResponse();
                    // GET / POST the stream associated with the response.
                    Stream receiveStream = response.GetResponseStream();
                    // Pipes the stream to a higher level stream reader

                    //with the required encoding format.
                    StreamReader readStream = new
                    StreamReader(receiveStream, System.Text.Encoding.UTF8);


                    // to write a http response from the characters

                    //response.Write(readStream.ReadToEnd());
                    // close the response

                    response.Close();
                    // close the reader

                    readStream.Close();

                }
                return true;
            }
            catch (Exception exp)
            {
                return false;
                // catch for unhelded exception
                //Response.Write(exp.Message);
            }




        }

        public static bool send(string Number, string Message)
        {
            string MyUsername = "";
            string MyPassword = "";
            string toNumber = Number; //Your cell phone number with country code
            string Masking = "Online Learning"; //Your Company Brand Name
            string MessageText = Message;
            string jsonResponse = SendSMS(Masking, toNumber, MessageText, MyUsername, MyPassword);
            Console.Write(jsonResponse);

            if (jsonResponse == "-3 :Sender ID cant be greater than 11 characters")
            {
                return false;
            }
            else
            {
                return true;
            }
        }
        public static string SendSMS(string Masking, string toNumber, string MessageText, string MyUsername, string MyPassword)
        {
            String URI = "http://Lifetimesms.com" +
            "/plain?" +
            "username=" + MyUsername +
            "&password=" + MyPassword +
            "&from=" + Masking +
            "&to=" + toNumber +
            "&message=" + Uri.UnescapeDataString(MessageText); // Visual Studio 10-15
                                                               //  "//&message=" + System.Net.WebUtility.UrlEncode(MessageText);// Visual Studio 12
            try
            {
                WebRequest req = WebRequest.Create(URI);
                WebResponse resp = req.GetResponse();
                var sr = new System.IO.StreamReader(resp.GetResponseStream());
                return sr.ReadToEnd().Trim();
            }
            catch (WebException ex)
            {
                var httpWebResponse = ex.Response as HttpWebResponse;
                if (httpWebResponse != null)
                {
                    switch (httpWebResponse.StatusCode)
                    {
                        case HttpStatusCode.NotFound:
                            return "404:URL not found :" + URI;
                            break;
                        case HttpStatusCode.BadRequest:
                            return "400:Bad Request";
                            break;
                        default:
                            return httpWebResponse.StatusCode.ToString();
                    }
                }
            }
            return null;
        }
    }
}