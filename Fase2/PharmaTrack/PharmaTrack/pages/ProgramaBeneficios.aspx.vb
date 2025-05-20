Imports System
Imports System.Data.SqlClient
Imports System.Web.Configuration
Public Class _ProgramaBeneficios
    Inherits Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            CargarDatosUsuario(Session("UserId"))
            hdf_Usuario.Value = Session("UserId")
            lbl_NombreMain.Text = Session("UserNombre")
            pnl_MainAdmin.Visible = False
            pnl_MainOperativo.Visible = False
            pnl_MainCliente.Visible = False
            Form.DefaultButton = Me.lnk_Buscar.UniqueID

            Dim rol As Integer = Convert.ToInt32(Session("Rol"))

            Select Case rol
                Case 1
                    pnl_MainAdmin.Visible = True
                Case 2
                    pnl_MainOperativo.Visible = True
                Case Else
                    pnl_MainCliente.Visible = True
            End Select
        End If
    End Sub
    Protected Sub lnk_Buscar_Click(sender As Object, e As EventArgs) Handles lnk_Buscar.Click
        SqlDataSourceFacturasTodas.DataBind()
    End Sub
    Protected Sub lnk_limpiar_Click(sender As Object, e As EventArgs)
        txt_filtro.Text = ""
        SqlDataSourceFacturasTodas.DataBind()
    End Sub
    Protected Sub lnk_BuscarUsuario_Click(sender As Object, e As EventArgs) Handles lnk_BuscarUsuario.Click
        SqlDataSourceUsuariosTodos.DataBind()
    End Sub
    Protected Sub lnk_limpiarUsuario_Click(sender As Object, e As EventArgs)
        txt_filtroUsuarios.Text = ""
        SqlDataSourceUsuariosTodos.DataBind()
    End Sub

    Protected Sub btn_AceptarFactura_Click(sender As Object, e As EventArgs) Handles btn_AceptarFactura.Click
        Dim medicamento As String = ddl_Producto.SelectedValue
        Dim cantidad As String = txt_Cantidad.Text.Trim()
        Dim farmacia As String = ddl_farmacia.SelectedValue
        Dim fechaRegistro As String = txt_FechaRegistro.Text.Trim()

        Dim PharmaConnectionString As String = WebConfigurationManager.ConnectionStrings("PharmaConnectionString").ConnectionString

        Using conexion As New SqlConnection(PharmaConnectionString)
            Dim comando As New SqlCommand("Man_Facturas", conexion)
            comando.CommandType = CommandType.StoredProcedure

            comando.Parameters.AddWithValue("@IdMedicamento", medicamento)
            comando.Parameters.AddWithValue("@IdFarmacia", farmacia)
            comando.Parameters.AddWithValue("@Cantidad", cantidad)
            comando.Parameters.AddWithValue("@FechaRegistro", fechaRegistro)
            comando.Parameters.AddWithValue("@IdEstado", 1)
            comando.Parameters.AddWithValue("@IdUsuario", Session("UserId"))

            Try
                conexion.Open()
                comando.ExecuteNonQuery()
                lbl_error_factura.Text = "Información de la factura ingresada correctamente"
                lbl_error_factura.ForeColor = System.Drawing.Color.Green
                lbl_error_factura.Visible = True
                ddl_farmacia.Enabled = False
                txt_FechaRegistro.Enabled = False
                ddl_Producto.Enabled = False
                txt_Cantidad.Enabled = False
                txt_ImagenFactura.Enabled = False

                pnl_AceptCancelFactura.Visible = False
                pnl_EditarFactura.Visible = True
            Catch ex As Exception
                lbl_error_factura.Text = "Error al actualizar la información del usuario"
                lbl_error_factura.ForeColor = System.Drawing.Color.Red
                lbl_error_factura.Visible = True
            End Try
        End Using
    End Sub
    Protected Sub btnAceptarActualizar_Click(sender As Object, e As EventArgs) Handles btn_AceptarActualizacion.Click

        Dim nombre As String = txt_nombre.Text.Trim()
        Dim primerApellido As String = txt_PApellido.Text.Trim()
        Dim segundoApellido As String = txt_SApellido.Text.Trim()
        Dim cedula As String = txt_cedula.Text.Trim()
        Dim telefono As String = txt_telefono.Text.Trim()
        Dim correo As String = txt_correo.Text.Trim()

        Dim PharmaConnectionString As String = WebConfigurationManager.ConnectionStrings("PharmaConnectionString").ConnectionString

        Using conexion As New SqlConnection(PharmaConnectionString)
            Dim comando As New SqlCommand("Man_Usuarios", conexion)
            comando.CommandType = CommandType.StoredProcedure

            comando.Parameters.AddWithValue("@Nombre", nombre)
            comando.Parameters.AddWithValue("@Apellido1", primerApellido)
            comando.Parameters.AddWithValue("@Apellido2", segundoApellido)
            comando.Parameters.AddWithValue("@Cedula", cedula)
            comando.Parameters.AddWithValue("@Telefono", telefono)
            comando.Parameters.AddWithValue("@Correo", correo)
            comando.Parameters.AddWithValue("@Operacion", 2)
            comando.Parameters.AddWithValue("@Id", Session("UserId"))

            Try
                conexion.Open()
                comando.ExecuteNonQuery()
                lbl_msj_error.Text = "Información del usuario actualizada exitosamente."
                lbl_msj_error.ForeColor = System.Drawing.Color.Green
                lbl_msj_error.Visible = True
                Session("UserNombre") = nombre + " " + primerApellido
                lbl_NombreMain.Text = nombre + " " + primerApellido
                txt_nombre.Enabled = False
                txt_PApellido.Enabled = False
                txt_SApellido.Enabled = False
                txt_cedula.Enabled = False
                txt_telefono.Enabled = False
                txt_correo.Enabled = False

                pnl_AceptCancel.Visible = False
                pnl_actualizarPerfil.Visible = True
            Catch ex As Exception
                lbl_msj_error.Text = "Error al actualizar la información del usuario"
                lbl_msj_error.ForeColor = System.Drawing.Color.Red
                lbl_msj_error.Visible = True
            End Try
        End Using
    End Sub
    Protected Sub CargarDatosUsuario(Usuario As Int32)
        Dim PharmaConnectionString As String = WebConfigurationManager.ConnectionStrings("PharmaConnectionString").ConnectionString

        Using conexion As New SqlConnection(PharmaConnectionString)
            Dim comando As New SqlCommand("Get_Usuarios", conexion)
            comando.CommandType = CommandType.StoredProcedure
            comando.Parameters.AddWithValue("@Usuario", Usuario)
            comando.Parameters.AddWithValue("@Operacion", 1)

            Try
                conexion.Open()
                Dim reader As SqlDataReader = comando.ExecuteReader()

                If reader.Read() Then
                    txt_nombre.Text = reader("Nombre").ToString()
                    txt_PApellido.Text = reader("Apellido1").ToString()
                    txt_SApellido.Text = reader("Apellido2").ToString()
                    txt_cedula.Text = reader("Cedula").ToString()
                    txt_telefono.Text = reader("Telefono").ToString()
                    txt_correo.Text = reader("Correo").ToString()
                Else
                    lbl_msj_error.Text = "Usuario no encontrado."
                    lbl_msj_error.ForeColor = System.Drawing.Color.Red
                    lbl_msj_error.Visible = True
                End If
            Catch ex As Exception
                lbl_msj_error.Text = "Error al cargar los datos del usuario"
                lbl_msj_error.ForeColor = System.Drawing.Color.Red
                lbl_msj_error.Visible = True
            End Try
        End Using
    End Sub
    Protected Sub gv_FacturasAprobacion_RowUpdating(sender As Object, e As GridViewUpdateEventArgs)
        Dim hfIdUsuario As HiddenField = CType(gv_FacturasAprobacion.Rows(e.RowIndex).FindControl("hf_IdUsuario"), HiddenField)
        Dim hfIdMedicamento As HiddenField = CType(gv_FacturasAprobacion.Rows(e.RowIndex).FindControl("hf_IdMedicamento"), HiddenField)
        Dim hfPuntaje As HiddenField = CType(gv_FacturasAprobacion.Rows(e.RowIndex).FindControl("hf_Puntaje"), HiddenField)
        Dim hfCantidad As HiddenField = CType(gv_FacturasAprobacion.Rows(e.RowIndex).FindControl("hf_Cantidad"), HiddenField)

        Dim idUsuario As Integer = Convert.ToInt32(hfIdUsuario.Value)
        Dim idMedicamento As Integer = Convert.ToInt32(hfIdMedicamento.Value)
        Dim puntos As Integer = Convert.ToInt32(hfPuntaje.Value)
        Dim cantidad As Integer = Convert.ToInt32(hfCantidad.Value)
        Dim puntajeObtenido As Integer = puntos * cantidad

        Dim ddlEstado As DropDownList = CType(gv_FacturasAprobacion.Rows(e.RowIndex).FindControl("ddl_Estado"), DropDownList)
        If ddlEstado IsNot Nothing AndAlso ddlEstado.SelectedValue = "2" Then
            Using conn As New SqlConnection(ConfigurationManager.ConnectionStrings("PharmaConnectionString").ConnectionString)
                Using cmd As New SqlCommand("Man_RegistroPuntos", conn)
                    cmd.CommandType = CommandType.StoredProcedure

                    cmd.Parameters.AddWithValue("@IdUsuario", idUsuario)
                    cmd.Parameters.AddWithValue("@IdMedicamento", idMedicamento)
                    cmd.Parameters.AddWithValue("@Puntos", puntajeObtenido)

                    conn.Open()
                    cmd.ExecuteNonQuery()
                End Using
            End Using
        End If
    End Sub


    Protected Sub btn_actualizarPerfil_Click(sender As Object, e As EventArgs) Handles btn_actualizarPerfil.Click

        txt_nombre.Enabled = True
        txt_PApellido.Enabled = True
        txt_SApellido.Enabled = True
        txt_cedula.Enabled = True
        txt_telefono.Enabled = True
        txt_correo.Enabled = True

        pnl_AceptCancel.Visible = True
        pnl_actualizarPerfil.Visible = False
    End Sub
    Protected Sub btn_AgregarFactura_Click(sender As Object, e As EventArgs) Handles btn_AgregarFactura.Click
        ddl_farmacia.Enabled = True
        txt_FechaRegistro.Enabled = True
        ddl_Producto.Enabled = True
        txt_Cantidad.Enabled = True
        txt_ImagenFactura.Enabled = True

        pnl_AceptCancelFactura.Visible = True
        pnl_EditarFactura.Visible = False
    End Sub
    Protected Sub btn_cancelarActualizacion_Click(sender As Object, e As EventArgs) Handles btn_CancelarActualizacion.Click
        CargarDatosUsuario(Session("UserId"))
        txt_nombre.Enabled = False
        txt_PApellido.Enabled = False
        txt_SApellido.Enabled = False
        txt_cedula.Enabled = False
        txt_telefono.Enabled = False
        txt_correo.Enabled = False

        pnl_AceptCancel.Visible = False
        pnl_actualizarPerfil.Visible = True
    End Sub
    Protected Sub btn_CancelarFactura_Click(sender As Object, e As EventArgs) Handles btn_CancelarFactura.Click
        ddl_farmacia.Enabled = False
        txt_FechaRegistro.Enabled = False
        ddl_Producto.Enabled = False
        txt_Cantidad.Enabled = False
        txt_ImagenFactura.Enabled = False

        pnl_AceptCancelFactura.Visible = False
        pnl_EditarFactura.Visible = True
    End Sub
    Protected Sub btn_Perfil_Click(ByVal sender As Object, ByVal e As EventArgs)
        MultiViewMain.ActiveViewIndex = 0
    End Sub

    Protected Sub btn_Usuarios_Click(ByVal sender As Object, ByVal e As EventArgs)
        MultiViewMain.ActiveViewIndex = 1
    End Sub

    Protected Sub btn_Facturas_Click(ByVal sender As Object, ByVal e As EventArgs)
        MultiViewMain.ActiveViewIndex = 2
    End Sub

    Protected Sub btn_Productos_Click(ByVal sender As Object, ByVal e As EventArgs)
        MultiViewMain.ActiveViewIndex = 3
    End Sub

    Protected Sub btn_Estadisticas_Click(ByVal sender As Object, ByVal e As EventArgs)
        MultiViewMain.ActiveViewIndex = 4
    End Sub
    Protected Sub BtnResumen_Click(ByVal sender As Object, ByVal e As EventArgs)
        MultiViewMain.ActiveViewIndex = 5
    End Sub

    Protected Sub BtnRegistrarFactura_Click(ByVal sender As Object, ByVal e As EventArgs)
        MultiViewMain.ActiveViewIndex = 6
    End Sub

    Protected Sub BtnHistorial_Click(ByVal sender As Object, ByVal e As EventArgs)
        MultiViewMain.ActiveViewIndex = 7
    End Sub

    Protected Sub BtnCanjear_Click(ByVal sender As Object, ByVal e As EventArgs)
        MultiViewMain.ActiveViewIndex = 8
    End Sub
End Class