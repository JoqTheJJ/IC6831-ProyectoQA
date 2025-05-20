Public Class BuscadorSolicitudes
    Private Property Strategy As Strategy

    Public Sub SetStrategy(s As Strategy)
        Strategy = s
    End Sub

    Public Function ObtenerSolicitudes(solicitudes As List(Of Solicitud)) As List(Of Solicitud)
        Return Strategy.ObtenerSolicitudes(solicitudes)
    End Function

End Class