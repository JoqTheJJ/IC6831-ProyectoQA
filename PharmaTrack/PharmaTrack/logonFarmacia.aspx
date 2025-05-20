<%@ Page Title="Login Farmacia" Language="VB" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="logonFarmacia.aspx.vb" Inherits="PharmaTrack._logonFarmacia" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <br />
    <br />
    <div class="form-wrapper">
        <asp:Table runat="server">
            <asp:TableRow Width="50%">
                <asp:TableCell BackColor="#006699" HorizontalAlign="Center" ForeColor="White" Height="600px" Width="50%">
                    <h1>¡Bienvenido!</h1>
                    <asp:Label Text="Escoge la farmacia que administras" runat="server"></asp:Label>
                                    </asp:TableCell>
                <asp:TableCell BackColor="White" HorizontalAlign="Center" Height="600px" Width="50%">
                    <h1>Administrar Farmacia</h1>
                    <br />
                    <div class="label-input">
                        <asp:Label runat="server" AssociatedControlID="ddl_Farmacia" Text="Farmacia"></asp:Label>
                        <asp:DropDownList runat="server" ID="ddl_farmacia" CssClass="form-control" BackColor="White" Width="90%"
                            DataSourceID="SqlDataSourceFarmacias" DataTextField="Nombre" DataValueField="Id"></asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSourceFarmacias" runat="server" ConnectionString="<%$ ConnectionStrings:PharmaConnectionString %>" 
                            SelectCommand="Get_Farmacia" SelectCommandType="StoredProcedure">
                            <SelectParameters>
                                <asp:Parameter Name="Operacion" Type="Int32" DefaultValue="1" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <asp:RequiredFieldValidator ControlToValidate="ddl_farmacia" ForeColor="Red" Font-Bold="true"
                            InitialValue="0" ErrorMessage="Requerido" Display="Dynamic" runat="server" ValidationGroup="AccesoFarmacia"/>
                    </div>
                    <br />
                    <asp:Label ID="lbl_msj_error" runat="server" Visible="false" ForeColor="Red"></asp:Label>
                    <br />
                    <br />
                    <asp:LinkButton ID="btn_accesoFarmacia" Text="Acceder" runat="server" CssClass="btn btn-primary" ValidationGroup="AccesoFarmacia"></asp:LinkButton>
                </asp:TableCell>
            </asp:TableRow>
        </asp:Table>
    </div>
</asp:Content>
