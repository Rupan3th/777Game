<%@ Page Language="C#" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="login" %>

<!DOCTYPE html>
<head>
    <title></title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge;chrome=1" />
    <link href="files/css/mobile-login.css" rel="stylesheet" />
    <script src="files/js/jquery-1.8.3.min.js"></script>
    <script src="files/js/jquery.cookie.js"></script>
    <script src="files/js/common.js"></script>

    <script type="text/javascript">
        function showResult(errorMsg) {
            document.getElementById('Login1_lblErrorMsg').textContent = errorMsg;
        }

        function checkLogin() {
            var name = $("#Login1_UserName").val();
            var pwd = $("#Login1_Password").val();
            var vcode = $("#Login1_txtCode").val();
            var retUrl = "<%=Request["ReturnUrl"]%>";

            showResult("登录中...");

            if (name == "") {
                showResult('用户名不能为空！');
            } else if (pwd == "") {
                showResult('密码不能为空！');
            } else if (vcode.length < 4) {
                showResult('验证码有误！');
            }
            else {
                setTimeout(function () {
                    var AjaxValue = PostAjax("/Auth/Login.aspx", "name=" + escape(name) + "&pwd=" + escape(pwd) + "&vcode=" + vcode + "&r=" + Math.random());
                    var OK777 = AjaxValue.indexOf("tm");
                    $.cookie('trialtimeout', null, { path: '/' });

                    if (AjaxValue == "OK" || OK777 > 0) {
                        if (OK777 > 0) {
                            globTmOut = AjaxValue.replace("/tm/", "");
                            $.cookie('trialtimeout', globTmOut, { path: '/' });
                        }

                        if (retUrl == "")
                            window.location = "/";
                        else
                            window.location = retUrl;
                        return;
                    } else if (AjaxValue == "-1") {
                        showResult('请输入正确的账号密码！');
                    } else if (AjaxValue == "-2") {
                        showResult('请输入正确的验证码！');
                    } else {
                        showResult(AjaxValue);
                    }
                    $(".button_Login").show();
                    $(".button_Login_Loading").hide();
                    $("#text_PassWord").val('');
                    $("#text_ValidateCode").val('');
                    $("#img_ValidateCode").attr('src', '/ValidateCode.ashx?' + Math.random());
                }, 500);
            }
        }
    </script>
</head>
<body style="background-color: #f4f4f4; margin: 0 0 0 0;">
    <form id="form1" runat="server">
        <asp:Login ID="Login1" runat="server" Width="100%" Height="100%">
            <LayoutTemplate>
                <div style="text-align: center; margin-top: 80px;">
                    <img src="/files/image/mobile/mobilelogo.png" alt="" width="349" height="163" style="vertical-align: middle;">
                </div>
                <div class="toptextfield" style="text-align: center;">
                    <asp:TextBox ID="UserName" runat="server" class="textfieldtop cn" placeholder="用户名"></asp:TextBox>
                </div>
                <div class="btmtextfield" style="text-align: center;">
                    <asp:TextBox ID="Password" runat="server" TextMode="Password" class="textfieldbtm cn" placeholder="密码"></asp:TextBox>
                </div>
                <div class="capchatextfield">
                    <asp:TextBox ID="txtCode" runat="server" class="textfieldcapcha cn" placeholder="验证码" maxlength="4" pattern="\d*"></asp:TextBox>
                    <div class="capchaposition">
                        <img id="img_ValidateCode" src="/ValidateCode.ashx" title="点击刷新" width="165" height="66" alt="" onclick="$(this).attr('src','/ValidateCode.ashx?'+Math.random());$('#text_ValidateCode').val('');">
                    </div>
                </div>
                <div style="text-align: center; padding-top: 10px;">
                    <asp:Label ID="lblErrorMsg" runat="server">&nbsp;</asp:Label>
                </div>
                <div class="submitgap">
                    <input id="signin" name="submit" type="button" class="submitbtn cn" id="submit" value="登录" onclick="checkLogin()">
                </div>
            </LayoutTemplate>
        </asp:Login>
    </form>
</body>
</html>
