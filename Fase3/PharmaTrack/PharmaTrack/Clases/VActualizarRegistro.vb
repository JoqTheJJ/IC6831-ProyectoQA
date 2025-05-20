Public Class VActualizarRegistro
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

    Public Sub ActualizarRegistros()
        For Each solicitud In solicitudes
            If solicitud.Estado = "Aprobado" Then
                solicitud.Estado = "Aplicado"
            End If
        Next
    End Sub

    Public Sub VaciarSolicitudes()
        solicitudes.Clear()
    End Sub
End Class