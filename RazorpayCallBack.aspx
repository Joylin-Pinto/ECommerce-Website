<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RazorpayCallBack.aspx.cs" Inherits="Project.RazorpayCallBack" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
             <div class="jumbotron">
                        <h2 runat="server" id="h1Message"></h2>
                        <p runat="server" id="pTxnId"></p>
                        <p runat="server" id="pOrderId"></p>
                    </div>
                    <br />
                    <asp:Button ID="Button1" runat="server" CssClass="btn btn-primary" Font-Size="Large" Text="Back To Products" OnClick="Button1_Click" />
                </div>
    </form>
</body>
</html>
