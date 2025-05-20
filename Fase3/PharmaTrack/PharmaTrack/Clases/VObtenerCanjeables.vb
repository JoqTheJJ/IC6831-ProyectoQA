Public Class VObtenerCanjeables
    Implements Visitante

    Private solicitudes As List(Of Solicitud)

    Public Sub New()
        solicitudes = New List(Of Solicitud)()
    End Sub


    Public Sub VisitarSolicitud(s As Solicitud) Implements Visitante.VisitarSolicitud
        If s IsNot Nothing Then
            solicitudes.Add(s)
        End If
    End Sub

    Public Function ObtenerSolicitudes() As List(Of Solicitud)
        Return solicitudes
    End Function

    Public Sub FiltrarPorCliente(usuario As Integer)
        solicitudes.RemoveAll(Function(s) s.Usuario <> usuario)
    End Sub

    Public Sub VaciarSolicitudes()
        solicitudes.Clear()
    End Sub
End Class