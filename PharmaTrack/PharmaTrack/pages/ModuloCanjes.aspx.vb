Imports System
Imports System.Data.SqlClient
Imports System.Web.Configuration
Public Class _ModuloCanjes
    Inherits Page
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            hdf_Farmacia.Value = Session("FarmaciaID")
            lbl_NombreMain.Text = Session("FarmaciaNombre")
            Form.DefaultButton = Me.lnk_BuscarUsuario.UniqueID
        End If
    End Sub
    Protected Sub BtnCanjear_Click(sender As Object, e As EventArgs)
        Dim IdFarmacia As Integer = Session("FarmaciaID")
        If MultiViewFarmacia IsNot Nothing AndAlso MultiViewFarmacia.ActiveViewIndex = 0 Then
            Dim view_Usuarios As View = MultiViewFarmacia.Views(0)

            If view_Usuarios IsNot Nothing Then
                Dim gv_UsuariosFarmacia As GridView = CType(view_Usuarios.FindControl("gv_UsuariosFarmacia"), GridView)
                If gv_UsuariosFarmacia IsNot Nothing AndAlso gv_UsuariosFarmacia.Rows.Count > 0 Then
                    Dim row As GridViewRow = gv_UsuariosFarmacia.Rows(0)
                    Dim hdfUsuario As HiddenField = CType(row.FindControl("hdf_Usuario"), HiddenField)

                    If hdfUsuario IsNot Nothing Then
                        Dim IdUsuario As Integer = Convert.ToInt32(hdfUsuario.Value)
                        Dim gv_Puntaje As GridView = CType(row.FindControl("gv_Puntaje"), GridView)
                        If gv_Puntaje IsNot Nothing AndAlso gv_Puntaje.Rows.Count > 0 Then
                            Dim BtnCanjear As LinkButton = CType(sender, LinkButton)
                            Dim puntajeRow As GridViewRow = CType(BtnCanjear.NamingContainer, GridViewRow)

                            Dim hf_MedicamentoCanje As HiddenField = CType(puntajeRow.FindControl("hf_MedicamentoCanje"), HiddenField)
                            Dim hf_CostoCanje As HiddenField = CType(puntajeRow.FindControl("hf_CostoCanje"), HiddenField)

                            If hf_MedicamentoCanje IsNot Nothing AndAlso hf_CostoCanje IsNot Nothing Then
                                Dim IdMedicamento As Integer = Convert.ToInt32(hf_MedicamentoCanje.Value)
                                Dim CostoCanje As Decimal = Convert.ToDecimal(hf_CostoCanje.Value)
                                Try
                                    Dim parameters As New List(Of SqlParameter) From {
                                            New SqlParameter("@IdMedicamento", IdMedicamento),
                                            New SqlParameter("@IdFarmacia", IdFarmacia),
                                            New SqlParameter("@IdUsuario", IdUsuario),
                                            New SqlParameter("@CostoCanje", CostoCanje)
                                        }

                                    Dim rowsAffected As Integer = UtilityDB.ExecuteStoredProcedure("Man_Canjes", parameters)
                                    If rowsAffected > 0 Then
                                        Dim script As String = $"alert('Canje exitoso');"
                                        ClientScript.RegisterStartupScript(Me.GetType(), "Popup", script, True)
                                    Else
                                        Dim script As String = "alert('No se realizó el canje');"
                                        ClientScript.RegisterStartupScript(Me.GetType(), "Popup", script, True)
                                    End If

                                Catch ex As Exception
                                    Response.Write("Error al ejecutar el procedimiento almacenado: " & ex.Message & "<br />")
                                End Try
                            Else
                                Response.Write("HiddenFields no encontrados en gv_Puntaje<br />")
                            End If
                        Else
                            Response.Write("gv_Puntaje no encontrado o no tiene filas<br />")
                        End If
                    Else
                        Response.Write("HiddenField no encontrado")
                    End If
                Else
                    Response.Write("GridView no encontrado o no tiene filas")
                End If
            Else
                Response.Write("View no encontrado")
            End If
        Else
            Response.Write("MultiView no encontrado o el View no está activo")
        End If
    End Sub
    Protected Sub lnk_BuscarUsuario_Click(sender As Object, e As EventArgs) Handles lnk_BuscarUsuario.Click
        SqlDataSourceUsuariosTodos.DataBind()
    End Sub
    Protected Sub lnk_limpiarUsuario_Click(sender As Object, e As EventArgs)
        txt_filtroUsuarios.Text = ""
        SqlDataSourceUsuariosTodos.DataBind()
    End Sub
    Protected Sub btn_Usuarios_Click(ByVal sender As Object, ByVal e As EventArgs)
        MultiViewFarmacia.ActiveViewIndex = 0
    End Sub
    Protected Sub btn_Historial_Click(ByVal sender As Object, ByVal e As EventArgs)
        MultiViewFarmacia.ActiveViewIndex = 1
    End Sub
End Class