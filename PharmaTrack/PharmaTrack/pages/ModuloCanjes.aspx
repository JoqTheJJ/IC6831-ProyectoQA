<%@ Page Title="Pharmatrack Farmacia" Language="VB" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ModuloCanjes.aspx.vb" Inherits="PharmaTrack._ModuloCanjes" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <asp:HiddenField ID="hdf_Farmacia" runat="server"/>
    <br />
    <br />
    <br />
    <br />
    <main>
        <div>
            <h1>PharmaTrack - Farmacias</h1>
            <br />
            <asp:Label ID="lbl_NombreMain" runat="server" Font-Bold="true" Font-Size="Large" ></asp:Label>
            
            <br />
            <br />
            <asp:LinkButton ID="btn_Usuarios" CssClass="btn btn-cancel" runat="server" OnClick="btn_Usuarios_Click">
                <asp:Literal ID="ltl_usuarios" runat="server" Text="<span class='glyphicon glyphicon-search'></span> Consulta Clientes"></asp:Literal>
            </asp:LinkButton>
            <asp:LinkButton ID="btn_Historial" CssClass="btn btn-cancel" runat="server" OnClick="btn_Historial_Click">
                <asp:Literal ID="ltl_Historial" runat="server" Text="<span class='glyphicon glyphicon-time'></span> Historial por cliente"></asp:Literal>
            </asp:LinkButton>
            <br />
            <div class="horizontal-line"></div>
            <asp:MultiView ID="MultiViewFarmacia" runat="server">
                <asp:View ID="view_Usuarios" runat="server">
                    <h2>Consulta de Cliente</h2>
                    <p>Ingrese la identificación del cliente para consultar su estado en el programa de beneficios</p>
                    <div class="label-input">
                        <asp:Label ID="lbl_FiltroUsuarios" AssociatedControlID="txt_filtroUsuarios" runat="server" Text="Cédula" CssClass="form-label"></asp:Label>
                        <asp:TextBox ID="txt_filtroUsuarios" runat="server" CssClass="form-control" Width="30%"></asp:TextBox>
                    </div>
                    <asp:LinkButton ID="lnk_BuscarUsuario" CssClass="btn btn-iica-blue-light" runat="server">
                        <span class="glyphicon glyphicon-search"></span>
                        <asp:Literal ID="ltl_buscarUsuario" runat="server" Text="Buscar"></asp:Literal>
                    </asp:LinkButton>
                    <asp:LinkButton ID="lnk_limpiarUsuario" CssClass="btn btn-iica-blue-light" Text="Limpiar Busqueda" OnClick="lnk_limpiarUsuario_Click" runat="server">
                        <span class="glyphicon glyphicon-zoom-out"></span>
                        <asp:Literal ID="ltl_limpiar_busquedaUsuario" runat="server" Text="Limpiar Busqueda"></asp:Literal>
                    </asp:LinkButton>
                    <br />
                    <br />
                    <asp:Label runat="server" Text="Información del cliente"></asp:Label>
                    <asp:UpdatePanel runat="server">
                        <ContentTemplate>
                            <asp:GridView ID="gv_UsuariosFarmacia" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" AllowSorting="True"
                                DataSourceID="SqlDataSourceUsuariosTodos" CssClass="table table-bordered table-hover  margin-top-20"
                                AllowPaging="True" EmptyDataText="No existe usuario registrado con la cédula ingresada">
                                <Columns>
                                    <asp:TemplateField HeaderText="Datos Cliente">
                                        <ItemTemplate>
                                            <asp:Label runat="server" Text="Nombre Completo: " Font-Bold="true"></asp:Label>
                                            <%# Eval("Nombre") %> <%# Eval("Apellido1") %> <%# Eval("Apellido2") %>
                                            <br />
                                            <br />
                                            <asp:Label runat="server" Text="Cédula: " Font-Bold="true"></asp:Label>
                                            <%# Eval("Cedula") %>
                                            <br />
                                            <br />
                                            <asp:Label runat="server" Text="Correo electrónico: " Font-Bold="true"></asp:Label>
                                            <%# Eval("Correo") %>
                                            <br />
                                            <br />
                                            <asp:Label runat="server" Text="Número de teléfono: " Font-Bold="true"></asp:Label>
                                            <%# Eval("Telefono") %>
                                            <asp:HiddenField runat="server" ID="hdf_Usuario" Value='<%# Eval("Id") %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Facturas y puntaje general del cliente por medicamento">
                                        <ItemTemplate>
                                            <asp:GridView ID="gv_Facturas" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" AllowSorting="True" EmptyDataText="Cliente sin facturas"
                                                        DataSourceID="SqlDataSourceFacturas" CssClass="table table-bordered table-hover  margin-top-20" AllowPaging="True" PageSize="5">
                                                <Columns>
                                                    <asp:TemplateField HeaderText="No. Factura">
                                                        <ItemTemplate>
                                                            <%# Eval("NoFactura") %>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Medicamento">
                                                        <ItemTemplate>
                                                            <%# Eval("NombreMedicamento") %>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Cantidad">
                                                        <ItemTemplate>
                                                            <%# Eval("Cantidad") %>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Puntaje">
                                                        <ItemTemplate>
                                                            <%# Eval("Puntaje") %>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Farmacia">
                                                        <ItemTemplate>
                                                            <%# Eval("NombreFarmacia") %>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Fecha">
                                                        <ItemTemplate>
                                                            <%#Eval("FechaRegistro", "{0:d}") %>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Estado">
                                                        <ItemTemplate>
                                                            <%# Eval("Estado") %>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                </Columns>
                                            </asp:GridView>
                                            <asp:SqlDataSource ID="SqlDataSourceFacturas" runat="server" ConnectionString="<%$ ConnectionStrings:PharmaConnectionString %>" 
                                                SelectCommand="Get_FacturasUsuarioXFarmacia" SelectCommandType="StoredProcedure">
                                                <SelectParameters>
                                                    <asp:ControlParameter ControlID="hdf_Usuario" Name="IdUsuario" PropertyName="Value" Type="Int32" />
                                                    <asp:ControlParameter ControlID="hdf_Farmacia" Name="IdFarmacia" PropertyName="Value" Type="Int32" />
                                                </SelectParameters>
                                            </asp:SqlDataSource>

                                            <asp:GridView ID="gv_Puntaje" runat="server" AutoGenerateColumns="False" DataKeyNames="IdUsuario,IdMedicamento,IdFarmacia" AllowSorting="True" EmptyDataText="Aún no existen puntos para canjear"
                                                        DataSourceID="SqlDataSourcePuntaje" CssClass="table table-bordered table-hover  margin-top-20" AllowPaging="True" PageSize="10">
                                                <Columns>
                                                    <asp:TemplateField HeaderText="Medicamento">
                                                        <ItemTemplate>
                                                            <%# Eval("Medicamento") %>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="P. Acumulados">
                                                        <ItemTemplate>
                                                            <%# Eval("Puntos") %>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="P. Disponibles">
                                                        <ItemTemplate>
                                                            <%# Eval("PuntosDisponibles") %>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="P. Canjeados">
                                                        <ItemTemplate>
                                                            <%# Eval("PuntosCanjeados") %>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Costo (P. x4)">
                                                        <ItemTemplate>
                                                            <%# Eval("CostoCanje") %>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Canjear">
                                                        <ItemTemplate>
                                                            <asp:HiddenField runat="server" ID="hf_MedicamentoCanje" Value='<%# Eval("IdMedicamento") %>'/>
                                                            <asp:HiddenField runat="server" ID="hf_CostoCanje" Value='<%# Eval("CostoCanje") %>' />
                                                            <asp:LinkButton ID="BtnCanjear" CssClass="btn btn-cancel" runat="server" Visible='<%#IIf(Eval("PuntosDisponibles") >= Eval("CostoCanje"), "True", "False")%>'
                                                                OnClientClick="return confirm('¿Seguro que desea generar el canje de este producto al usuario? Este proceso es irreversible');"
                                                                OnClick="BtnCanjear_Click">
                                                                <asp:Literal ID="ltl_canjear" runat="server" Text="<span class='glyphicon glyphicon-shopping-cart'></span>"></asp:Literal>
                                                            </asp:LinkButton>
                                                        </ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Center" />
                                                    </asp:TemplateField>
                                                </Columns>
                                            </asp:GridView>
                                            <asp:SqlDataSource ID="SqlDataSourcePuntaje" runat="server" ConnectionString="<%$ ConnectionStrings:PharmaConnectionString %>" 
                                                SelectCommand="Calcula_PuntajeXFarmacia" SelectCommandType="StoredProcedure">
                                                <SelectParameters>
                                                    <asp:ControlParameter ControlID="hdf_Farmacia" Name="IdFarmacia" PropertyName="Value" Type="Int32" />
                                                    <asp:ControlParameter Name="Filtro" ControlID="txt_filtroUsuarios" DefaultValue=" " PropertyName="Text" Type="String" />
                                                </SelectParameters>
                                            </asp:SqlDataSource>

                                            <asp:GridView ID="gv_Canjes" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" AllowSorting="True" EmptyDataText="Cliente sin canjes"
                                                        DataSourceID="SqlDataSourceCanjes" CssClass="table table-bordered table-hover  margin-top-20" AllowPaging="True" PageSize="5">
                                                <Columns>
                                                    <asp:TemplateField HeaderText="Fecha" SortExpression="Fecha">
                                                        <ItemTemplate>
                                                            <%# Eval("Fecha", "{0:d}") %>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Producto">
                                                        <ItemTemplate>
                                                            <%# Eval("Nombre") %>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Puntos Utilizados">
                                                        <ItemTemplate>
                                                            <%# Eval("PuntosRequeridos") %>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                </Columns>
                                            </asp:GridView>
                                            <asp:SqlDataSource ID="SqlDataSourceCanjes" runat="server" ConnectionString="<%$ ConnectionStrings:PharmaConnectionString %>" 
                                                SelectCommand="Get_CanjesXUsuario" SelectCommandType="StoredProcedure">
                                                <SelectParameters>
                                                    <asp:ControlParameter Name="Filtro" ControlID="txt_filtroUsuarios" DefaultValue=" " PropertyName="Text" Type="String" />
                                                    <asp:ControlParameter ControlID="hdf_Farmacia" Name="IdFarmacia" PropertyName="Value" Type="Int32" />
                                                </SelectParameters>
                                            </asp:SqlDataSource>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                            <asp:SqlDataSource ID="SqlDataSourceUsuariosTodos" runat="server"
                                ConnectionString="<%$ ConnectionStrings:PharmaConnectionString %>"
                                SelectCommand="Get_Usuarios" SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:Parameter Name="Operacion" Type="Int32" DefaultValue="2" />
                                    <asp:ControlParameter Name="Filtro" ControlID="txt_filtroUsuarios" DefaultValue=" " PropertyName="Text" Type="String" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </asp:View>

                <asp:View ID="view_Historial" runat="server">
                    <asp:Panel runat="server" Width="80%">
                        <h2>Historial por Cliente</h2>
                        <p>Consulte los canjes realizados por un cliente especifico</p>
                        <div class="label-input">
                            <asp:Label ID="lbl_Filtro" AssociatedControlID="txt_filtro" runat="server" Text="Filtro" CssClass="form-label"></asp:Label>
                            <asp:TextBox ID="txt_filtro" runat="server" CssClass="form-control" Width="30%"></asp:TextBox>
                        </div>
                    </asp:Panel>
                </asp:View>
            </asp:MultiView>
        </div>
    </main>

</asp:Content>
