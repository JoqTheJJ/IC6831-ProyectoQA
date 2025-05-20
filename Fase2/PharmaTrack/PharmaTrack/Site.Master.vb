Public Class SiteMaster
    Inherits MasterPage
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs) Handles Me.Load
        If Session("UserId") IsNot Nothing Then
            btnCerrarSesion.Visible = True
            a_inicio.Visible = False
        Else
            btnCerrarSesion.Visible = False
            a_inicio.Visible = True
        End If
    End Sub
    Protected Sub btnCerrarSesion_Click(ByVal sender As Object, ByVal e As EventArgs) Handles btnCerrarSesion.Click
        FormsAuthentication.SignOut()
        Session.Clear()
        Session.Abandon()
        Response.Redirect("~/")
    End Sub
End Class