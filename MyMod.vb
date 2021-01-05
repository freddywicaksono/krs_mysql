﻿Imports MySql.Data.MySqlClient
Module MyMod
    Public myCommand As New MySqlCommand
    Public myAdapter As New MySqlDataAdapter
    Public myData As New DataTable
    Public DR As MySql.Data.MySqlClient.MySqlDataReader
    Public SQL As String
    Public conn As New MySql.Data.MySqlClient.MySqlConnection

    Public dosen_baru As Boolean
    Public oDosen As New Dosen

    Public fakultas_baru As Boolean
    Public oFakultas As New Fakultas

    Public krs_baru As Boolean
    Public krsdetail_baru As Boolean
    Public oKrs As New Krs

    Public mahasiswa_baru As Boolean
    Public oMahasiswa As New Mahasiswa

    Public matakuliah_baru As Boolean
    Public oMatakuliah As New Matakuliah

    Public prodi_baru As Boolean
    Public oProdi As New Prodi

    Public nobukti As Double
    Public R As Random = New Random

    Public Sub DBConnect()
        conn.ConnectionString = "server=localhost;" & _
        "user id=root;" & _
        "password=;" & _
        "database=dbmaster"
        Try
            conn.Open()
        Catch ex As Exception
            MessageBox.Show("Error: " & ex.Message)
        Finally
            If (conn.State = ConnectionState.Open) Then
            Else
                MessageBox.Show("Sorry not connected.")
            End If
        End Try
    End Sub

    Public Sub DBDisconnect()

        If (conn.State = ConnectionState.Open) Then
            conn.Close()
            conn.Dispose()
        End If
    End Sub

    Public Function getMD5Hash(ByVal strToHash As String) As String

        Dim md5Obj As New System.Security.Cryptography.MD5CryptoServiceProvider()
        Dim bytesToHash() As Byte = System.Text.Encoding.ASCII.GetBytes(strToHash)
        bytesToHash = md5Obj.ComputeHash(bytesToHash)
        Dim strResult As String = ""
        Dim b As Byte
        For Each b In bytesToHash
            strResult += b.ToString("x2")
        Next
        Return strResult
    End Function
    

    Public Function getNomorBukti()
        Dim res As Double
        res = R.Next(1000000, 9999999)
        Return res
    End Function
End Module
