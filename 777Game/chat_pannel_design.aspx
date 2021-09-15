<!DOCTYPE html>
<html>
<head>
    <title></title>
	<meta charset="utf-8" />
    <link href="/files/css/bootstrap.css" rel="stylesheet" />
</head>
<body style="padding:50px">
    <form id="form1" runat="server">
    <asp:Panel ID="Panel1" runat="server" BorderWidth="1px" Width="1500px" style="margin:0 auto;padding:10px" align="center">
        Chat pannel Design(writted by kcs)[div{class="column3 fix" style="margin-right: 0px;"}]
        <asp:Panel ID="Panel2" runat="server" BorderWidth="1px" style="margin:0 auto;padding:10px;text-align:left;" align="center">
            div{room-chat-panel}
            <asp:Panel ID="Panel3" runat="server" BorderWidth="1px" style="margin:0 auto;padding:10px;text-align:left;" align="center">
                div{room-chat-body[chat_body]}
                <asp:Panel ID="Panel4" runat="server" BorderWidth="1px" style="margin:0 auto;padding:10px;text-align:left;" align="center">
                    div{watch-chat[watchChat]}
                    <asp:Panel ID="Panel5" runat="server" BorderWidth="1px" style="margin:0 auto;padding:10px;text-align:left;" align="center">
                        div{watch-chat-box room-chat-bg[all_chat]}
                        <asp:Panel ID="Panel8" runat="server" BorderWidth="1px" style="margin:0 auto;padding:10px;text-align:left;" align="center">
                            div{gift-public scroll-bar[watchGift_pub]}

                        </asp:Panel>
                        <asp:Panel ID="Panel9" runat="server" BorderWidth="1px" style="margin:0 auto;padding:10px;text-align:left;" align="center">
                            div{room_notice[]}
                            방공지사항보여주는 div
                        </asp:Panel>
                        <asp:Panel ID="Panel10" runat="server" BorderWidth="1px" style="margin:0 auto;padding:10px;text-align:left;" align="center">
                            div{chat-public scroll-bar[watchChat_pub]}

                        </asp:Panel>
                        <asp:Panel ID="Panel11" runat="server" BorderWidth="1px" style="margin:0 auto;padding:10px;text-align:left;" align="center">
                            div{chat-private scroll-bar[watchChat_pri]}
                            자신에게만오는 차팅문자보여주기 현재는 리용되지 않는다.
                        </asp:Panel>
                        <asp:Panel ID="Panel12" runat="server" BorderWidth="1px" style="margin:0 auto;padding:10px;text-align:left;" align="center">
                            div{chat-bar[watchChat_slideBar]}분리띠 현재는 리용되지 않는다. 

                        </asp:Panel>
                        <asp:Panel ID="Panel13" runat="server" BorderWidth="1px" style="margin:0 auto;padding:10px;text-align:left;" align="center">
                            div{radio-room[]}

                        </asp:Panel>
                    </asp:Panel>
                    <asp:Panel ID="Panel6" runat="server" BorderWidth="1px" style="margin:0 auto;padding:10px;text-align:left;" align="center">
                        div{watch-talk-box room-chat-bg[only_chat]}귀속말차팅만보여준다. 현재는 리용되지 않는다.
                        
                        <asp:Panel ID="Panel14" runat="server" BorderWidth="1px" style="margin:0 auto;padding:10px;text-align:left;" align="center">
                            div{pubHandBox[]}

                        </asp:Panel>
                        <asp:Panel ID="Panel15" runat="server" BorderWidth="1px" style="margin:0 auto;padding:10px;text-align:left;" align="center">
                            div{pubHandBox[]}

                        </asp:Panel>
                        <asp:Panel ID="Panel16" runat="server" BorderWidth="1px" style="margin:0 auto;padding:10px;text-align:left;" align="center">
                            div{talk-tome[watchTalk_me]}

                        </asp:Panel>
                        <asp:Panel ID="Panel17" runat="server" BorderWidth="1px" style="margin:0 auto;padding:10px;text-align:left;" align="center">
                            div{talk-public scroll-bar[]}

                        </asp:Panel>
                        <asp:Panel ID="Panel18" runat="server" BorderWidth="1px" style="margin:0 auto;padding:10px;text-align:left;" align="center">
                            div{talk-private scroll-bar[]}

                        </asp:Panel>
                        <asp:Panel ID="Panel19" runat="server" BorderWidth="1px" style="margin:0 auto;padding:10px;text-align:left;" align="center">
                            div{talk-bar[watchTalk_slideBar]}

                        </asp:Panel>
                    </asp:Panel>
                    <asp:Panel ID="Panel7" runat="server" BorderWidth="1px" style="margin:0 auto;padding:10px;text-align:left;" align="center">
                        div{watch-chat-act[chatForm]}
                        <asp:Panel ID="Panel20" runat="server" BorderWidth="1px" style="margin:0 auto;padding:10px;text-align:left;" align="center">
                            div{chat-set[]} 차팅대상에 대한 선택, 리모티콘선택, 선물선택을 할수 있다.

                        </asp:Panel>
                        <asp:Panel ID="Panel21" runat="server" BorderWidth="1px" style="margin:0 auto;padding:10px;text-align:left;" align="center">
                            div{chat-txt[]}
                            입력칸에 문자를 입력하고 전송단추를 누루면 문자가 전송된다.
                        </asp:Panel>
                    </asp:Panel>
                </asp:Panel>
            </asp:Panel>
        </asp:Panel>
    </asp:Panel>
    </form>
</body>
</html>
