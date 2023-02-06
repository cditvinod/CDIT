using System;
using System.Data;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Collections.Generic;
using System.Net;
using System.IO;

public class SMS
{
    public static int SendSMS(string mobileNo, string message)
    {
        int retVal = 0;
        try
        {
            string result = APICall("http://bulksms.cdit.in/rest/services/sendSMS/sendGroupSms?AUTH_KEY=d13c14b91f6fc673ddfeead42c213258&message=" + message + "&senderId=CHAIDB&routeId=1&mobileNos=" + mobileNo + "&smsContentType=english");            
            if (result.Contains(" incorrect username or password"))
                retVal = 0;
            else
                retVal = 1;
        }
        catch
        {
        }
        return retVal;
    }
    private static string APICall(string url)
    {
        HttpWebRequest httpreq = (HttpWebRequest)WebRequest.Create(url);
        try
        {
            HttpWebResponse httpres = (HttpWebResponse)httpreq.GetResponse();
            StreamReader sr = new StreamReader(httpres.GetResponseStream());
            string results = sr.ReadToEnd();
            sr.Close();
            return results;
        }
        catch
        {
            return "0";
        }
    }
}