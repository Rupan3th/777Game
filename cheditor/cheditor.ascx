<%@ Control Language="C#" AutoEventWireup="true" CodeFile="cheditor.ascx.cs" Inherits="cheditor_cheditor" %>
<meta charset="utf-8">
<script src="/cheditor/ckeditor.js"></script>
<%--<link rel="stylesheet" href="/cheditor/sample.css">--%>

<div>
    <textarea id="editor1" name="editor1" style="width: 648px;height: 281px;">
</textarea>
    <script>
        CKEDITOR.replace('editor1', {
            // Load the German interface.
            language: 'zh-cn'
        });
</script>
</div>
