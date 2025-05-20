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
                    Dim puntosUsados As Integer = Convert.ToInt32(row("PuntosUsados"))
                    Dim fecha As Date = Convert.ToDateTime(row("FechaCanje"))
                    Dim farmacia As String = row("NombreFarmacia").ToString()
                    Dim usuario As String = row("NombreUsuario")
                    Dim identificacionusuario As Integer = Convert.ToInt32(row("IdentificacionUsuario"))
                    Dim idusuario As Integer = Convert.ToInt32(row("IdUsuario"))
                    Dim medicamento As String = row("NombreMedicamento")
                    Dim idmedicamento As Integer = Convert.ToInt32(row("IdMedicamento"))

                    Dim canje As New Canje(numero, puntosUsados, farmacia, usuario, idusuario, identificacionusuario, medicamento, idmedicamento, fecha)
                    canjes.Add(canje)
                Next
            End If

            Return canjes

        Catch ex As Exception
            Console.WriteLine($"An error occurred: {ex.Message}")
        End Try
    End Function


    Private Function ExampleEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE()

        'Procedimiento
        Dim Procedure As String = "ObtenerFacturasConClientesYEstados" ' Replace with your actual stored procedure name

        'Parametros
        Dim Parameters As New List(Of SqlParameter)()
        Parameters.Add(New SqlParameter("@Parameter1", SqlDbType.Int) With {.Value = 123})
        Parameters.Add(New SqlParameter("@Parameter2", SqlDbType.VarChar, 50) With {.Value = "TestValue"})

        Try
            ' Call the ExecuteStoredProcedureWithResult function
            Dim Resultado As DataTable = UtilityDB.ExecuteStoredProcedureWithResult(Procedure, Parameters)

            ' Check the results
            If Resultado IsNot Nothing AndAlso Resultado.Rows.Count > 0 Then
                Console.WriteLine("Stored procedure executed successfully. Results:")
                For Each row As DataRow In Resultado.Rows
                    For Each column As DataColumn In Resultado.Columns
                        Console.Write($"{column.ColumnName}: {row(column)}, ")
                    Next
                    Console.WriteLine()
                Next
            Else
                Console.WriteLine("Stored procedure executed successfully, but no results returned.")
            End If

            Return Resultado

        Catch ex As Exception
            Console.WriteLine($"An error occurred: {ex.Message}")
        End Try

    End Function

End Class