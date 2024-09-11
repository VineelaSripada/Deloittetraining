
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System;
using System.Data;
using System.Data.SqlClient;


namespace ConsoleApp3
{
    internal class Program
    {
        static void Main(string[] args)
        {
            string connStr = "Server=USHYDVMAHALAXM1; Database=Sept2024Db; Integrated Security=true";

            string cmdText = "SELECT * FROM PRODUCT";

            SqlDataAdapter adapter = new SqlDataAdapter(cmdText, connStr);
            DataSet ds = new DataSet();

            adapter.Fill(ds);

            foreach (DataRow row in ds.Tables[0].Rows)
            {
                Console.WriteLine("{0},{1},{2}, {3}, {4}", row["PRODUCTID"].ToString(), row["P_NAME"].ToString(), row["PRICE"].ToString(), row["QUANTITY"].ToString(), row["CATEGORY"].ToString());
            }

            Console.ReadLine();
        }
    }
}