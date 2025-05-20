Imports System
Imports System.Data.SqlClient
Imports System.Web.Configuration
Public Class _logonFarmacia
    Inherits Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs) Handles Me.Load

    End Sub
    Protected Sub btnLoginFarmacia_Click(sender As Object, e As EventArgs) Handles btn_accesoFarmacia.Click
        Dim farmaciaID As String = ddl_farmacia.SelectedValue
        Dim farmaciaNombre As String = ddl_farmacia.SelectedItem.Text
        Session("FarmaciaID") = farmaciaID
        Session("FarmaciaNombre") = farmaciaNombre
        Response.Redirect("~/pages/ModuloCanjes.aspx")

    End Sub
End Class