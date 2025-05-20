Public Class VObtenerRegistroDeCanje
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

    Public Sub FiltrarPorCanje(canje As Canje)
        If canje Is Nothing OrElse canje.Solicitudes Is Nothing Then
            Throw New ArgumentException("El canje o su lista de solicitudes no puede ser nulo.")
        End If

        solicitudes = solicitudes.Where(Function(s) canje.Solicitudes.Contains(s)).ToList()
    End Sub

    Public Sub VaciarSolicitudes()
        solicitudes.Clear()
    End Sub
End Class