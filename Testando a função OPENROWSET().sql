/*
"The built-in SQL Server function OPENROWSET() provides a way to access remote data from an OLE DB data source. 
It can be used with the BULK rowset provider to read data from a file without loading the data into a target table. 
This post will show the basics to get started with OPENROWSET(), the BULK rowset provider, and text files of fixed-width data fields."

Fonte: https://itsalljustelectrons.blogspot.com/2016/01/Openrowset-Bulk-Rowset-Provider.html

/*


/*

pessoas.txt
--------------------------------------------------------------------------------------
EM        Ken                      Sánchez                            0    02/08/2003
EM        Terri                    Duffy                              1    02/24/2002
EM        Gary                     Altman                   III       0    12/27/2003
EM        Rob                      Walters                            0    12/29/2001
EMMs.     Gail                     Erickson                           0    01/30/2002
EMMr.     Jossef                   Goldberg                           0    02/17/2002
--------------------------------------------------------------------------------------


formato.xml
-----------------------------------------------------------------------------------------------------------------------------------------
<?xml version="1.0"?>
<BCPFORMAT xmlns="http://schemas.microsoft.com/sqlserver/2004/bulkload/format" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
 <RECORD>
  <FIELD ID="1" xsi:type="CharFixed" LENGTH="2" COLLATION="SQL_Latin1_General_CP1_CI_AS"/>
  <FIELD ID="2" xsi:type="CharFixed" LENGTH="8" COLLATION="SQL_Latin1_General_CP1_CI_AS"/>
  <FIELD ID="3" xsi:type="CharFixed" LENGTH="25" COLLATION="SQL_Latin1_General_CP1_CI_AS"/>
  <FIELD ID="4" xsi:type="CharFixed" LENGTH="25" COLLATION="SQL_Latin1_General_CP1_CI_AS"/>
  <FIELD ID="5" xsi:type="CharFixed" LENGTH="10" COLLATION="SQL_Latin1_General_CP1_CI_AS"/>
  <FIELD ID="6" xsi:type="CharFixed" LENGTH="5" COLLATION="SQL_Latin1_General_CP1_CI_AS"/>
  <FIELD ID="7" xsi:type="CharTerm" TERMINATOR="\r\n" MAX_LENGTH="10" COLLATION="SQL_Latin1_General_CP1_CI_AS"/>
 </RECORD>
 <ROW>
  <COLUMN SOURCE="1" NAME="PersonType" xsi:type="SQLCHAR"/>
  <COLUMN SOURCE="2" NAME="Title" xsi:type="SQLCHAR"/>
  <COLUMN SOURCE="3" NAME="FirstName" xsi:type="SQLCHAR"/>
  <COLUMN SOURCE="4" NAME="LastName" xsi:type="SQLCHAR"/>
  <COLUMN SOURCE="5" NAME="Suffix" xsi:type="SQLCHAR"/>
  <COLUMN SOURCE="6" NAME="EmailPromotion" xsi:type="SQLCHAR"/>
  <COLUMN SOURCE="7" NAME="HireDate" xsi:type="SQLCHAR"/>
 </ROW>
</BCPFORMAT>
-----------------------------------------------------------------------------------------------------------------------------------------

*/



select * 

from openrowset( bulk 'C:\Teste abc\pessoas.txt', formatfile = 'C:\Teste abc\formato.xml') as d

where FirstName = 'Ken'
