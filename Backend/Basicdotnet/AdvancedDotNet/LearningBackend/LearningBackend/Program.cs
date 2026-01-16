using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LearningBackend
{
    internal class Program
    {
        static void Main(string[] args)
        {
            SqlConnection connection = new SqlConnection("Data Source = NIZAMYAPı;initial Catalog = devhub;integrated security = true");
            connection.Open();

            SqlCommand command = new SqlCommand("Select * From TblCategory", connection);
            SqlDataAdapter adapter = new SqlDataAdapter(command);
            DataTable dataTable = new DataTable();

            adapter.Fill(dataTable);

            foreach (DataRow row in dataTable.Rows)
            {
                foreach (var item in row.ItemArray)
                {
                    Console.Write(item.ToString());
                }
                Console.WriteLine();
            }



            Console.Read();

        }
    }
}
