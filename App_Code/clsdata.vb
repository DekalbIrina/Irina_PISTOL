Imports Microsoft.VisualBasic

Public Class clsdata
    Public Shared Function cnn()

        Dim dataconn As String
        dataconn = "Server=IS-SQL-TEST2;Database=Pistol;Trusted_Connection=True;"
        'dataconn = "Server=SQLCLUSTER1;Database=Pistol;User id=Pistol;Password=Pistol;"
        Return dataconn
    End Function

End Class
