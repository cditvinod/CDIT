using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;


public class connection
{
	public connection()
	{

	}
    public static SqlConnection getConnection()
    {
        SqlConnection c = new SqlConnection("Data Source=DESKTOP\\SQLEXPRESS; Initial Catalog=thechaidhaba; User Id=sa; Password=Abc123$*");
        //SqlConnection c = new SqlConnection("Data Source=199.79.62.22; Initial Catalog=ChaiDB; User Id=ChaiDhabaSA; Password=Abc123$*");
        return c;
    }
}