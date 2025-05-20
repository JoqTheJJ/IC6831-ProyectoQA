Public Class Solicitud
    Implements Visitable

    Public Property Farmacia As String
    Public Property Usuario As String
    Public Property IdUsuario As Integer
    Public Property IdentificacionUsuario As Integer
    Public Property Medicamento As String
    Public Property IdentificacionMedicamento As Integer
    Public Property Fecha As Date
    Public Property Estado As String

    Public Sub New(farmacia As String, usuario As String, idUsuario As Integer, identificacionUsuario As Integer, medicamento As String, idMedicamento As Integer, fecha As Date, estado As String)
        Me.Farmacia = farmacia
        Me.Usuario = usuario
        Me.IdUsuario = idUsuario
        Me.IdentificacionUsuario = identificacionUsuario
        Me.Medicamento = medicamento
        IdentificacionMedicamento = idMedicamento
        Me.Fecha = fecha
        Me.Estado = estado
    End Sub

    Public Sub Aceptar(visitante As Visitante) Implements Visitable.Aceptar
        visitante.VisitarSolicitud(Me)
    End Sub
End Class