Imports System
Imports System.Data.SqlClient
Imports System.Web.Configuration
Public Class _register
    Inherits Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs) Handles Me.Load

    End Sub
    Protected Sub btnRegistrar_Click(sender As Object, e As EventArgs) Handles btn_registro.Click

        Dim nombre As String = txt_nombre.Text.Trim()
        Dim primerApellido As String = txt_PApellido.Text.Trim()
        Dim segundoApellido As String = txt_SApellido.Text.Trim()
        Dim cedula As String = txt_cedula.Text.Trim()
        Dim telefono As String = txt_telefono.Text.Trim()
        Dim correo As String = txt_correo.Text.Trim()
        Dim contrasena As String = txt_contraseña.Text.Trim()
        Dim confirmarContrasena As String = txt_confirma_contraseña.Text.Trim()

        If contrasena <> confirmarContrasena Then
            lbl_msj_error.Text = "Las contraseñas no coinciden. Por favor, verifique."
            lbl_msj_error.Visible = True
            Return
        End If

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
            comando.Parameters.AddWithValue("@Contrasena", contrasena)
            comando.Parameters.AddWithValue("@Operacion", 1)
            comando.Parameters.AddWithValue("@Rol", 3)

            Try
                conexion.Open()
                comando.ExecuteNonQuery()
                lbl_msj_error.Text = "Usuario registrado exitosamente."
                lbl_msj_error.ForeColor = System.Drawing.Color.Green
                lbl_msj_error.Visible = True
            Catch ex As Exception
                lbl_msj_error.Text = "Error al registrar el usuario"
                lbl_msj_error.ForeColor = System.Drawing.Color.Red
                lbl_msj_error.Visible = True
            End Try
        End Using
    End Sub
End Class