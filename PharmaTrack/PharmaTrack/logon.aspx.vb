Imports System
Imports System.Data.SqlClient
Imports System.Web.Configuration
Public Class _logon
    Inherits Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs) Handles Me.Load

    End Sub
    Protected Sub btnLogin_Click(sender As Object, e As EventArgs) Handles btn_iniciosesion.Click
        Dim usuario As String = txt_correo.Text.Trim()
        Dim contrasena As String = txt_contrasena.Text.Trim()

        If String.IsNullOrEmpty(usuario) OrElse String.IsNullOrEmpty(contrasena) Then
            lbl_msj_error.Text = "Por favor ingrese usuario y contraseña."
            lbl_msj_error.Visible = True
            Return
        End If

        Dim PharmaConnectionString As String = WebConfigurationManager.ConnectionStrings("PharmaConnectionString").ConnectionString
        Using conexion As New SqlConnection(PharmaConnectionString)
            Dim comando As New SqlCommand("Valida_Usuario", conexion)
            comando.CommandType = CommandType.StoredProcedure
            comando.Parameters.AddWithValue("@Correo", usuario)
            comando.Parameters.AddWithValue("@Contrasena", contrasena)

            Try
                conexion.Open()
                Using reader As SqlDataReader = comando.ExecuteReader()

                    If reader.Read() Then
                        Session("UserId") = reader("Id")
                        Session("Rol") = reader("Rol")
                        Session("UserNombre") = reader("NombreCliente")
                        Response.Redirect("~/pages/ProgramaBeneficios.aspx")
                    Else
                        lbl_msj_error.Text = "Usuario o contraseña incorrectos."
                        lbl_msj_error.Visible = True
                    End If
                End Using
            Catch ex As Exception
                lbl_msj_error.Text = "Error al intentar iniciar sesión"
                lbl_msj_error.Visible = True
            End Try
        End Using
    End Sub
End Class