Imports System.Data.SqlClient

Public Class DBAdapter

    Public Function GetSolicitudes() As List(Of Solicitud)
        'Procedimiento
        Dim Procedure As String = "Get_Solicitudes"

        'Parametros
        Dim Parameters As New List(Of SqlParameter)()

        Try
            Dim Resultado As DataTable = UtilityDB.ExecuteStoredProcedureWithResult(Procedure, Parameters)
            Dim solicitudes As New List(Of Solicitud)()

            If Resultado IsNot Nothing Then
                For Each row As DataRow In Resultado.Rows
                    Dim farmacia As String = row("NombreFarmacia")
                    Dim usuario As String = row("NombreUsuario")
                    Dim identificacionusuario As Integer = Convert.ToInt32(row("IdentificacionUsuario"))
                    Dim idusuario As Integer = Convert.ToInt32(row("IdUsuario"))
                    Dim medicamento As String = row("NombreMedicamento")
                    Dim idmedicamento As Integer = Convert.ToInt32(row("IdMedicamento"))
                    Dim estado As String = row("EstadoFactura")
                    Dim fecha As Date = Convert.ToDateTime(row("FechaRegistro"))

                    Dim solicitud As New Solicitud(farmacia, usuario, idusuario, identificacionusuario, medicamento, idmedicamento, fecha, estado)
                    solicitudes.Add(solicitud)
                Next
            End If

            Return solicitudes

        Catch ex As Exception
            Console.WriteLine($"An error occurred: {ex.Message}")
            Return New List(Of Solicitud)()
        End Try
    End Function

    Public Function GetSolicitudesByIdentificacion(identificacion As Integer) As List(Of Solicitud)
        ' Procedimiento
        Dim Procedure As String = "Get_Solicitudes_ByIdentificacion"

        ' Parámetros
        Dim Parameters As New List(Of SqlParameter)()
        Parameters.Add(New SqlParameter("@IdentificacionUsuario", SqlDbType.Int) With {.Value = identificacion})

        Try
            Dim Resultado As DataTable = UtilityDB.ExecuteStoredProcedureWithResult(Procedure, Parameters)
            Dim solicitudes As New List(Of Solicitud)()

            If Resultado IsNot Nothing Then
                For Each row As DataRow In Resultado.Rows
                    Dim farmacia As String = row("NombreFarmacia")
                    Dim usuario As String = row("NombreUsuario")
                    Dim identificacionusuario As String = row("IdentificacionUsuario").ToString()
                    Dim idusuario As Integer = Convert.ToInt32(row("IdUsuario"))
                    Dim medicamento As String = row("NombreMedicamento")
                    Dim idmedicamento As Integer = Convert.ToInt32(row("IdMedicamento"))
                    Dim estado As String = row("EstadoFactura")
                    Dim fecha As Date = Convert.ToDateTime(row("FechaRegistro"))

                    Dim solicitud As New Solicitud(farmacia, usuario, idusuario, identificacionusuario, medicamento, idmedicamento, fecha, estado)
                    solicitudes.Add(solicitud)
                Next
            End If

            Return solicitudes

        Catch ex As Exception
            Console.WriteLine($"An error occurred: {ex.Message}")
            Return New List(Of Solicitud)()
        End Try
    End Function

    Public Function GetSolicitudesById(idUsuario As Integer) As List(Of Solicitud)
        ' Procedimiento
        Dim Procedure As String = "Get_Solicitudes_ById"

        ' Parámetros
        Dim Parameters As New List(Of SqlParameter)()
        Parameters.Add(New SqlParameter("@IdUsuario", SqlDbType.Int) With {.Value = idUsuario})

        Try
            Dim Resultado As DataTable = UtilityDB.ExecuteStoredProcedureWithResult(Procedure, Parameters)
            Dim solicitudes As New List(Of Solicitud)()

            If Resultado IsNot Nothing Then
                For Each row As DataRow In Resultado.Rows
                    Dim farmacia As String = row("NombreFarmacia")
                    Dim usuario As String = row("NombreUsuario")
                    Dim identificacionusuario As String = row("IdentificacionUsuario").ToString()
                    Dim iddusuario As Integer = Convert.ToInt32(row("IdUsuario"))
                    Dim medicamento As String = row("NombreMedicamento")
                    Dim idmedicamento As Integer = Convert.ToInt32(row("IdMedicamento"))
                    Dim estado As String = row("EstadoFactura")
                    Dim fecha As Date = Convert.ToDateTime(row("FechaRegistro"))

                    Dim solicitud As New Solicitud(farmacia, usuario, iddusuario, identificacionusuario, medicamento, idmedicamento, fecha, estado)
                    solicitudes.Add(solicitud)
                Next
            End If

            Return solicitudes

        Catch ex As Exception
            Console.WriteLine($"An error occurred: {ex.Message}")
            Return New List(Of Solicitud)()
        End Try
    End Function




    Public Function GetCanjes() As List(Of Canje)
        'Procedimiento
        Dim Procedure As String = "Get_Canjes"

        'Parametros
        Dim Parameters As New List(Of SqlParameter)()

        Try
            Dim Resultado As DataTable = UtilityDB.ExecuteStoredProcedureWithResult(Procedure, Parameters)
            Dim canjes As New List(Of Canje)()

            If Resultado IsNot Nothing Then
                For Each row As DataRow In Resultado.Rows
                    Dim numero As Integer = Convert.ToInt32(row("NumeroCanje"))
                    Dim fecha As Date = Convert.ToDateTime(row("FechaCanje"))
                    Dim farmacia As String = row("NombreFarmacia").ToString()
                    Dim usuario As String = row("NombreUsuario")
                    Dim identificacionusuario As Integer = Convert.ToInt32(row("IdentificacionUsuario"))
                    Dim idusuario As Integer = Convert.ToInt32(row("IdUsuario"))
                    Dim medicamento As String = row("NombreMedicamento")
                    Dim idmedicamento As Integer = Convert.ToInt32(row("IdMedicamento"))

                    Dim canje As New Canje(numero, farmacia, usuario, idusuario, identificacionusuario, medicamento, idmedicamento, fecha)
                    canjes.Add(canje)
                Next
            End If

            Return canjes

        Catch ex As Exception
            Console.WriteLine($"An error occurred: {ex.Message}")
            Return New List(Of Canje)()
        End Try
    End Function

    Public Function GetCanjesByIdentificacion(identificacion As Integer) As List(Of Canje)
        ' Procedimiento
        Dim Procedure As String = "Get_Canjes_ByIdentificacion"

        ' Parámetros
        Dim Parameters As New List(Of SqlParameter)()
        Parameters.Add(New SqlParameter("@IdentificacionUsuario", SqlDbType.Int) With {.Value = identificacion})

        Try
            Dim Resultado As DataTable = UtilityDB.ExecuteStoredProcedureWithResult(Procedure, Parameters)
            Dim canjes As New List(Of Canje)()

            If Resultado IsNot Nothing Then
                For Each row As DataRow In Resultado.Rows
                    Dim numero As Integer = Convert.ToInt32(row("NumeroCanje"))
                    Dim fecha As Date = Convert.ToDateTime(row("FechaCanje"))
                    Dim farmacia As String = row("NombreFarmacia").ToString()
                    Dim usuario As String = row("NombreUsuario").ToString()
                    Dim identificacionusuario As String = row("IdentificacionUsuario").ToString()
                    Dim idusuario As Integer = Convert.ToInt32(row("IdUsuario"))
                    Dim medicamento As String = row("NombreMedicamento").ToString()
                    Dim idmedicamento As Integer = Convert.ToInt32(row("IdMedicamento"))

                    Dim canje As New Canje(numero, farmacia, usuario, idusuario, identificacionusuario, medicamento, idmedicamento, fecha)
                    canjes.Add(canje)
                Next
            End If

            Return canjes

        Catch ex As Exception
            Console.WriteLine($"An error occurred: {ex.Message}")
            Return New List(Of Canje)()
        End Try
    End Function

    Public Function GetCanjesById(idUsuario As Integer) As List(Of Canje)
        ' Procedimiento
        Dim Procedure As String = "Get_Canjes_ById"

        ' Parámetros
        Dim Parameters As New List(Of SqlParameter)()
        Parameters.Add(New SqlParameter("@IdUsuario", SqlDbType.Int) With {.Value = idUsuario})

        Try
            Dim Resultado As DataTable = UtilityDB.ExecuteStoredProcedureWithResult(Procedure, Parameters)
            Dim canjes As New List(Of Canje)()

            If Resultado IsNot Nothing Then
                For Each row As DataRow In Resultado.Rows
                    Dim numero As Integer = Convert.ToInt32(row("NumeroCanje"))
                    Dim fecha As Date = Convert.ToDateTime(row("FechaCanje"))
                    Dim farmacia As String = row("NombreFarmacia").ToString()
                    Dim usuario As String = row("NombreUsuario").ToString()
                    Dim identificacionusuario As Integer = Convert.ToInt32(row("IdentificacionUsuario"))
                    Dim iddusuario As Integer = Convert.ToInt32(row("IdUsuario"))
                    Dim medicamento As String = row("NombreMedicamento").ToString()
                    Dim idmedicamento As Integer = Convert.ToInt32(row("IdMedicamento"))

                    Dim canje As New Canje(numero, farmacia, usuario, iddusuario, identificacionusuario, medicamento, idmedicamento, fecha)
                    canjes.Add(canje)
                Next
            End If

            Return canjes

        Catch ex As Exception
            Console.WriteLine($"An error occurred: {ex.Message}")
            Return New List(Of Canje)()
        End Try
    End Function


    Public Function GetMedicamentos() As List(Of String)
        'Procedimiento
        Dim Procedure As String = "Get_MedicamentoParticipante"

        'Parametros
        Dim Parameters As New List(Of SqlParameter)()

        Try
            Dim Resultado As DataTable = UtilityDB.ExecuteStoredProcedureWithResult(Procedure, Parameters)
            Dim meds As New List(Of String)()

            If Resultado IsNot Nothing Then
                For Each row As DataRow In Resultado.Rows
                    Dim id As Integer = Convert.ToInt32(row("Id"))
                    Dim puntaje As Integer = Convert.ToInt32(row("Puntaje"))
                    Dim precio As Integer = Convert.ToInt32(row("Precio"))
                    Dim nombre As String = row("Nombre").ToString()
                    Dim idMedicamento As Integer = Convert.ToInt32(row("IdMedicamento"))
                    Dim visible As Integer = Convert.ToInt32(row("Visible"))
                    Dim operacion As Integer = Convert.ToInt32(row("Operacion"))

                    Dim med As String = $"Id: {id}, Puntaje: {puntaje}, Precio: {precio}, " &
                            $"Nombre: {nombre}, IdMedicamento: {idMedicamento}, " &
                            $"Visible: {visible}, Operacion: {operacion}"
                    meds.Add(med)
                Next
            End If

            Return meds

        Catch ex As Exception
            Console.WriteLine($"An error occurred: {ex.Message}")
            Return New List(Of String)()
        End Try
    End Function

    Public Sub RegistrarSolicitudesCanjeadas(solicitudes As List(Of Solicitud))
        Dim procedure As String = "Man_Facturas"

        Try
            For Each solicitud As Solicitud In solicitudes
                Dim parameters As New List(Of SqlParameter) From {
                    New SqlParameter("@Operacion", 0),
                    New SqlParameter("@Id", DBNull.Value),
                    New SqlParameter("@IdEstado", 4),
                    New SqlParameter("@IdMedicamento", solicitud.IdentificacionMedicamento),
                    New SqlParameter("@IdFarmacia", DBNull.Value),
                    New SqlParameter("@IdUsuario", solicitud.IdUsuario),
                    New SqlParameter("@Cantidad", 1),
                    New SqlParameter("@FechaRegistro", solicitud.Fecha),
                    New SqlParameter("@Foto", DBNull.Value)
                }

                UtilityDB.ExecuteStoredProcedure(procedure, parameters)
            Next

            Console.WriteLine("All solicitudes processed successfully.")
        Catch ex As Exception
            Console.WriteLine($"An error occurred: {ex.Message}")
        End Try
    End Sub


End Class