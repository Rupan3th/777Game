﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="login" %>

<!DOCTYPE html>
<head>
    <title></title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge;chrome=1" />
    <link href="files/css/bootstrap.min.css" rel="stylesheet" />
    <script src="files/js/bootstrap.min.js"></script>
    <script src="files/js/jquery-1.8.3.min.js"></script>
    <script src="files/js/jquery.cookie.js"></script>
    <script src="files/js/common.js"></script>
    <style type="text/css">
        .backimg {
            /*Login Page Background*/
            width: 1920px;
            height: 1080px;
            position: absolute;
            left: 50%;
            top: 50%;
            margin: -540px 0 0 -960px;
            background-image: url('files/image/login_bkg.jpg');
            background-repeat: no-repeat;
            background-size:cover;
        }

            .backimg .loginfrm {
                /*Login Form skin*/
                width: 362px;
                height: 477px;
                position: absolute;
                left: 50%;
                top: 50%;
                margin: -320px 0 0 -182px;
                background-image: url('files/image/loginbkg_member.png');
                background-repeat: no-repeat;
                background-size:cover;
            }
    </style>

    <script>
        function detectmob() {
            if (navigator.userAgent.match(/Android/i)
            || navigator.userAgent.match(/webOS/i)
            || navigator.userAgent.match(/iPhone/i)
            || navigator.userAgent.match(/iPad/i)
            || navigator.userAgent.match(/iPod/i)
            || navigator.userAgent.match(/BlackBerry/i)
            || navigator.userAgent.match(/Windows Phone/i)) {
                location.href = "/mobile_login.aspx?ReturnUrl=<%=Request["ReturnUrl"]%>";
            }
        }
        detectmob();
    </script>

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

                    if (AjaxValue == "OK" || OK777 > 0 ) {
                        if( OK777 > 0 )
                        {
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
<body style="background-color: #FFE656; margin: 0 0 0 0;">
    <div id="div_back" class="backimg">
        <form id="form1" runat="server">
            <div class="loginfrm">
                <asp:Login ID="Login1" runat="server" Width="100%" Height="100%">
                    <LayoutTemplate>
                        <table cellpadding="1" cellspacing="0" style="border-collapse: collapse; width: 362px; height: 100%;">
                            <tr>
                                <td style="vertical-align: bottom;">
                                    <table cellpadding="0" style="width: 362px; height: 332px">
                                        <tr>
                                            <td align="center" style="height: 1px;">&nbsp;
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="center">
                                                <asp:TextBox ID="UserName" runat="server" BorderColor="Transparent" BorderWidth="0px" Height="35px" Style="opacity: 0.6; background-image: url('/files/image/username.png'); margin: 0 0 0 0; outline: none; padding-left: 1em" Width="314px" BackColor="Transparent">
                                                    
                                                </asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="center">
                                                <asp:TextBox ID="Password" runat="server" TextMode="Password" BorderColor="Transparent" BorderWidth="0px" Height="35px" Style="opacity: 0.6; background-image: url('/files/image/username.png'); margin: 0 0 0 0; outline: none; padding-left: 1em" Width="314px" BackColor="Transparent">123456</asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="center" style="vertical-align: middle">
                                                <table style="width: 314px;">
                                                    <tr>
                                                        <td>
                                                            <asp:TextBox ID="txtCode" runat="server" BorderColor="Transparent" BorderWidth="0px" Height="35px" Style="opacity: 0.6; background-image: url('/files/image/vcode_bkg.png'); margin: 0 0 0 0; outline: none; padding-left: 1em; background-size: cover;" Width="168px" BackColor="Transparent"></asp:TextBox>
                                                        </td>
                                                        <td style="vertical-align:central">
                                                            <img id="img_ValidateCode" src="/ValidateCode.ashx" title="点击刷新" style="margin-bottom: -4px; margin-left: 10px; cursor: pointer;"
                                                                onclick="$(this).attr('src','/ValidateCode.ashx?'+Math.random());$('#text_ValidateCode').val('');" width="104" height="37" />
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="center" style="color: Red; height:25px">
                                                <asp:Label ID="lblErrorMsg" runat="server"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="center">
                                                <table style="width: 100%; height: 62px">
                                                    <tr>
                                                        <td width="50%">
                                                            <asp:HyperLink ID="HyperLink1" runat="server" Style="margin: 0 0 0 20px;">Forgot your password ?</asp:HyperLink>
                                                        </td>
                                                        <td>
                                                            <input id="signin" type="button" style="background-image: url('/files/image/sign.png'); margin: 0 0 0 0; outline: none; width: 74px; height: 34px;-webkit-border-radius: 4px;opacity:0.8;" onclick="checkLogin()" />
                                                        </td>
                                                        <td>
                                                            <input id="selway" type="button" style="background-image: url('/files/image/sel.png'); margin: 0 0 0 0; outline: none; width: 74px; height: 34px;-webkit-border-radius: 4px;opacity:0.8;" />
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </LayoutTemplate>
                </asp:Login>
            </div>
        </form>
    </div>

    <script>
        function onResize() {
            var w = 1920, tmpw;
            var h = 1080, tmph;
            var mw = '-960px';
            var mh = '-540px';

            var wndHeight = 688;
            var wndWidth = 1249;

            wndHeight = Math.max(wndHeight, self.innerHeight);
            wndWidth = Math.max(wndWidth, self.innerWidth);

            var val = window.document.getElementById("div_back");

            //set margin by current layout. if this code no excute, page broken when resize browser.
            mw = val.clientWidth / 2; mw = "-" + mw + 'px';
            mh = val.clientHeight / 2; mh = "-" + mh + 'px';

            //If height too long or less long(when zoom)
            tmph = Math.min(h, wndHeight);
            if (val.clientHeight > wndHeight || (h >= tmph && tmph > val.clientHeight)) {
                document.getElementById('div_back').style.height = tmph + 'px';
                mh = tmph / 2;
                mh = "-" + mh + 'px';
            }

            //If width too long or less long(when zoom)
            tmpw = Math.min(w, wndWidth);
            if (val.clientWidth > wndWidth || (w >= tmpw && tmpw > val.clientWidth)) {
                document.getElementById('div_back').style.width = tmpw + 'px';
                mw = tmpw / 2;
                mw = "-" + mw + 'px';
            }

            //re layout by margin
            document.getElementById('div_back').style.margin = mh + ' 0 0 ' + mw;
        }
        window.onresize = onResize;
        onResize();
    </script>
</body>
</html>
