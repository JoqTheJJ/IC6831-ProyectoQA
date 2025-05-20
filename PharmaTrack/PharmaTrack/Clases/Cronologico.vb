Public Class Cronologico
    Implements Strategy


    Public Function ObtenerSolicitudes(solicitudes As List(Of Solicitud)) As List(Of Solicitud) Implements Strategy.ObtenerSolicitudes
        If solicitudes Is Nothing OrElse solicitudes.Count = 0 Then
            Return New List(Of Solicitud)()
        End If

        Return OrdenarPorFecha(solicitudes)
    End Function

    Private Function OrdenarPorFecha(solicitudes As List(Of Solicitud)) As List(Of Solicitud)
        Return solicitudes.OrderBy(Function(s) s.Fecha).ToList()
    End Function
End Class