<%@ Page Title="Programa de Beneficios" Language="VB" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ProgramaBeneficios.aspx.vb" Inherits="PharmaTrack._ProgramaBeneficios" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <asp:HiddenField ID="hdf_Usuario" runat="server"/>
    <br />
    <br />
    <br />
    <br />
    <main>
        <div>
            <h1>PharmaTrack - Programa de Beneficios</h1>
            <br />
            <table>
                <tr>
                    <td width="30%">
                        <asp:LinkButton ID="BtnPerfil" CssClass="btn btn-cancel btn-circle" runat="server" OnClick="btn_Perfil_Click">
                            <asp:Literal ID="ltl_perfil" runat="server" Text="<span class='glyphicon glyphicon-user icon-large'></span>"></asp:Literal>
                        </asp:LinkButton>
                    </td>
                    <td width="70%">
                        <asp:Label ID="lbl_NombreMain" runat="server" Font-Bold="true" Font-Size="Large" ></asp:Label>
                    </td>
                </tr>
            </table>
            <br />
            <br />
            <asp:Panel runat="server" ID="pnl_MainAdmin" Visible="false">
                <asp:LinkButton ID="btn_Usuarios" CssClass="btn btn-cancel" runat="server" OnClick="btn_Usuarios_Click">
                    <asp:Literal ID="ltl_usuarios" runat="server" Text="<span class='glyphicon glyphicon-globe'></span> Usuarios"></asp:Literal>
                </asp:LinkButton>
                <asp:LinkButton ID="btn_Productos" CssClass="btn btn-cancel" runat="server" OnClick="btn_Productos_Click">
                    <asp:Literal ID="ltl_productos" runat="server" Text="<span class='glyphicon glyphicon-barcode'></span> Productos"></asp:Literal>
                </asp:LinkButton>
            </asp:Panel>

            <asp:Panel runat="server" ID="pnl_MainOperativo" Visible="false">
                <asp:LinkButton ID="btn_Facturas" CssClass="btn btn-cancel" runat="server" OnClick="btn_Facturas_Click">
                    <asp:Literal ID="ltl_facturas" runat="server" Text="<span class='glyphicon glyphicon-list-alt'></span> Facturas"></asp:Literal>
                </asp:LinkButton>
                <asp:LinkButton ID="btn_Estadisticas" CssClass="btn btn-cancel" runat="server" OnClick="btn_Estadisticas_Click">
                    <asp:Literal ID="ltl_estadisticas" runat="server" Text="<span class='glyphicon glyphicon-stats'></span> Estadísticas"></asp:Literal>
                </asp:LinkButton>
            </asp:Panel>
            
            <asp:Panel runat="server" ID="pnl_MainCliente" Visible="false">
                <asp:LinkButton ID="BtnResumen" CssClass="btn btn-cancel" runat="server" OnClick="BtnResumen_Click">
                    <asp:Literal ID="ltl_resumen" runat="server" Text="<span class='glyphicon glyphicon-usd'></span> Resumen"></asp:Literal>
                </asp:LinkButton>
                <asp:LinkButton ID="BtnRegistrarFactura" CssClass="btn btn-cancel" runat="server" OnClick="BtnRegistrarFactura_Click">
                    <asp:Literal ID="ltl_registrar_factura" runat="server" Text="<span class='glyphicon glyphicon-open-file'></span> Registrar Factura"></asp:Literal>
                </asp:LinkButton>
                <asp:LinkButton ID="BtnHistorial" CssClass="btn btn-cancel" runat="server" OnClick="BtnHistorial_Click">
                    <asp:Literal ID="ltl_historial" runat="server" Text="<span class='glyphicon glyphicon-th-list'></span> Historial"></asp:Literal>
                </asp:LinkButton>
            </asp:Panel>
            <br />
            <div class="horizontal-line"></div>
            <asp:MultiView ID="MultiViewMain" runat="server">
                <asp:View ID="view_Perfil" runat="server">
                    <h2>Perfil</h2>
                    <table width="60%">
                        <tr>
                            <td width="50%">
                                <div class="label-input">
                                    <asp:Label Text="Nombre*" runat="server" AssociatedControlID="txt_nombre"></asp:Label>
                                    <asp:TextBox ID="txt_nombre" runat="server" CssClass="form-control" Width="90%" Enabled="false" BackColor="White"></asp:TextBox>
                                    <asp:RequiredFieldValidator ControlToValidate="txt_nombre" ForeColor="Red" Font-Bold="true"
                                        ErrorMessage="Requerido" Display="Dynamic" runat="server" ValidationGroup="Perfil"/>
                                </div>
                                <div class="label-input">
                                    <asp:Label Text="Primer apellido*" runat="server" AssociatedControlID="txt_PApellido"></asp:Label>
                                    <asp:TextBox ID="txt_PApellido" runat="server" CssClass="form-control" Width="90%" Enabled="false" BackColor="White"></asp:TextBox>
                                    <asp:RequiredFieldValidator ControlToValidate="txt_PApellido" ForeColor="Red" Font-Bold="true"
                                        ErrorMessage="Requerido" Display="Dynamic" runat="server" ValidationGroup="Perfil"/>
                                </div>
                                <div class="label-input">
                                    <asp:Label Text="Segundo apellido" runat="server" AssociatedControlID="txt_SApellido"></asp:Label>
                                    <asp:TextBox ID="txt_SApellido" runat="server" CssClass="form-control" Width="90%" Enabled="false" BackColor="White"></asp:TextBox>
                                </div>
                            </td>
                            <td width="50%">
                                <div class="label-input">
                                    <asp:Label Text="Correo electrónico*" runat="server" AssociatedControlID="txt_correo"></asp:Label>
                                    <asp:TextBox ID="txt_correo" runat="server" CssClass="form-control" Width="90%" Enabled="false" BackColor="White"></asp:TextBox>
                                    <asp:RequiredFieldValidator ControlToValidate="txt_correo" ForeColor="Red" Font-Bold="true"
                                        ErrorMessage="Requerido" Display="Dynamic" runat="server" ValidationGroup="Perfil"/>
                                </div>
                                <div class="label-input">
                                    <asp:Label Text="Cédula*" runat="server" AssociatedControlID="txt_cedula"></asp:Label>
                                    <asp:TextBox ID="txt_cedula" runat="server" CssClass="form-control" Width="90%" Enabled="false" BackColor="White"></asp:TextBox>
                                    <asp:RequiredFieldValidator ControlToValidate="txt_cedula" ForeColor="Red" Font-Bold="true"
                                        ErrorMessage="Requerido" Display="Dynamic" runat="server" ValidationGroup="Perfil"/>
                                </div>
                                <div class="label-input">
                                    <asp:Label Text="Número de teléfono" runat="server" AssociatedControlID="txt_telefono"></asp:Label>
                                    <asp:TextBox ID="txt_telefono" runat="server" CssClass="form-control" Width="90%" Enabled="false" BackColor="White"></asp:TextBox>
                                </div>
                            </td>
                        </tr>
                    </table>
                    <br />
                    <asp:Label ID="lbl_msj_error" runat="server" Visible="false" ForeColor="Red"></asp:Label>
                    <br />
                    <asp:Panel ID="pnl_actualizarPerfil" runat="server">
                        <asp:LinkButton ID="btn_actualizarPerfil" runat="server" CssClass="btn btn-success">
                            <asp:Literal ID="ltl_actualizarPerfil" runat="server" Text="<span class='glyphicon glyphicon-pencil'></span> Actualizar"></asp:Literal>
                        </asp:LinkButton>
                        <asp:LinkButton ID="btn_borrarPerfil" runat="server" CssClass="btn btn-danger">
                            <asp:Literal ID="ltl_borrarPerfil" runat="server" Text="<span class='glyphicon glyphicon-trash'></span> Eliminar"></asp:Literal>
                        </asp:LinkButton>
                    </asp:Panel>
                    <asp:Panel ID="pnl_AceptCancel" runat="server" Visible="False">
                        <asp:LinkButton ID="btn_AceptarActualizacion" runat="server" CssClass="btn btn-info" ValidationGroup="Perfil">
                            <asp:Literal ID="ltl_AceptarActualizacion" runat="server" Text="<span class='glyphicon glyphicon-ok'></span>"></asp:Literal>
                        </asp:LinkButton>
                        <asp:LinkButton ID="btn_CancelarActualizacion" runat="server" CssClass="btn btn-cancel">
                            <asp:Literal ID="ltl_CancelarActualizacion" runat="server" Text="<span class='glyphicon glyphicon-remove'></span>"></asp:Literal>
                        </asp:LinkButton>
                    </asp:Panel>
                </asp:View>

                <asp:View ID="view_Usuarios" runat="server">
                    <h2>Gestión de Usuarios</h2>
                    <p>Administra los usuarios registrados en la plataforma</p>
                    <div class="label-input">
                        <asp:Label ID="lbl_FiltroUsuarios" AssociatedControlID="txt_filtroUsuarios" runat="server" Text="Filtro" CssClass="form-label"></asp:Label>
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
                    <asp:UpdatePanel runat="server">
                        <ContentTemplate>
                            <asp:GridView ID="gv_UsuariosAdmin" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" AllowSorting="True"
                                DataSourceID="SqlDataSourceUsuariosTodos" CssClass="table table-bordered table-hover  margin-top-20"
                                AllowPaging="True" PageSize="10">
                                <Columns>
                                    <asp:TemplateField ShowHeader="False">
                                        <EditItemTemplate>
                                            <asp:LinkButton ID="imgBtn_Aceptar_Usuario" ToolTip="Confirmar" CssClass="btn btn-info" ValidationGroup="AdminPerfil"
                                                runat="server" CommandName="Update">
                                            <span class="glyphicon glyphicon-ok"></span> </asp:LinkButton>
                                            <asp:LinkButton ID="imgBtn_Cancel_Usuario" ToolTip="Cancelar" CausesValidation="False" CssClass="btn btn-cancel"
                                                runat="server" CommandName="Cancel">
                                        <span class="glyphicon glyphicon-remove"></span </asp:LinkButton>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:LinkButton ID="imgBtn_Editar_Usuario" ToolTip="Editar" CssClass="btn btn-success" runat="server"
                                                CommandName="Edit">
                                        <span class="glyphicon glyphicon-pencil"></span>
                                            </asp:LinkButton>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Top" Width="10%" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Nombre">
                                        <ItemTemplate>
                                            <%# Eval("Nombre") %>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txt_NombreAdmin" runat="server" Text='<%# Bind("Nombre") %>' CssClass="form-control"></asp:TextBox>
                                            <asp:RequiredFieldValidator ControlToValidate="txt_NombreAdmin" ForeColor="Red" Font-Bold="true"
                                                ErrorMessage="Requerido" Display="Dynamic" runat="server" ValidationGroup="AdminPerfil" />
                                        </EditItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Primer Apellido">
                                        <ItemTemplate>
                                            <%# Eval("Apellido1") %>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txt_Apellido1Admin" runat="server" Text='<%# Bind("Apellido1") %>' CssClass="form-control"></asp:TextBox>
                                            <asp:RequiredFieldValidator ControlToValidate="txt_Apellido1Admin" ForeColor="Red" Font-Bold="true"
                                                ErrorMessage="Requerido" Display="Dynamic" runat="server" ValidationGroup="AdminPerfil" />
                                        </EditItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Segundo Apellido">
                                        <ItemTemplate>
                                            <%# Eval("Apellido2") %>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txt_Apellido2Admin" runat="server" Text='<%# Bind("Apellido2") %>' CssClass="form-control"></asp:TextBox>
                                        </EditItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Cedula">
                                        <ItemTemplate>
                                            <%# Eval("Cedula") %>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txt_CedulaAdmin" runat="server" Text='<%# Bind("Cedula") %>' CssClass="form-control"></asp:TextBox>
                                            <asp:RequiredFieldValidator ControlToValidate="txt_CedulaAdmin" ForeColor="Red" Font-Bold="true"
                                                ErrorMessage="Requerido" Display="Dynamic" runat="server" ValidationGroup="AdminPerfil" />
                                        </EditItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Correo">
                                        <ItemTemplate>
                                            <%# Eval("Correo") %>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txt_CorreoAdmin" runat="server" Text='<%# Bind("Correo") %>' CssClass="form-control"></asp:TextBox>
                                            <asp:RequiredFieldValidator ControlToValidate="txt_CorreoAdmin" ForeColor="Red" Font-Bold="true"
                                                ErrorMessage="Requerido" Display="Dynamic" runat="server" ValidationGroup="AdminPerfil" />
                                        </EditItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Telefono">
                                        <ItemTemplate>
                                            <%#Eval("Telefono") %>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txt_TelefonoAdmin" runat="server" Text='<%# Bind("Telefono") %>' CssClass="form-control"></asp:TextBox>
                                            <asp:RegularExpressionValidator ControlToValidate="txt_TelefonoAdmin" ForeColor="Red" Font-Bold="true"
                                                ErrorMessage="Solo se permiten números" Display="Dynamic" runat="server" ValidationGroup="AdminPerfil"
                                                ValidationExpression="^\d+$" />
                                        </EditItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Rol">
                                        <ItemTemplate>
                                            <%# Eval("NombreRol") %>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:DropDownList runat="server" ID="ddl_RolAdmin" CssClass="form-control"
                                                DataSourceID="SqlDataSourceRol" DataTextField="NombreRol" DataValueField="Id" SelectedValue='<%# Bind("Rol") %>'>
                                            </asp:DropDownList>
                                            <asp:SqlDataSource ID="SqlDataSourceRol" runat="server" ConnectionString="<%$ ConnectionStrings:PharmaConnectionString %>"
                                                SelectCommand="Get_Rol" SelectCommandType="StoredProcedure">
                                                <SelectParameters>
                                                    <asp:Parameter Name="Operacion" Type="Int32" DefaultValue="1" />
                                                </SelectParameters>
                                            </asp:SqlDataSource>
                                            <asp:RequiredFieldValidator ControlToValidate="ddl_RolAdmin" ForeColor="Red" Font-Bold="true"
                                                InitialValue="0" ErrorMessage="Requerido" Display="Dynamic" runat="server" ValidationGroup="AdminPerfil" />
                                        </EditItemTemplate>
                                        <ItemStyle Width="15%" />
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                            <asp:SqlDataSource ID="SqlDataSourceUsuariosTodos" runat="server"
                                ConnectionString="<%$ ConnectionStrings:PharmaConnectionString %>"
                                SelectCommand="Get_Usuarios" SelectCommandType="StoredProcedure"
                                UpdateCommand="Man_Usuarios" UpdateCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:Parameter Name="Operacion" Type="Int32" DefaultValue="0" />
                                    <asp:Parameter Name="Usuario" Type="Int32" DefaultValue="0" />
                                    <asp:ControlParameter Name="Filtro" ControlID="txt_filtroUsuarios" DefaultValue=" " PropertyName="Text" Type="String" />
                                </SelectParameters>
                                <UpdateParameters>
                                    <asp:Parameter Name="Operacion" Type="Int32" DefaultValue="2" />
                                </UpdateParameters>
                            </asp:SqlDataSource>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </asp:View>

                <asp:View ID="view_Facturas" runat="server">
                    <asp:Panel runat="server" Width="80%">
                        <h2>Aprobación de Facturas</h2>
                        <p>Revisa y aprueba las facturas pendientes</p>
                        <div class="label-input">
                            <asp:Label ID="lbl_Filtro" AssociatedControlID="txt_filtro" runat="server" Text="Filtro" CssClass="form-label"></asp:Label>
                            <asp:TextBox ID="txt_filtro" runat="server" CssClass="form-control" Width="30%"></asp:TextBox>
                        </div>
                        <asp:LinkButton ID="lnk_Buscar" CssClass="btn btn-iica-blue-light" runat="server">
                            <span class="glyphicon glyphicon-search"></span>
                            <asp:Literal ID="ltl_buscar" runat="server" Text="Buscar"></asp:Literal>
                        </asp:LinkButton>
                        <asp:LinkButton ID="lnk_limpiar" CssClass="btn btn-iica-blue-light" Text="Limpiar Busqueda" OnClick="lnk_limpiar_Click" runat="server">
                            <span class="glyphicon glyphicon-zoom-out"></span>
                            <asp:Literal ID="ltl_limpiar_busqueda" runat="server" Text="Limpiar Busqueda"></asp:Literal>
                        </asp:LinkButton>
                        <asp:GridView ID="gv_FacturasAprobacion" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" AllowSorting="True"
                            DataSourceID="SqlDataSourceFacturasTodas" CssClass="table table-bordered table-hover  margin-top-20" 
                            AllowPaging="True" PageSize="10" OnRowUpdating="gv_FacturasAprobacion_RowUpdating" OnRowCommand="gv_Archivos_RowCommand">
                        <Columns>
                            <asp:TemplateField ShowHeader="False">
                                <EditItemTemplate>
                                    <asp:LinkButton ID="imgBtn_Aceptar_Factura" ToolTip="Confirmar" CssClass="btn btn-info" ValidationGroup="Estado"
                                            runat="server" CommandName="Update">
                                            <span class="glyphicon glyphicon-ok"></span> </asp:LinkButton>
                                    <asp:LinkButton ID="imgBtn_Cancel_Factura" ToolTip="Cancelar" CausesValidation="False" CssClass="btn btn-cancel"
                                        runat="server" CommandName="Cancel">
                                        <span class="glyphicon glyphicon-remove"></span </asp:LinkButton>
                                    <asp:HiddenField ID="hf_IdUsuario" runat="server" Value='<%# Eval("IdUsuario") %>' />
                                    <asp:HiddenField ID="hf_IdMedicamento" runat="server" Value='<%# Eval("IdMedicamento") %>' />
                                    <asp:HiddenField ID="hf_IdFarmacia" runat="server" Value='<%# Eval("IdFarmacia") %>' />
                                    <asp:HiddenField ID="hf_Puntaje" runat="server" Value='<%# Eval("Puntaje") %>' />
                                    <asp:HiddenField ID="hf_Cantidad" runat="server" Value='<%# Eval("Cantidad") %>' />
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:LinkButton ID="imgBtn_Editar_Factura" ToolTip="Editar" CssClass="btn btn-success" runat="server"
                                        CommandName="Edit">
                                        <span class="glyphicon glyphicon-pencil"></span>
                                    </asp:LinkButton>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Top" Width="15%" />
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
                            <asp:TemplateField HeaderText="Cliente">
                                <ItemTemplate>
                                    <%# Eval("Cliente") %>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Fecha" SortExpression="FechaRegistro">
                                <ItemTemplate>
                                    <%#Eval("FechaRegistro", "{0:d}") %>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Estado" SortExpression="Estado">
                                <ItemTemplate>
                                    <%# Eval("Estado") %>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:DropDownList runat="server" ID="ddl_Estado" CssClass="form-control" BackColor="White" Width="90%"
                                        DataSourceID="SqlDataSourceEstado" DataTextField="Estado" DataValueField="Id"
                                        SelectedValue='<%# Bind("IdEstado") %>' Enabled='<%#IIf(Eval("IdEstado") = 1, "True", "False")%>'></asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSourceEstado" runat="server" ConnectionString="<%$ ConnectionStrings:PharmaConnectionString %>" 
                                        SelectCommand="Get_EstadoFactura" SelectCommandType="StoredProcedure">
                                        <SelectParameters>
                                            <asp:Parameter Name="Operacion" Type="Int32" DefaultValue="1" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                    <asp:RequiredFieldValidator ControlToValidate="ddl_Estado" ForeColor="Red" Font-Bold="true"
                                        InitialValue="0" ErrorMessage="Requerido" Display="Dynamic" runat="server" ValidationGroup="Estado"/>
                                </EditItemTemplate>
                                <ItemStyle Width="15%"/>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Archivo Adjunto">
                                <ItemTemplate>
                                    <asp:LinkButton ID="btnDownload" CssClass="btn btn-cancel" runat="server" Visible='<%# Eval("ArchivoFactura") IsNot DBNull.Value AndAlso Eval("ArchivoFactura") IsNot Nothing %>'
                                        CommandName="Download" CommandArgument='<%# Eval("Id") %>'>
                                        <asp:Literal ID="ltl_download" runat="server" Text="<span class='glyphicon glyphicon-eye-open'></span>"></asp:Literal>
                                    </asp:LinkButton>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" Width="10%"/>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSourceFacturasTodas" runat="server"
                        ConnectionString="<%$ ConnectionStrings:PharmaConnectionString %>" 
                        SelectCommand="Get_Facturas" SelectCommandType="StoredProcedure"
                        UpdateCommand="Update_FacturaEstado" UpdateCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:Parameter Name="Operacion" Type="Int32" DefaultValue="0" />
                            <asp:controlparameter Name="Filtro" ControlID="txt_filtro" DefaultValue=" " PropertyName="Text" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    </asp:Panel>
                </asp:View>

                <asp:View ID="view_Productos" runat="server">
                    <h2>Gestión de Productos</h2>
                    <p>Administra los productos inscritos en el programa de beneficios</p>
                    <asp:UpdatePanel runat="server">
                        <ContentTemplate>
                            <asp:GridView ID="gv_ProductosAdmin" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" AllowSorting="True"
                                DataSourceID="SqlDataSourceMedicamentosParticipantes" CssClass="table table-bordered table-hover  margin-top-20"
                                AllowPaging="True" PageSize="10" Width="60%">
                                <Columns>
                                    <asp:TemplateField ShowHeader="False">
                                        <EditItemTemplate>
                                            <asp:LinkButton ID="imgBtn_Aceptar_Producto" ToolTip="Confirmar" CssClass="btn btn-info" ValidationGroup="AdminProducto"
                                                runat="server" CommandName="Update">
                                            <span class="glyphicon glyphicon-ok"></span> </asp:LinkButton>
                                            <asp:LinkButton ID="imgBtn_Cancel_Producto" ToolTip="Cancelar" CausesValidation="False" CssClass="btn btn-cancel"
                                                runat="server" CommandName="Cancel">
                                            <span class="glyphicon glyphicon-remove"></span </asp:LinkButton>
                                            <asp:HiddenField ID="hdf_OperacionMedicamentosParticipantes" Value='<%# Bind("Operacion") %>' runat="server"/>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:LinkButton ID="imgBtn_Editar_Producto" ToolTip="Editar" CssClass="btn btn-success" runat="server"
                                                CommandName="Edit" Visible='<%#IIf(Eval("Visible") = 2, "True", "False")%>'>
                                                <span class="glyphicon glyphicon-pencil"></span>
                                            </asp:LinkButton>
                                            <asp:LinkButton ID="imgBtn_NuevoHistorico" ToolTip="Agregar nuevo" CssClass="btn btn-primary"
                                                runat="server" CommandName="Edit" Visible='<%#IIf(Eval("Visible") = 1, "True", "False")%>'>
                                                <span class="glyphicon glyphicon-plus"></span>
                                            </asp:LinkButton>
                                            <asp:LinkButton ID="imgBtn_EliminarHistorico" ToolTip="Eliminar" CssClass="btn btn-danger" runat="server" CommandName="Delete"
                                                OnClientClick="return confirm('¿Eliminar medicamento del programa de beneficios?');" Visible='<%#IIf(Eval("Visible") = 2, "True", "False")%>'>
                                                <span class="glyphicon glyphicon-trash"></span>
                                            </asp:LinkButton>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Top" Width="20%" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Precio">
                                        <ItemTemplate>
                                            <asp:Label ID="lbl_PrecioMedicamentoAdmin" runat="server" Text='<%# Eval("Precio") %>'
                                               Visible='<%#IIf(Eval("Visible") = 2, "True", "False")%>'></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Top" Width="15%" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Puntaje">
                                        <ItemTemplate>
                                            <asp:Label ID="lbl_PuntajeMedicamentoAdmin" runat="server" Text='<%# Eval("Puntaje") %>'
                                               Visible='<%#IIf(Eval("Visible") = 2, "True", "False")%>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txt_PuntajeAdmin" runat="server" Text='<%# Bind("Puntaje") %>' CssClass="form-control"></asp:TextBox>
                                            <asp:RequiredFieldValidator ControlToValidate="txt_PuntajeAdmin" ForeColor="Red" Font-Bold="true"
                                                ErrorMessage="Requerido" Display="Dynamic" runat="server" ValidationGroup="AdminProducto" />
                                            <asp:RegularExpressionValidator ControlToValidate="txt_PuntajeAdmin" ForeColor="Red" Font-Bold="true"
                                                ErrorMessage="Solo se permiten números" Display="Dynamic" runat="server" ValidationGroup="AdminProducto"
                                                ValidationExpression="^\d+$" />
                                        </EditItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Top" Width="15%" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Nombre">
                                        <ItemTemplate>
                                            <%# Eval("Nombre") %>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:DropDownList runat="server" ID="ddl_ProductoAdmin" CssClass="form-control"
                                                DataSourceID="SqlDataSourceMedicamentoGen" DataTextField="Medicamento" DataValueField="Id" SelectedValue='<%# Bind("IdMedicamento") %>'>
                                            </asp:DropDownList>
                                            <asp:SqlDataSource ID="SqlDataSourceMedicamentoGen" runat="server" ConnectionString="<%$ ConnectionStrings:PharmaConnectionString %>"
                                                SelectCommand="Get_MedicamentoParticipante" SelectCommandType="StoredProcedure">
                                                <SelectParameters>
                                                    <asp:Parameter Name="Operacion" Type="Int32" DefaultValue="2" />
                                                </SelectParameters>
                                            </asp:SqlDataSource>
                                            <asp:RequiredFieldValidator ControlToValidate="ddl_ProductoAdmin" ForeColor="Red" Font-Bold="true"
                                                InitialValue="0" ErrorMessage="Requerido" Display="Dynamic" runat="server" ValidationGroup="AdminProducto" />
                                        </EditItemTemplate>
                                        <ItemStyle Width="50%" />
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                            <asp:SqlDataSource ID="SqlDataSourceMedicamentosParticipantes" runat="server"
                                ConnectionString="<%$ ConnectionStrings:PharmaConnectionString %>"
                                SelectCommand="Get_MedicamentoParticipante" SelectCommandType="StoredProcedure"
                                UpdateCommand="Man_MedicamentoParticipante" UpdateCommandType="StoredProcedure"
                                DeleteCommand="Man_MedicamentoParticipante" DeleteCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:Parameter Name="Operacion" Type="Int32" DefaultValue="0" />
                                </SelectParameters>
                                <DeleteParameters>
                                    <asp:Parameter Name="Operacion" Type="Int32" DefaultValue="3" />
                                </DeleteParameters>
                            </asp:SqlDataSource>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </asp:View>

                <asp:View ID="view_Estadisticas" runat="server">
                    <h2>Análisis Estadístico</h2>
                    <p>Visualiza las estadísticas clave de la plataforma</p>

                    <table width="100%">
                        <tr>
                            <td width="50%" halign="center">
                                <asp:Panel runat="server" BackColor="LightGray" HorizontalAlign="Center">
                                    <h2>Productos más Canjeados</h2>
                                </asp:Panel>
                            </td>
                            <td width="50%">
                                <asp:Panel runat="server" BackColor="LightGray" HorizontalAlign="Center">
                                    <h2>Farmacias con más Compras</h2>
                                </asp:Panel>
                            </td>
                        </tr>
                    </table>
                </asp:View>

                <asp:View ID="ViewResumen" runat="server">
                    <h2>Resumen de Puntos</h2>
                    <p>Aquí puedes ver tu balance actual de puntos por cada medicamento</p>

                    <asp:GridView ID="gv_Puntaje" runat="server" AutoGenerateColumns="False" DataKeyNames="IdUsuario,IdMedicamento,IdFarmacia" AllowSorting="True"
                                DataSourceID="SqlDataSourcePuntaje" CssClass="table table-bordered table-hover  margin-top-20" AllowPaging="True" PageSize="10"
                                EmptyDataText="No hay puntajes disponibles.">
                        <Columns>
                            <asp:TemplateField HeaderText="Medicamento">
                                <ItemTemplate>
                                    <%# Eval("Medicamento") %>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Puntos Disponibles">
                                <ItemTemplate>
                                    <%# Eval("Puntos") %>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Puntos Disponibles">
                                <ItemTemplate>
                                    <%# Eval("PuntosDisponibles") %>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Puntos Canjeados">
                                <ItemTemplate>
                                    <%# Eval("PuntosCanjeados") %>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Farmacia">
                                <ItemTemplate>
                                    <%# Eval("NombreFarmacia") %>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSourcePuntaje" runat="server" ConnectionString="<%$ ConnectionStrings:PharmaConnectionString %>" 
                        SelectCommand="Calcula_Puntaje" SelectCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="hdf_Usuario" Name="IdUsuario" PropertyName="Value" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </asp:View>

                <asp:View ID="ViewRegistrarFactura" runat="server">
                    <asp:Panel runat="server" Width="40%" CssClass="panel-redondeado-facturas">
                        <h2>Registrar Factura</h2>
                        <p>Complete el siguiente formulario para registrar un nueva factura</p>
                        <table Width="100%">
                            <tr>
                                <td Width="50%">
                                    <div class="label-input">
                                        <asp:Label runat="server" AssociatedControlID="ddl_Producto" Text="Producto"></asp:Label>
                                        <asp:DropDownList runat="server" ID="ddl_Producto" CssClass="form-control" Enabled="false" BackColor="White" Width="90%"
                                            DataSourceID="SqlDataSourceMedicamentos" DataTextField="Medicamento" DataValueField="Id"></asp:DropDownList>
                                        <asp:SqlDataSource ID="SqlDataSourceMedicamentos" runat="server" ConnectionString="<%$ ConnectionStrings:PharmaConnectionString %>" 
                                            SelectCommand="Get_MedicamentoParticipante" SelectCommandType="StoredProcedure">
                                            <SelectParameters>
                                                <asp:Parameter Name="Operacion" Type="Int32" DefaultValue="1" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                        <asp:RequiredFieldValidator ControlToValidate="ddl_Producto" ForeColor="Red" Font-Bold="true"
                                            InitialValue="0" ErrorMessage="Requerido" Display="Dynamic" runat="server" ValidationGroup="Factura"/>
                                    </div>
                                    <div class="label-input">
                                        <asp:Label runat="server" AssociatedControlID="txt_Cantidad" Text="Cantidad"></asp:Label>
                                        <asp:TextBox runat="server" ID="txt_Cantidad" CssClass="form-control" TextMode="Number" Enabled="false" BackColor="White" Width="90%"></asp:TextBox>
                                        <asp:RequiredFieldValidator ControlToValidate="txt_Cantidad" ForeColor="Red" Font-Bold="true"
                                            ErrorMessage="Requerido" Display="Dynamic" runat="server" ValidationGroup="Factura"/>
                                    </div>
                                </td>
                                <td Width="50%">
                                    <div class="label-input">
                                        <asp:Label runat="server" AssociatedControlID="ddl_Farmacia" Text="Farmacia"></asp:Label>
                                        <asp:DropDownList runat="server" ID="ddl_farmacia" CssClass="form-control" Enabled="false" BackColor="White" Width="90%"
                                            DataSourceID="SqlDataSourceFarmacias" DataTextField="Nombre" DataValueField="Id"></asp:DropDownList>
                                        <asp:SqlDataSource ID="SqlDataSourceFarmacias" runat="server" ConnectionString="<%$ ConnectionStrings:PharmaConnectionString %>" 
                                            SelectCommand="Get_Farmacia" SelectCommandType="StoredProcedure">
                                            <SelectParameters>
                                                <asp:Parameter Name="Operacion" Type="Int32" DefaultValue="1" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                        <asp:RequiredFieldValidator ControlToValidate="ddl_farmacia" ForeColor="Red" Font-Bold="true"
                                            InitialValue="0" ErrorMessage="Requerido" Display="Dynamic" runat="server" ValidationGroup="Factura"/>
                                    </div>
                                    <div class="label-input">
                                        <asp:Label runat="server" Text="Fecha de Compra" Font-Bold="true" AssociatedControlID="txt_FechaRegistro"></asp:Label>
                                        <asp:TextBox runat="server" ID="txt_FechaRegistro" CssClass="form-control" type="date" Enabled="false" BackColor="White" Width="90%"></asp:TextBox>
                                        <asp:RequiredFieldValidator ControlToValidate="txt_FechaRegistro" ForeColor="Red" Font-Bold="true"
                                            ErrorMessage="Requerido" Display="Dynamic" runat="server" ValidationGroup="Factura"/>
                                    </div>
                                </td>
                            </tr>
                        </table>
                        <asp:Panel ID="pnl_UploadFactura" runat="server" Visible="False">
                            <asp:FileUpload ID="fup_Factura" runat="server" onchange="fileinfo()" style="display: none;"/>
                            <asp:LinkButton runat="server" ID="lnk_fup_Factura" Text="Seleccionar archivo" CssClass="btn btn-cancel"></asp:LinkButton>
                            <asp:TextBox runat="server" ID="txt_fup_Factura" BorderColor="Transparent" BackColor="Transparent" Enabled="false" Width="60%"></asp:TextBox>

                            <script type="text/javascript">
                                function fileinfo() {
                                    var fileInput = document.getElementById('<%=fup_Factura.ClientID %>');
                                    var filePath = fileInput.value;

                                    var fileName = filePath.split('\\').pop();

                                    document.getElementById('<%=txt_fup_Factura.ClientID%>').value = fileName;
                                }
                            </script>
                            <asp:Label ID="lbl_NotaFactura" runat="server" Text=" Archivo permitidos (pdf)."></asp:Label>
                            <br />
                            <asp:RegularExpressionValidator ID="rev_ValidaFormatoArchivo" runat="server" ControlToValidate="fup_Factura"
                                Display="Dynamic" ErrorMessage="Formato del achivo" Text="El archivo seleccionado no corresponde a un archivo válido (pdf)"
                                ValidationExpression="^([a-zA-Z].*|[1-9].*)\.(((p|P)(d|D)(f|F)))$" ValidationGroup="Factura"></asp:RegularExpressionValidator>
                            <asp:HiddenField ID="hdf_ArchivoFactura" runat="server" />
                            <asp:HiddenField ID="hdf_TamArchivoFactura" runat="server" />
                        </asp:Panel>
                    </asp:Panel>
                    <asp:Label ID="lbl_error_factura" runat="server" Visible="false" ForeColor="Red"></asp:Label>
                    <br />
                    <asp:Panel ID="pnl_EditarFactura" runat="server">
                        <asp:LinkButton ID="btn_AgregarFactura" runat="server" CssClass="btn btn-success">
                            <asp:Literal ID="ltl_AgregarFactura" runat="server" Text="<span class='glyphicon glyphicon-plus'></span> Agregar"></asp:Literal>
                        </asp:LinkButton>
                    </asp:Panel>
                    <asp:Panel ID="pnl_AceptCancelFactura" runat="server" Visible="False">
                        <asp:LinkButton ID="btn_AceptarFactura" runat="server" CssClass="btn btn-info" ValidationGroup="Factura">
                            <asp:Literal ID="ltl_AceptarFactura" runat="server" Text="<span class='glyphicon glyphicon-ok'></span>"></asp:Literal>
                        </asp:LinkButton>
                        <asp:LinkButton ID="btn_CancelarFactura" runat="server" CssClass="btn btn-cancel">
                            <asp:Literal ID="ltl_CancelarFactura" runat="server" Text="<span class='glyphicon glyphicon-remove'></span>"></asp:Literal>
                        </asp:LinkButton>
                    </asp:Panel>
                    <img src="../Images/ImagenMedicos.png" alt="imagen" width="300" height="200" class="Imagen_resumen">
                </asp:View>

                <asp:View ID="ViewHistorial" runat="server">
                    <h2>Historial</h2>
                    <p>Revisa tus compras registradas y puntos acumulados con esas compras</p>

                    <asp:GridView ID="gv_Facturas" runat="server" AutoGenerateColumns="False" 
                        DataKeyNames="Id" AllowSorting="True" DataSourceID="SqlDataSourceFacturas" OnRowCommand="gv_Archivos_RowCommand"
                        CssClass="table table-bordered table-hover  margin-top-20" AllowPaging="True" PageSize="10">
                        <Columns>
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
                            <asp:TemplateField HeaderText="Archivo Adjunto">
                                <ItemTemplate>
                                    <asp:LinkButton ID="btnDownload" CssClass="btn btn-cancel" runat="server" Visible='<%# Eval("ArchivoFactura") IsNot DBNull.Value AndAlso Eval("ArchivoFactura") IsNot Nothing %>'
                                        CommandName="Download" CommandArgument='<%# Eval("Id") %>'>
                                        <asp:Literal ID="ltl_download" runat="server" Text="<span class='glyphicon glyphicon-eye-open'></span>"></asp:Literal>
                                    </asp:LinkButton>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" Width="10%"/>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSourceFacturas" runat="server" ConnectionString="<%$ ConnectionStrings:PharmaConnectionString %>" 
                        SelectCommand="Get_Facturas" SelectCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:Parameter Name="Operacion" Type="Int32" DefaultValue="1" />
                            <asp:ControlParameter ControlID="hdf_Usuario" Name="IdUsuario" PropertyName="Value" Type="Int32" />
                            <asp:controlparameter Name="Filtro" ControlID="txt_filtro" DefaultValue=" " PropertyName="Text" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </asp:View>
            </asp:MultiView>
        </div>
    </main>

</asp:Content>
