<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="books.aspx.cs" Inherits="BOOKSHOP.books" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <table>
        <tr>
            <td>
                <asp:Label ID="lblbookname" runat="server" Text="Book Name"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txt_bookname" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="r1" runat="server"  ErrorMessage="*" ControlToValidate="txt_bookname" ForeColor="Red" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblauthor" runat="server" Text="Author"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txt_author" runat="server"></asp:TextBox>
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txt_author" ErrorMessage="*" ForeColor="Red" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblpublisher" runat="server" Text="Publisher"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txt_publisher" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txt_publisher" ErrorMessage="*" ForeColor="Red" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblprice" runat="server" Text="Price"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txt_price" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txt_price" ErrorMessage="*" ForeColor="Red" />
                
                           </td>
        </tr>
        <tr>
            <td>
                <asp:Button ID="btnsubmit" runat="server" Text="submit" OnClick="btnsubmit_Click" style="height: 26px" />
            </td>
            <td>
                <asp:Button ID="btnreset" runat="server" Text="reset" OnClick="btnreset_Click" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblalert" runat="server"></asp:Label>
            </td>
        </tr>
    </table>
        <asp:GridView ID="gridview1" runat="server"  AutoGenerateColumns="false"  OnRowCancelingEdit="gridview1_RowCancelingEdit" OnRowEditing="gridview1_RowEditing"  OnRowDeleting="gridview1_RowDeleting" OnRowUpdating="gridview1_RowUpdating1" >
            <Columns>
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:Button ID="btn_edit" runat="server" Text="edit" CausesValidation="false" CommandName="Edit" />
                    </ItemTemplate>
                    </asp:TemplateField>
                    
                    <asp:TemplateField>
                    <ItemTemplate>
                    <asp:Button ID="btn_update" runat="server" CausesValidation="false" Text="Update" CommandName="Update" />
                     </ItemTemplate>
                    </asp:TemplateField>
           
     
                 <asp:TemplateField>
                    <ItemTemplate>
                        <asp:Button ID="btn_delete" runat="server" Text="Delete" CausesValidation="false" CommandName="Delete" />
                    </ItemTemplate>
                     </asp:TemplateField>


                <asp:TemplateField HeaderText="Id">
                    <ItemTemplate>
                        <asp:Label ID="lblId" runat="server" Text='<%#Eval("Id") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Book Name">
                    <ItemTemplate>
                        <asp:Label ID="lblbookname" runat="server" Text='<%#Eval("BookName") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtbookname" runat="server" Text='<%#Eval("BookName")%>'></asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>

                 <asp:TemplateField HeaderText="Author">
                    <ItemTemplate>
                        <asp:Label ID="lblAuthor" runat="server" Text='<%#Eval("Author") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtauthor" runat="server" Text='<%#Eval("Author")%>'></asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>

                 <asp:TemplateField HeaderText="Publisher">
                    <ItemTemplate>
                        <asp:Label ID="lblpublication" runat="server" Text='<%#Eval("Publicatiom") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtpublication" runat="server" Text='<%#Eval("Publicatiom")%>'></asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>


                 <asp:TemplateField HeaderText="Price">
                    <ItemTemplate>
                        <asp:Label ID="lblPrice" runat="server" Text='<%#Eval("Price") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtprice" runat="server" Text='<%#Eval("Price")%>'></asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </div>
    </form>
</body>
</html>
