<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="houtai_game_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script>
       
        var xmlHttp;
        function srvTime() {
            if (window.XMLHttpRequest) {//분기하지 않으면 IE에서만 작동된다.
                xmlHttp = new XMLHttpRequest(); // IE 7.0 이상, 크롬, 파이어폭스 등
                xmlHttp.open('HEAD', 'http://localhost:64965/houtai/game/Default.aspx', false);
                xmlHttp.setRequestHeader("Content-Type", "text/html");
                xmlHttp.send('');
                return xmlHttp.getResponseHeader("Date");
            } else if (window.ActiveXObject) {
                xmlHttp = new ActiveXObject('Msxml2.XMLHTTP');
                xmlHttp.open('HEAD', window.location.href.toString(), false);
                xmlHttp.setRequestHeader("Content-Type", "text/html");
                xmlHttp.send('');
                return xmlHttp.getResponseHeader("Date");
            }
        }
        var st = srvTime();
        var today = new Date(st);
        var times = today.getHours() * 3600 + today.getMinutes() * 60 + today.getSeconds();
        var remain_gtime = times % 60;
        //var round = parseInt(times / 120) + 1;
   
        var sectime = remain_gtime;
        setInterval(function () {
            sectime = sectime + 1;
            if (sectime == 60) {
                sectime = 0;                
            }
           
            document.getElementById('gametime').value = sectime;
        }, 1000);

    </script>
    <style type="text/css">
        #gametime {
            width: 35px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
    <div>
    
        <p>
            sec timmer&nbsp;&nbsp; <input type='text' id='gametime' class='lhj_input lhj_bet_input' value='0' />
        </p>
        
        Fruit number<asp:TextBox ID="TextBox1" runat="server" text="1" style="margin-left: 40px"></asp:TextBox>
    
    </div>
    <div>
    
        Dice1 point<asp:TextBox ID="TextBox2" runat="server" text="1" style="margin-left: 50px"></asp:TextBox>
    
    </div>
    <div>
    
        Dice2 point<asp:TextBox ID="TextBox3" runat="server" text="1" style="margin-left: 50px"></asp:TextBox>
    
    </div>
    <div style="height: 27px">
    
        Dice3 point<asp:TextBox ID="TextBox4" runat="server" text="1" style="margin-left: 50px"></asp:TextBox>
    
        <br />
    
    </div>
        
        </div>
        
        game result value&nbsp;&nbsp;&nbsp;
        <asp:Button ID="Button2" runat="server" OnClick="Button1_Click" Text=" 결정 " />
        
        <asp:TextBox ID="TextBox8" runat="server" Width="79px" text="0"></asp:TextBox>
        
        회차 게임이 결정되였습니다.<p>
            결과&nbsp;&nbsp; <asp:TextBox ID="TextBox6" runat="server"></asp:TextBox>
        </p>
        <div>
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>    
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                &nbsp;&nbsp; 현재시간 :<asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
                <p>    
                    round : <asp:TextBox ID="TextBox5" runat="server" Width="77px" ></asp:TextBox>                       
                    &nbsp; Count down&nbsp;
                    <asp:TextBox ID="TextBox7" runat="server" Width="38px"></asp:TextBox>
                    &nbsp;&nbsp;&nbsp;
                    <asp:TextBox ID="TextBox9" runat="server" Width="23px"></asp:TextBox>
                    <asp:TextBox ID="TextBox10" runat="server" Width="16px"></asp:TextBox>
                    <asp:TextBox ID="TextBox11" runat="server" Width="16px"></asp:TextBox>
                    <asp:TextBox ID="TextBox12" runat="server" Width="16px"></asp:TextBox>
                </p>
                <asp:Timer ID="Timer1" runat="server" Interval="1000" 
                    ontick="Timer1_Tick">
                </asp:Timer>
            </ContentTemplate>
        </asp:UpdatePanel>
        <br />
    
    </div>
           

    </form>


</body>
    
</html>
