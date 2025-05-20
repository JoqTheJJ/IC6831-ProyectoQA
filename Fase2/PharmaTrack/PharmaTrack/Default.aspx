<%@ Page Title="Home Page" Language="VB" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.vb" Inherits="PharmaTrack._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <br />
    <br />
    <br />
    <br />
    <main>
        <div class="row">
            <section class="col-md-6">
                <asp:Label ID="lbl_default" Text="Nuestro compromiso es contigo y con tu salud. Únete a nuestro programa de canje de puntos y comienza a aprovechar las recompensas que mereces por ser un cliente fiel. ¡Haz que cada compra cuente!"
                    runat="server"></asp:Label>
                <br />
                <br />
                <asp:HyperLink ID="hpl_iniciosesion" Text="Iniciar sesión" NavigateUrl="~/logon.aspx" runat="server" CssClass="btn btn-primary"></asp:HyperLink>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:HyperLink ID="hpl_registro" Text="Registrarse" NavigateUrl="~/register.aspx" runat="server" CssClass="btn btn-primary"></asp:HyperLink>
            </section>
        </div>
    </main>

</asp:Content>
