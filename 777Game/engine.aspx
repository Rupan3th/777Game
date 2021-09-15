<%@ Page Language="C#" AutoEventWireup="true" CodeFile="engine.aspx.cs" Inherits="_777Game_engine" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>水果老虎机engine</title>

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
            <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>    
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    &nbsp;&nbsp;&nbsp; 현재시간 : <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>           
                    &nbsp;&nbsp;&nbsp; 역계수기 : <asp:TextBox ID="TextBox7" runat="server" Width="38px"></asp:TextBox>     </br>
                    <p>    
                        &nbsp;&nbsp;&nbsp; 회 차 : <asp:TextBox ID="TextBox5" runat="server" Width="77px" ></asp:TextBox>   
                        &nbsp;&nbsp;&nbsp; 수익률 : <asp:TextBox ID="TextBox17" runat="server" Width="50px" ></asp:TextBox>
                         &nbsp;&nbsp;&nbsp; Hong : <asp:TextBox ID="TextBox19" runat="server" Width="100px" ></asp:TextBox>  </br></br>

                        &nbsp;&nbsp;&nbsp; 슬롯머신
                        <asp:TextBox ID="TextBox9" runat="server" Width="23px"></asp:TextBox> 
                        &nbsp;&nbsp;&nbsp; 라크
                        <asp:TextBox ID="TextBox13" runat="server" Width="16px"></asp:TextBox>
                        <asp:TextBox ID="TextBox14" runat="server" Width="16px"></asp:TextBox>
                        <asp:TextBox ID="TextBox15" runat="server" Width="16px"></asp:TextBox>
                        <asp:TextBox ID="TextBox16" runat="server" Width="16px"></asp:TextBox></br>

                        &nbsp;&nbsp;&nbsp; 다이사이
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

        <div>
            <div>
                ********************* 수동결정 *********************             
            </div></br>
            <div>                
                Fruit number<asp:TextBox ID="TextBox1" Width="40px"  runat="server" text="1" style="margin-left: 10px"></asp:TextBox>
                &nbsp;&nbsp;&nbsp;&nbsp;Luck Type(1~8)<asp:TextBox ID="TextBox18" Width="30px"  runat="server" text="1" style="margin-left: 10px"></asp:TextBox></br>
                ------------------------------------------------------------------------------------------</br>
                6일때 &nbsp;&nbsp;&nbsp;&nbsp 1: 대3(종,망고,오렌지)A, 2: 대3(종,망고,오렌지)B, 3: 소3(종,망고,오렌지), 4: 련3</br>
                18일때 &nbsp;&nbsp 5: 대3(77,별,수박),  6: 소3(77,별,수박),  7: 대4(사과*4),  8:련4</br>
                -------------------------------------------------------------------------------------------
            </div>
            <div>    
                Dice1 point<asp:TextBox ID="TextBox2" Width="30px" runat="server" text="1" style="margin-left: 50px"></asp:TextBox>
            </div>
            <div>    
                Dice2 point<asp:TextBox ID="TextBox3" Width="30px" runat="server" text="1" style="margin-left: 50px"></asp:TextBox>    
            </div>
            <div style="height: 27px">    
                Dice3 point<asp:TextBox ID="TextBox4" Width="30px" runat="server" text="1" style="margin-left: 50px"></asp:TextBox>    
                <br />    
            </div>
        </div>
        
        game result value&nbsp;&nbsp;&nbsp;
        <asp:Button ID="Button2" runat="server" OnClick="Button1_Click" Text=" 결정 " />        
        <asp:TextBox ID="TextBox8" runat="server" Width="79px" text="0"></asp:TextBox>        
        회차 게임이 결정되였습니다.
        <p>
            결과&nbsp;&nbsp; <asp:TextBox ID="TextBox6" runat="server"></asp:TextBox></br>
            ****************************************************
        </p>            
    </div>
    </form>
</body>
</html>
