using Razorpay.Api;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Project   
{
    public partial class RazorPayCheckout : System.Web.UI.Page
    {
        public string orderId;
        public string amount;
        public Int32 amt;
        public string contact;
        public string name;

        protected void Page_Load(object sender, EventArgs e)
        {
            amt = Convert.ToInt32(Request.QueryString["txtAmount"]);
            amount = (amt * 100).ToString();
            contact = Request.QueryString["Mobile"].ToString();
            name = Request.QueryString["Name"].ToString();

            Dictionary<string, object> input = new Dictionary<string, object>();
            input.Add("amount", amount);
            input.Add("currency", "INR");
            input.Add("payment_capture", 1);

            string key = "rzp_test_umVB9Mp8JHkULA";
            string secret = "Zli6kv5oS6borMawz3IeTwoe";

            RazorpayClient client = new RazorpayClient(key, secret);

            Razorpay.Api.Order order = client.Order.Create(input);
            orderId = order["id"].ToString();
        }
    }
}