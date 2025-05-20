Imports System.Collections.ObjectModel
Imports System.Data
Imports System.Data.SqlClient

Public Class ModuloCanje

    Private Property DBConnection As DBAdapter

    Private Property Solicitudes As List(Of Solicitud)
    Private Property Canjes As List(Of Canje)

    Private Property SCronologico As Cronologico
    Private Property SRespaldadosPorCanje As RespaldadosPorCanje
    Private Property BuscadorSolicitudes As BuscadorSolicitudes

    Private Property VObtenerCanjeables As VObtenerCanjeables
    Private Property VActualizarRegistro As VActualizarRegistro
    Private Property VObtenerRegistroDeCanje As VObtenerRegistroDeCanje


    Public Sub New()
        Solicitudes = New List(Of Solicitud)()
        Canjes = New List(Of Canje)()

        Me.BuscadorSolicitudes = New BuscadorSolicitudes()
        SCronologico = New Cronologico()
        SRespaldadosPorCanje = New RespaldadosPorCanje()

        Me.VObtenerCanjeables = New VObtenerCanjeables()
        Me.VActualizarRegistro = New VActualizarRegistro()
        Me.VObtenerRegistroDeCanje = New VObtenerRegistroDeCanje()
    End Sub


    Private Sub ObtenerSolicitudesBD()
        Solicitudes = DBConnection.GetSolicitudes()
    End Sub
    Private Sub ObtenerCanjesBD()
        Canjes = DBConnection.GetCanjes()
    End Sub





    Public Function VerDetallesParaCanjear(producto As String) As List(Of String)
        Return DBConnection.GetMedicamentos()
    End Function


    Public Sub ActualizarRegistrosCanjeados(canjeadas As List(Of Solicitud))

        VActualizarRegistro.VaciarSolicitudes()
        For Each solicitud In canjeadas
            VActualizarRegistro.VisitarSolicitud(solicitud)
        Next
        VActualizarRegistro.ActualizarRegistros()
    End Sub

    Public Sub CanjearProducto(facturas As List(Of Solicitud))
        ActualizarRegistrosCanjeados(facturas)
    End Sub




    Public Function ObtenerCanjes() As List(Of Canje)
        ObtenerCanjesBD()
        Return Canjes
    End Function

    Public Function ObtenerCanjesPorCliente(identificacion As Integer) As List(Of Canje)
        ObtenerCanjesBD()
        Return Canjes.Where(Function(s) s.IdentificacionUsuario = identificacion).ToList()
    End Function



    Public Function ObtenerSolicitudesCanjeadas(identificacion As Integer) As List(Of Solicitud)

        ObtenerSolicitudesBD()
        BuscadorSolicitudes.SetStrategy(SRespaldadosPorCanje)
        Return BuscadorSolicitudes.ObtenerSolicitudes(Solicitudes)
    End Function

    Public Function ObtenerSolicitudesPorCliente(identificacion As Integer) As List(Of Solicitud)

        ObtenerSolicitudesBD()

        VObtenerCanjeables.VaciarSolicitudes()
        For Each solicitud In Solicitudes
            VObtenerCanjeables.VisitarSolicitud(solicitud)
        Next
        VObtenerCanjeables.FiltrarPorCliente(identificacion)

        Return VObtenerCanjeables.ObtenerSolicitudes()
    End Function

    Public Function ObtenerSolicitudesCronologicamente(identificacion As Integer) As List(Of Solicitud)

        ObtenerSolicitudesBD()
        BuscadorSolicitudes.SetStrategy(SCronologico)
        Return BuscadorSolicitudes.ObtenerSolicitudes(Solicitudes)
    End Function

End Class