<%@ Page Title="logon" Language="VB" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="logon.aspx.vb" Inherits="PharmaTrack._logon" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <br />
    <br />
    <div class="form-wrapper">
        <asp:Table runat="server">
            <asp:TableRow Width="50%">
                <asp:TableCell BackColor="#006699" HorizontalAlign="Center" ForeColor="White" Height="600px" Width="50%">
                    <h1>¡Bienvenido!</h1>
                    <asp:Label Text="Si aún no tienes una cuenta, regístrate ahora" runat="server"></asp:Label>
                    <br />
                    <br />
                    <asp:HyperLink ID="hpl_registro" Text="Registrarse" NavigateUrl="~/register.aspx" runat="server" CssClass="btn btn-cancel"></asp:HyperLink>
                </asp:TableCell>
                <asp:TableCell BackColor="White" HorizontalAlign="Center" Height="600px" Width="50%">
                    <h1>Iniciar sesión</h1>
                    <br />
                    <div class="label-input">
                        <asp:Label Text="Correo electrónico" runat="server" AssociatedControlID="txt_correo"></asp:Label>
                        <asp:TextBox ID="txt_correo" runat="server" CssClass="form-control" Width="90%"></asp:TextBox>
                    </div>
                    <div class="label-input">
                        <asp:Label Text="Contraseña" runat="server" AssociatedControlID="txt_contrasena"></asp:Label>
                        <asp:TextBox ID="txt_contrasena" runat="server" CssClass="form-control" Width="90%" TextMode="Password"></asp:TextBox>
                    </div>
                    <br />
                    <asp:Label ID="lbl_msj_error" runat="server" Visible="false" ForeColor="Red"></asp:Label>
                    <br />
                    <br />
                    <asp:LinkButton ID="btn_iniciosesion" Text="Iniciar sesión" runat="server" CssClass="btn btn-primary"></asp:LinkButton>
                </asp:TableCell>
            </asp:TableRow>
        </asp:Table>
    </div>
</asp:Content>
