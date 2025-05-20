Imports System.Data.SqlClient
Imports System.Configuration

Public Class UtilityDB
    Public Shared Function ExecuteStoredProcedure(
        storedProcedureName As String,
        parameters As List(Of SqlParameter)
    ) As Integer
        Dim connectionString As String = ConfigurationManager.ConnectionStrings("PharmaConnectionString").ConnectionString

        Using connection As New SqlConnection(connectionString)
            Using command As New SqlCommand(storedProcedureName, connection)
                command.CommandType = CommandType.StoredProcedure

                If parameters IsNot Nothing Then
                    command.Parameters.AddRange(parameters.ToArray())
                End If

                Try
                    connection.Open()
                    Return command.ExecuteNonQuery()
                Catch ex As Exception
                    Throw New Exception("Error ejecutando el procedimiento almacenado: " & ex.Message, ex)
                End Try
            End Using
        End Using
    End Function
    Public Shared Function ExecuteStoredProcedureWithResult(
        storedProcedureName As String,
        parameters As List(Of SqlParameter)
    ) As DataTable
        Dim connectionString As String = ConfigurationManager.ConnectionStrings("PharmaConnectionString").ConnectionString
        Dim resultTable As New DataTable()

        Using connection As New SqlConnection(connectionString)
            Using command As New SqlCommand(storedProcedureName, connection)
                command.CommandType = CommandType.StoredProcedure
                If parameters IsNot Nothing Then
                    command.Parameters.AddRange(parameters.ToArray())
                End If
                Try
                    connection.Open()
                    Using reader As SqlDataReader = command.ExecuteReader()
                        resultTable.Load(reader)
                    End Using
                Catch ex As Exception
                    Throw New Exception("Error ejecutando el procedimiento almacenado: " & ex.Message, ex)
                End Try
            End Using
        End Using
        Return resultTable
    End Function
End Class
