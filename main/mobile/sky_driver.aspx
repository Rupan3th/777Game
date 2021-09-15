<%@ Page Language="C#" AutoEventWireup="true" CodeFile="sky_driver.aspx.cs" Inherits="main_sky_driver" %>

<!DOCTYPE html>

<html>
<head runat="server">
    <title></title>
    <meta name="viewport" content="user-scalable=no, width=500px" />
    <%--<meta name="viewport" content="width=device-width,initial-scale=1.0">--%>
    <link href="/files/css/bootstrap.min.css" rel="stylesheet" />
    <link href="/files/css/mobile_common.css" rel="stylesheet" />

    <script src="/files/js/jquery-1.8.3.min.js"></script>
    <script src="/files/js/jquery.cookie.js"></script>
    <script src="/files/js/common.js"></script>
    <script src="/files/js/jquery.cookie.js"></script>
    <script src="/files/js/jquery-ui.js"></script>

    <style type="text/css">
        .gamefrm_space {
            /*Set space game form*/
            padding-right: 0;
        }
        body{        
         margin-left: 0px;
         margin-top: 0px;
         margin-right: 0px;
         margin-bottom: 0px;
         overflow-y: hidden;
         overflow-x: hidden;       
        }
       
    </style>
    
</head>
<body>
    <table style="position: absolute; width: 500px; height: 100%" class="table_form">
        <tr>
            <td style="height: 10px">
                <div style="background-color: #232323; height: 10px; width: 100%; display: table;">
                    <span style="padding-left: 10px; display: table-cell; vertical-align: middle;"></span>
                </div>
            </td>
        </tr>
        <tr>
            <td style="height: 60px">
                <div class="dropdown" style="white-space: nowrap; background-color: #323232; height: 60px; text-align: left; display: table;">
                    <div style="float: left; width: 5%; height: 100%;">
                        &nbsp;
                    </div>
                    <div style="float: left; width: 75%; height: 100%; display: table;">
                        <span style="display: table-cell; vertical-align: middle;text-align:center;height:80%;width:100%;">
                            <marquee id="notice" behavior="scroll" direction="left" style="display: table-cell;width: 500px; height: 55%; color: crimson; background-color: white; font-size: 20px; vertical-align:middle;text-align:center;"></marquee>
                        </span>
                    </div>
                    <div style="float: left; width: 5%; height: 100%;">
                        &nbsp;
                    </div>
                    <img src="/files/image/mobile_menu.png" onclick="myFunction()" class="dropbtn" style="vertical-align:top; height:80%;" />
                    <div id="myDropdown" class="dropdown-content" style=" z-index: 100;">
                        <a href="javascript:menu_clicked(0);myFunction();">个人中心</a>
                        <a href="javascript:menu_clicked(1);myFunction();">在线客服</a>
                        <a href="javascript:menu_clicked(2);myFunction();">在线财务</a>
                        <a href="javascript:menu_clicked(3);">退出</a>
                    </div>
                    <script>
                        function menu_clicked(menu_id) {
                            switch (menu_id) {
                                case 0://home
                                    var gourl = PostAjax("/Ajax/goGeren.ashx");
                                    window.open(gourl, "user_page", true);
                                    break;
                                case 1://
                                    window.open("<% Response.Write(ConfigurationManager.AppSettings["BankChatUrl"].ToString());%>", "user_page", true);
                                    break;
                                case 2://
                                    window.open("<% Response.Write(ConfigurationManager.AppSettings["BankChatUrl"].ToString());%>", "user_page", true);
                                    break;
                                case 3://
                                    location.href = "?act=5";
                                    break;
                                    }
                                }
                    </script>
                </div>
            </td>
        </tr>
        <tr>
            <td style="vertical-align:top;text-align:center;">
                <%--<iframe id="user_page" name="user_page" style="border: 0px hidden; width: 100%; display: table;height:100%;" src="/main/mobile/home.aspx"></iframe>--%>
                <iframe id="user_page" name="user_page" src="/main/mobile/home.aspx" style="height:100%;width:500px ;overflow-y:hidden; overflow-x:hidden"></iframe>
            </td>
        </tr>
    </table>
</body>
</html>
<script type="text/javascript">
    /* When the user clicks on the button,
    toggle between hiding and showing the dropdown content */
    function myFunction() {
        document.getElementById("myDropdown").classList.toggle("show");
    }

    var noticetext = PostAjax("/Ajax/media_notice.ashx", "");
    jQuery("#notice").text(noticetext);
</script>