Public Class Canje
    Public Property Numero As Integer
    Public Property PuntosUsados As Integer
    Public Property Farmacia As String
    Public Property Usuario As String
    Public Property IdUsuario As Integer
    Public Property IdentificacionUsuario As Integer
    Public Property Medicamento As String
    Public Property IdentificacionMedicamento As Integer
    Public Property Fecha As Date
    Public Property Solicitudes As List(Of Solicitud)

    Public Sub New(numero As Integer, farmacia As String, usuario As String, idUsuario As Integer, identificacionUsuario As Integer, medicamento As String, idMedicamento As Integer, fecha As Date)
        Me.Numero = numero
        Me.Farmacia = farmacia
        Me.Usuario = usuario
        Me.IdUsuario = idUsuario
        Me.IdentificacionUsuario = identificacionUsuario
        Me.Medicamento = medicamento
        IdentificacionMedicamento = idMedicamento
        Me.Fecha = fecha
        Solicitudes = New List(Of Solicitud)()
    End Sub

    Public Overrides Function ToString() As String
        Return $"Número: {Numero}, Farmacia: {Farmacia}, Usuario: {Usuario}, Medicamento: {Medicamento}, Fecha: {Fecha.ToShortDateString()}"
    End Function
End Class