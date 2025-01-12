using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
using System.Xml;
using AjaxControlToolkit;
using System.IO;
using System.Web.Configuration;
using System.Data.SqlTypes;
using System.Xml.Linq;
using System.Text.RegularExpressions;
using AjaxControlToolkit.HtmlEditor.ToolbarButtons;
using Microsoft.SqlServer.Server;
using System.Text;
using System.Configuration;
using System.Security.Cryptography;

namespace AKSS_Management
{

    public static class CommonUtility
    {
        private static readonly string connectionString = ConfigurationManager.ConnectionStrings["dbConnection"].ToString(); //"your_connection_string_here";

        /* ExecuteStoredProcedureNonQueryAsync  */
        //string spname = "SPNAME";
        //SqlParameter[] parameters = {
        //    new SqlParameter("@Value1", value1),
        //    new SqlParameter("@Value2", value2)
        //};
        //int rowsInserted = await CommonUtility.ExecuteStoredProcedureNonQueryAsync(spname, parameters);

        public static async Task<int> ExecuteStoredProcedureNonQueryAsync(string procedureName, SqlParameter[] parameters)
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                using (SqlCommand cmd = new SqlCommand(procedureName, conn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    if (parameters != null)
                    {
                        cmd.Parameters.AddRange(parameters);
                    }
                    await conn.OpenAsync();
                    return await cmd.ExecuteNonQueryAsync();
                }
            }
        }

        /* ExecuteStoredProcedureScalarAsync  */
        //string spname = "SPNAME";
        //SqlParameter[] scalarParameters = {
        //    new SqlParameter("@Value1", value1)
        //};
        //object result = await CommonUtility.ExecuteStoredProcedureScalarAsync(spname, scalarParameters);
        //int count = Convert.ToInt32(result);

        public static async Task<object> ExecuteStoredProcedureScalarAsync(string procedureName, SqlParameter[] parameters)
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                using (SqlCommand cmd = new SqlCommand(procedureName, conn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    if (parameters != null)
                    {
                        cmd.Parameters.AddRange(parameters);
                    }
                    await conn.OpenAsync();
                    return await cmd.ExecuteScalarAsync();
                }
            }
        }

        /* ExecuteStoredProcedureDataTableAsync  */
        //string spname = "SPNAME";
        //SqlParameter[] parameters = {
        //    new SqlParameter("@Value1", value1)
        //};
        //DataTable dataTable = await CommonUtility.ExecuteStoredProcedureDataTableAsync(spname, parameters);

       
        public static async Task<DataTable> ExecuteStoredProcedureDataTableAsync(string procedureName, SqlParameter[] parameters)
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                using (SqlCommand cmd = new SqlCommand(procedureName, conn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    if (parameters != null)
                    {
                        cmd.Parameters.AddRange(parameters);
                    }
                    using (SqlDataAdapter adapter = new SqlDataAdapter(cmd))
                    {
                        DataTable dataTable = new DataTable();
                        await Task.Run(() => adapter.Fill(dataTable));
                        return dataTable;
                    }
                }
            }
        }

        /* ExecuteStoredProcedureDataSetAsync  */
        //string spname = "SPNAME";
        //SqlParameter[] parameters = {
        //    new SqlParameter("@Value1", value1),
        //    new SqlParameter("@Value2", value2)
        //};
        //DataSet dataSet = await CommonUtility.ReadDataSetAsync(spname, parameters);

        //string procedureName = "SelectAllProcedure";
        //SqlParameter[] dataSetParameters = { };
        //DataSet dataSet = await CommonUtility.ExecuteStoredProcedureDataSetAsync(procedureName, dataSetParameters);


        public static async Task<DataSet> ExecuteStoredProcedureDataSetAsync(string procedureName, SqlParameter[] parameters)
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                using (SqlCommand cmd = new SqlCommand(procedureName, conn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    if (parameters != null)
                    {
                        cmd.Parameters.AddRange(parameters);
                    }
                    using (SqlDataAdapter adapter = new SqlDataAdapter(cmd))
                    {
                        DataSet dataSet = new DataSet();
                        await Task.Run(() => adapter.Fill(dataSet));
                        return dataSet;
                    }
                }
            }
        }

        /* ExecuteStoredProcedureReaderAsync  */
        //string procedureName = "ReaderProcedure";
        //SqlParameter[] readerParameters = {
        //new SqlParameter("@Value1", value1)
        //};
        //using (SqlDataReader reader = await CommonUtility.ExecuteStoredProcedureReaderAsync(procedureName, readerParameters))
        //{
        //    while (await reader.ReadAsync())
        //    {
        //        var columnValue = reader["Column1"];
        //    // Process data
        //}
        //}

        public static async Task<SqlDataReader> ExecuteStoredProcedureReaderAsync(string procedureName, SqlParameter[] parameters)
        {
            SqlConnection conn = new SqlConnection(connectionString);
            SqlCommand cmd = new SqlCommand(procedureName, conn)
            {
                CommandType = CommandType.StoredProcedure
            };

            if (parameters != null)
            {
                cmd.Parameters.AddRange(parameters);
            }

            await conn.OpenAsync();
            return await cmd.ExecuteReaderAsync(CommandBehavior.CloseConnection);
        }

        /* ExecuteStoredProcedureXmlReaderAsync  */
        //string procedureName = "XmlProcedure";
        //SqlParameter[] xmlParameters = { };
        //using (XmlReader xmlReader = await CommonUtility.ExecuteStoredProcedureXmlReaderAsync(procedureName, xmlParameters))
        //{
        //    while (await xmlReader.ReadAsync())
        //    {
        //        // Process XML data
        //    }
        //}

        public static async Task<XmlReader> ExecuteStoredProcedureXmlReaderAsync(string procedureName, SqlParameter[] parameters)
        {
            SqlConnection conn = new SqlConnection(connectionString);
            SqlCommand cmd = new SqlCommand(procedureName, conn)
            {
                CommandType = CommandType.StoredProcedure
            };

            if (parameters != null)
            {
                cmd.Parameters.AddRange(parameters);
            }

            await conn.OpenAsync();
            return await cmd.ExecuteXmlReaderAsync();
        }

        /* ExecuteNonQueryAsync  */
        //string insertQuery = "INSERT INTO YourTable (Column1, Column2) VALUES (@Value1, @Value2)";
        //SqlParameter[] insertParameters = {
        //    new SqlParameter("@Value1", value1),
        //    new SqlParameter("@Value2", value2)
        //};
        //int rowsInserted = await CommonUtility.ExecuteNonQueryAsync(insertQuery, insertParameters);

        //string updateQuery = "UPDATE YourTable SET Column1 = @Value1 WHERE Column2 = @Value2";
        //SqlParameter[] updateParameters = {
        //    new SqlParameter("@Value1", newValue1),
        //    new SqlParameter("@Value2", existingValue2)
        //};
        //int rowsUpdated = await CommonUtility.ExecuteNonQueryAsync(updateQuery, updateParameters);

        //string deleteQuery = "DELETE FROM YourTable WHERE Column1 = @Value1";
        //SqlParameter[] deleteParameters = {
        //    new SqlParameter("@Value1", value1)
        //};
        //int rowsDeleted = await CommonUtility.ExecuteNonQueryAsync(deleteQuery, deleteParameters);    

        public static async Task<int> ExecuteNonQueryAsync(string query, SqlParameter[] parameters)
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    if (parameters != null)
                    {
                        cmd.Parameters.AddRange(parameters);
                    }
                    await conn.OpenAsync();
                    return await cmd.ExecuteNonQueryAsync();
                }
            }
        }

        /* ExecuteScalarAsync  */
        //string scalarQuery = "SELECT COUNT(*) FROM YourTable WHERE Column1 = @Value1";
        //SqlParameter[] scalarParameters = {
        //    new SqlParameter("@Value1", value1)
        //};
        //object result = await CommonUtility.ExecuteScalarAsync(scalarQuery, scalarParameters);
        //int count = Convert.ToInt32(result);

        public static async Task<object> ExecuteScalarAsync(string query, SqlParameter[] parameters)
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    if (parameters != null)
                    {
                        cmd.Parameters.AddRange(parameters);
                    }
                    await conn.OpenAsync();
                    return await cmd.ExecuteScalarAsync();
                }
            }
        }

        /* ReadDataTableAsync  */
        //string dataTableQuery = "SELECT * FROM YourTable WHERE Column1 = @Value1";
        //SqlParameter[] dataTableParameters = {
        //    new SqlParameter("@Value1", value1)
        //};
        //DataTable dataTable = await CommonUtility.ReadDataTableAsync(dataTableQuery, dataTableParameters);

        public static async Task<DataTable> ReadDataTableAsync(string query, SqlParameter[] parameters)
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    if (parameters != null)
                    {
                        cmd.Parameters.AddRange(parameters);
                    }
                    using (SqlDataAdapter adapter = new SqlDataAdapter(cmd))
                    {
                        DataTable dataTable = new DataTable();
                        await Task.Run(() => adapter.Fill(dataTable));
                        return dataTable;
                    }
                }
            }
        }

        /* ReadDataSetAsync  */
        //string dataSetQuery = "SELECT * FROM YourTable";
        //SqlParameter[] dataSetParameters = { };
        //DataSet dataSet = await CommonUtility.ReadDataSetAsync(dataSetQuery, dataSetParameters);

        public static async Task<DataSet> ReadDataSetAsync(string query, SqlParameter[] parameters)
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    if (parameters != null)
                    {
                        cmd.Parameters.AddRange(parameters);
                    }
                    using (SqlDataAdapter adapter = new SqlDataAdapter(cmd))
                    {
                        DataSet dataSet = new DataSet();
                        await Task.Run(() => adapter.Fill(dataSet));
                        return dataSet;
                    }
                }
            }
        }

        public static async Task<int> ExecuteNonQueryWithTransactionAsync(List<string> queries, List<SqlParameter[]> parametersList)
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                await conn.OpenAsync();
                using (SqlTransaction transaction = conn.BeginTransaction())
                {
                    using (SqlCommand cmd = new SqlCommand())
                    {
                        cmd.Connection = conn;
                        cmd.Transaction = transaction;
                        try
                        {
                            int affectedRows = 0;
                            for (int i = 0; i < queries.Count; i++)
                            {
                                cmd.CommandText = queries[i];
                                if (parametersList[i] != null)
                                {
                                    cmd.Parameters.Clear();
                                    cmd.Parameters.AddRange(parametersList[i]);
                                }
                                affectedRows += await cmd.ExecuteNonQueryAsync();
                            }
                            transaction.Commit();
                            return affectedRows;
                        }
                        catch
                        {
                            transaction.Rollback();
                            throw;
                        }
                    }
                }
            }
        }

        public static async Task<DataTable> ExecuteDataTableWithTransactionAsync(string query, SqlParameter[] parameters)
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                await conn.OpenAsync();
                using (SqlTransaction transaction = conn.BeginTransaction())
                {
                    using (SqlCommand cmd = new SqlCommand(query, conn))
                    {
                        cmd.Transaction = transaction;
                        if (parameters != null)
                        {
                            cmd.Parameters.AddRange(parameters);
                        }
                        using (SqlDataAdapter adapter = new SqlDataAdapter(cmd))
                        {
                            DataTable dataTable = new DataTable();
                            await Task.Run(() => adapter.Fill(dataTable));
                            transaction.Commit();
                            return dataTable;
                        }
                    }
                }
            }
        }

        private static SqlParameter[] GetSqlParameters(Dictionary<string, object> parameters)
        {
            var sqlParameters = new List<SqlParameter>();
            foreach (var param in parameters)
            {
                sqlParameters.Add(new SqlParameter(param.Key, param.Value));
            }
            return sqlParameters.ToArray();
        }

        /* ExecuteStoredProcedureNonQueryAsync  */
        //string procedureName = "InsertProcedure";
        //Dictionary<string, object> insertParameters = new Dictionary<string, object>
        //{
        //    {"@Value1", value1},
        //    {"@Value2", value2}
        //};
        //int rowsInserted = await CommonUtility.ExecuteStoredProcedureNonQueryAsync(procedureName, insertParameters);

        public static async Task<int> ExecuteStoredProcedureNonQueryAsync(string procedureName, Dictionary<string, object> parameters)
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                using (SqlCommand cmd = new SqlCommand(procedureName, conn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    if (parameters != null)
                    {
                        cmd.Parameters.AddRange(GetSqlParameters(parameters));
                    }
                    await conn.OpenAsync();
                    return await cmd.ExecuteNonQueryAsync();
                }
            }
        }

        /* ExecuteStoredProcedureScalarAsync  */
        //string procedureName = "ScalarProcedure";
        //Dictionary<string, object> scalarParameters = new Dictionary<string, object>
        //{
        //    {"@Value1", value1}
        //};
        //object result = await CommonUtility.ExecuteStoredProcedureScalarAsync(procedureName, scalarParameters);
        //int count = Convert.ToInt32(result);

        public static async Task<object> ExecuteStoredProcedureScalarAsync(string procedureName, Dictionary<string, object> parameters)
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                using (SqlCommand cmd = new SqlCommand(procedureName, conn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    if (parameters != null)
                    {
                        cmd.Parameters.AddRange(GetSqlParameters(parameters));
                    }
                    await conn.OpenAsync();
                    return await cmd.ExecuteScalarAsync();
                }
            }
        }

        /* ExecuteStoredProcedureDataTableAsync  */
        //string procedureName = "SelectProcedure";
        //Dictionary<string, object> dataTableParameters = new Dictionary<string, object>
        //{
        //    {"@Value1", value1}
        //};
        //DataTable dataTable = await CommonUtility.ExecuteStoredProcedureDataTableAsync(procedureName, dataTableParameters);

        public static async Task<DataTable> ExecuteStoredProcedureDataTableAsync(string procedureName, Dictionary<string, object> parameters)
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                using (SqlCommand cmd = new SqlCommand(procedureName, conn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    if (parameters != null)
                    {
                        cmd.Parameters.AddRange(GetSqlParameters(parameters));
                    }
                    using (SqlDataAdapter adapter = new SqlDataAdapter(cmd))
                    {
                        DataTable dataTable = new DataTable();
                        await Task.Run(() => adapter.Fill(dataTable));
                        return dataTable;
                    }
                }
            }
        }

        /* ExecuteStoredProcedureDataSetAsync  */
        //string procedureName = "SelectAllProcedure";
        //Dictionary<string, object> dataSetParameters = new Dictionary<string, object>
        //{
        //     {"@Value1", value1}
        //    // Add parameters if needed
        //};
        //DataSet dataSet = await CommonUtility.ExecuteStoredProcedureDataSetAsync(procedureName, dataSetParameters);

        public static async Task<DataSet> ExecuteStoredProcedureDataSetAsync(string procedureName, Dictionary<string, object> parameters)
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                using (SqlCommand cmd = new SqlCommand(procedureName, conn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    if (parameters != null)
                    {
                        cmd.Parameters.AddRange(GetSqlParameters(parameters));
                    }
                    using (SqlDataAdapter adapter = new SqlDataAdapter(cmd))
                    {
                        DataSet dataSet = new DataSet();
                        await Task.Run(() => adapter.Fill(dataSet));
                        return dataSet;
                    }
                }
            }
        }

        /* ExecuteStoredProcedureReaderAsync  */
        //string procedureName = "ReaderProcedure";
        //Dictionary<string, object> readerParameters = new Dictionary<string, object>
        //{
        //    {"@Value1", value1}
        //};
        //using (SqlDataReader reader = await CommonUtility.ExecuteStoredProcedureReaderAsync(procedureName, readerParameters))
        //{
        //    while (await reader.ReadAsync())
        //    {
        //        var columnValue = reader["Column1"];
        //    // Process data
        //}
        //}

        public static async Task<SqlDataReader> ExecuteStoredProcedureReaderAsync(string procedureName, Dictionary<string, object> parameters)
        {
            SqlConnection conn = new SqlConnection(connectionString);
            SqlCommand cmd = new SqlCommand(procedureName, conn)
            {
                CommandType = CommandType.StoredProcedure
            };

            if (parameters != null)
            {
                cmd.Parameters.AddRange(GetSqlParameters(parameters));
            }

            await conn.OpenAsync();
            return await cmd.ExecuteReaderAsync(CommandBehavior.CloseConnection);
        }

        /* ExecuteStoredProcedureXmlReaderAsync  */
        //string procedureName = "XmlProcedure";
        //Dictionary<string, object> xmlParameters = new Dictionary<string, object>
        //{
        //    // Add parameters if needed
        //};
        //using (XmlReader xmlReader = await CommonUtility.ExecuteStoredProcedureXmlReaderAsync(procedureName, xmlParameters))
        //{
        //    while (await xmlReader.ReadAsync())
        //    {
        //        // Process XML data
        //    }
        //}

        public static async Task<XmlReader> ExecuteStoredProcedureXmlReaderAsync(string procedureName, Dictionary<string, object> parameters)
        {
            SqlConnection conn = new SqlConnection(connectionString);
            SqlCommand cmd = new SqlCommand(procedureName, conn)
            {
                CommandType = CommandType.StoredProcedure
            };

            if (parameters != null)
            {
                cmd.Parameters.AddRange(GetSqlParameters(parameters));
            }

            await conn.OpenAsync();
            return await cmd.ExecuteXmlReaderAsync();
        }

        /* ExecuteStoredProcedureXmlReaderAsync  */
        //DataTable insertTable = new DataTable();
        //insertTable.Columns.Add("Column1", typeof(string));
        //insertTable.Columns.Add("Column2", typeof(int));

        //insertTable.Rows.Add("Value1", 1);
        //insertTable.Rows.Add("Value2", 2);
        //// Add more rows as needed

        //await CommonUtility.BulkInsertAsync(insertTable, "YourDestinationTable");

        public static async Task BulkInsertAsync(DataTable dataTable, string destinationTableName)
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                await conn.OpenAsync();
                using (SqlBulkCopy bulkCopy = new SqlBulkCopy(conn))
                {
                    bulkCopy.DestinationTableName = destinationTableName;
                    await bulkCopy.WriteToServerAsync(dataTable);
                }
            }
        }

        /* BulkUpdateAsync  */
        //DataTable updateTable = new DataTable();
        //updateTable.Columns.Add("Column1", typeof(string));
        //updateTable.Columns.Add("Column2", typeof(int));

        //updateTable.Rows.Add("NewValue1", 1);
        //updateTable.Rows.Add("NewValue2", 2);
        //// Add more rows as needed

        //await CommonUtility.BulkUpdateAsync(updateTable, "UpdateProcedure");
        //CREATE PROCEDURE UpdateProcedure
        //@Column1 NVARCHAR(50),
        //@Column2 INT
        //AS
        //BEGIN
        //    UPDATE YourTable
        //    SET Column1 = @Column1
        //    WHERE Column2 = @Column2
        //END


        public static async Task BulkUpdateAsync(DataTable dataTable, string procedureName)
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                await conn.OpenAsync();
                foreach (DataRow row in dataTable.Rows)
                {
                    using (SqlCommand cmd = new SqlCommand(procedureName, conn))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        foreach (DataColumn column in dataTable.Columns)
                        {
                            cmd.Parameters.AddWithValue("@" + column.ColumnName, row[column]);
                        }
                        await cmd.ExecuteNonQueryAsync();
                    }
                }
            }
        }

        /* BulkDeleteAsync  */
        //DataTable deleteTable = new DataTable();
        //deleteTable.Columns.Add("Column1", typeof(string));

        //deleteTable.Rows.Add("Value1");
        //deleteTable.Rows.Add("Value2");
        //// Add more rows as needed

        //await CommonUtility.BulkDeleteAsync(deleteTable, "DeleteProcedure");

        //CREATE PROCEDURE DeleteProcedure
        //@Column1 NVARCHAR(50)
        //AS
        //BEGIN
        //    DELETE FROM YourTable
        //    WHERE Column1 = @Column1
        //END

        public static async Task BulkDeleteAsync(DataTable dataTable, string procedureName)
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                await conn.OpenAsync();
                foreach (DataRow row in dataTable.Rows)
                {
                    using (SqlCommand cmd = new SqlCommand(procedureName, conn))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        foreach (DataColumn column in dataTable.Columns)
                        {
                            cmd.Parameters.AddWithValue("@" + column.ColumnName, row[column]);
                        }
                        await cmd.ExecuteNonQueryAsync();
                    }
                }
            }
        }

        //public static async Task ExportToExcelAsync(DataTable dataTable, string excelFilePath)
        //{
        //    using (ExcelPackage excelPackage = new ExcelPackage())
        //    {
        //        // Set some document properties
        //        excelPackage.Workbook.Properties.Author = "Your Name";
        //        excelPackage.Workbook.Properties.Title = "Data Export";

        //        // Create a sheet
        //        ExcelWorksheet worksheet = excelPackage.Workbook.Worksheets.Add("Sheet1");

        //        // Load the datatable into the sheet, starting from cell A1
        //        worksheet.Cells["A1"].LoadFromDataTable(dataTable, true);

        //        // Save the excel file
        //        FileInfo fi = new FileInfo(excelFilePath);
        //        await excelPackage.SaveAsAsync(fi);
        //    }
        //}

        //public static void commonStringFunction()
        //{
        //    //string.Length

        //    //Returns the number of characters in the string.

        //    string str = "Hello, World!";
        //    int length = str.Length; // Output: 13

        //    //string.ToUpper()

        //    //Converts the string to uppercase.

        //    string str = "Hello, World!";
        //    string upperStr = str.ToUpper(); // Output: "HELLO, WORLD!"

        //    //string.ToLower()

        //    //Converts the string to lowercase.

        //    string str = "Hello, World!";
        //    string lowerStr = str.ToLower(); // Output: "hello, world!"

        //    //string.Trim()

        //    //Removes all leading and trailing white-space characters from the string.

        //    string str = "  Hello, World!  ";
        //    string trimmedStr = str.Trim(); // Output: "Hello, World!"

        //    string str = "  Hello, World!  ";
        //    string trimmedStr = str.Trim(); // Output: "Hello, World!"

        //    //string.TrimStart() and string.TrimEnd()

        //    //Removes all leading(or trailing) white - space characters from the string.

        //    string str = "  Hello, World!  ";
        //    string trimmedStart = str.TrimStart(); // Output: "Hello, World!  "
        //    string trimmedEnd = str.TrimEnd(); // Output: "  Hello, World!"

        //    //string.Substring(int startIndex, int length)

        //    //Retrieves a substring from the string starting at the specified index and having the specified length.

        //    string str = "Hello, World!";
        //    string subStr = str.Substring(7, 5); // Output: "World"

        //    //string.Replace(string oldValue, string newValue)

        //    //Replaces all occurrences of a specified string with another specified string.

        //    string str = "Hello, World!";
        //    string replacedStr = str.Replace("World", "C#"); // Output: "Hello, C#!"

        //    //string.Contains(string value)

        //    //Returns a value indicating whether a specified string occurs within this string.

        //    string str = "Hello, World!";
        //    bool contains = str.Contains("World"); // Output: true

        //    //string.IndexOf(string value)

        //    //Reports the zero - based index of the first occurrence of a specified string within this string.

        //    string str = "Hello, World!";
        //    int index = str.IndexOf("World"); // Output: 7

        //    //string.LastIndexOf(string value)

        //    //Reports the zero - based index of the last occurrence of a specified string within this string.

        //    string str = "Hello, World! Hello, Universe!";
        //    int lastIndex = str.LastIndexOf("Hello"); // Output: 14

        //    //string.Split(char[] separator)

        //    //Splits a string into an array of strings based on the specified separator characters.

        //    string str = "Hello, World! Hello, Universe!";
        //    string[] words = str.Split(new char[] { ' ', '!', ',' });


        //    //string.Join(string separator, IEnumerable<string> values)

        //    //Concatenates the elements of a specified array or collection, using the specified separator between each element.

        //    string[] words = { "Hello", "World", "Universe" };
        //    string joinedStr = string.Join(", ", words); // Output: "Hello, World, Universe"

        //    //string.StartsWith(string value) and string.EndsWith(string value)

        //    //Determines whether the beginning(or end) of the string instance matches the specified string.

        //    string str = "Hello, World!";
        //    bool startsWith = str.StartsWith("Hello"); // Output: true
        //    bool endsWith = str.EndsWith("World!"); // Output: true

        //    //string.IsNullOrEmpty(string value) and string.IsNullOrWhiteSpace(string value)

        //    //Indicates whether a specified string is null or an empty string, or consists only of white-space characters.

        //    string str = "";
        //    bool isNullOrEmpty = string.IsNullOrEmpty(str); // Output: true
        //    bool isNullOrWhiteSpace = string.IsNullOrWhiteSpace(str); // Output: true

        //    //advance fun

        //    //string.Insert(int startIndex, string value)

        //    //Inserts a specified string at a specified index position in the string.

        //    //csharp
        //    string str = "Hello, World!";
        //    string insertedStr = str.Insert(7, "beautiful "); // Output: "Hello, beautiful World!"

        //    //16. string.Remove(int startIndex, int count)

        //    //Deletes a specified number of characters from the string, starting at a specified index.

        //    //csharp
        //    string str = "Hello, World!";
        //    string removedStr = str.Remove(5, 7); // Output: "Hello!"

        //    //17. string.PadLeft(int totalWidth, char paddingChar) and string.PadRight(int totalWidth, char paddingChar)

        //    //Pads the string on the left(or right) with a specified character to a specified total length.

        //    //csharp
        //    string str = "Hello";
        //    string paddedLeftStr = str.PadLeft(10, '*'); // Output: "*****Hello"
        //    string paddedRightStr = str.PadRight(10, '*'); // Output: "Hello*****"


        //    //18. string.Format(string format, params object[] args)

        //    //Replaces one or more format items in a specified string with the string representation of a specified object.

        //    //csharp
        //    string formattedStr = string.Format("Name: {0}, Age: {1}", "John", 30); // Output: "Name: John, Age: 30"

        //    //19. string.Compare(string strA, string strB, bool ignoreCase)

        //    //Compares two specified string objects, optionally ignoring case.

        //    //csharp
        //    string strA = "hello";
        //    string strB = "HELLO";
        //    int comparisonResult = string.Compare(strA, strB, true); // Output: 0 (means they are equal when case is ignored)

        //    //20. string.Concat(params string[] values)

        //    //Concatenates one or more instances of String, or the String representations of the values of one or more instances of Object.

        //    //csharp
        //    string[] words = { "Hello", "World", "!" };
        //    string concatenatedStr = string.Concat(words); // Output: "HelloWorld!"

        //    //21. string.ToCharArray()

        //    //Copies the characters in this string to a Unicode character array.

        //    //csharp
        //    string str = "Hello";
        //    char[] charArray = str.ToCharArray(); // Output: ['H', 'e', 'l', 'l', 'o']

        //    //22. string.Normalize(NormalizationForm form)

        //    //Returns a new string whose textual value is the same as this string, but whose binary representation is in a particular Unicode normalization form.

        //    //csharp
        //    string str = "e\u0301"; // "é" as "e" + combining acute accent
        //    string normalizedStr = str.Normalize(NormalizationForm.FormC); // Output: "é" in NFC form

        //    //23. string.CopyTo(int sourceIndex, char[] destination, int destinationIndex, int count)

        //    //Copies a specified number of characters from a specified position in this instance to a specified position in an array of Unicode characters.

        //    //csharp
        //    string str = "Hello, World!";
        //    char[] charArray = new char[5];
        //    str.CopyTo(7, charArray, 0, 5); // charArray: ['W', 'o', 'r', 'l', 'd']

        //    //24. string.Intersect(IEnumerable<string> first, IEnumerable<string> second)

        //    //Produces the set intersection of two sequences by using the default equality comparer to compare values.

        //    //csharp
        //    List<string> first = new List<string> { "apple", "banana", "cherry" };
        //    List<string> second = new List<string> { "banana", "cherry", "date" };
        //    IEnumerable<string> intersected = first.Intersect(second); // Output: ["banana", "cherry"]

        //    //25. string.Join<T>(string separator, IEnumerable < T > values)

        //    //Concatenates the members of a collection, using the specified separator between each member.

        //    //csharp
        //    List<int> numbers = new List<int> { 1, 2, 3, 4, 5 };
        //    string joinedNumbers = string.Join(", ", numbers); // Output: "1, 2, 3, 4, 5"             
        //}

        // Encrypt a string using AES



        //string key = "0123456789abcdef"; // 16 bytes key for AES-128
        //string iv = "abcdef0123456789"; // 16 bytes IV for AES-128
        //string plainText = "Hello, World!";

        //string encryptedText = EncryptionUtility.Encrypt(plainText, key, iv);
        //Console.WriteLine($"Encrypted Text: {encryptedText}");

        public static string Encrypt(string plainText, string key, string iv)
        {
            using (Aes aesAlg = Aes.Create())
            {
                aesAlg.Key = Encoding.UTF8.GetBytes(key);
                aesAlg.IV = Encoding.UTF8.GetBytes(iv);

                ICryptoTransform encryptor = aesAlg.CreateEncryptor(aesAlg.Key, aesAlg.IV);

                using (MemoryStream msEncrypt = new MemoryStream())
                {
                    using (CryptoStream csEncrypt = new CryptoStream(msEncrypt, encryptor, CryptoStreamMode.Write))
                    {
                        using (StreamWriter swEncrypt = new StreamWriter(csEncrypt))
                        {
                            swEncrypt.Write(plainText);
                        }
                        return Convert.ToBase64String(msEncrypt.ToArray());
                    }
                }
            }
        }


        //string key = "0123456789abcdef"; // 16 bytes key for AES-128
        //string iv = "abcdef0123456789"; // 16 bytes IV for AES-128
        //string encryptedText = "Your Encrypted Text Here";

        //string decryptedText = EncryptionUtility.Decrypt(encryptedText, key, iv);
        //Console.WriteLine($"Decrypted Text: {decryptedText}");

        // Decrypt a string using AES
        public static string Decrypt(string cipherText, string key, string iv)
        {
            using (Aes aesAlg = Aes.Create())
            {
                aesAlg.Key = Encoding.UTF8.GetBytes(key);
                aesAlg.IV = Encoding.UTF8.GetBytes(iv);

                ICryptoTransform decryptor = aesAlg.CreateDecryptor(aesAlg.Key, aesAlg.IV);

                using (MemoryStream msDecrypt = new MemoryStream(Convert.FromBase64String(cipherText)))
                {
                    using (CryptoStream csDecrypt = new CryptoStream(msDecrypt, decryptor, CryptoStreamMode.Read))
                    {
                        using (StreamReader srDecrypt = new StreamReader(csDecrypt))
                        {
                            return srDecrypt.ReadToEnd();
                        }
                    }
                }
            }
        }


        //string plainTextPassword = "mySecurePassword";
        //string encodedPassword = Base64EncodingUtility.Encode(plainTextPassword);
        //Console.WriteLine($"Encoded Password: {encodedPassword}");

        // Encode a password using Base64
        public static string Encode(string plainText)
        {
            byte[] plainTextBytes = Encoding.UTF8.GetBytes(plainText);
            return Convert.ToBase64String(plainTextBytes);
        }

        //string encodedPassword = "bXlTZWN1cmVQYXNzd29yZA=="; // Example Base64 encoded string
        //string decodedPassword = Base64EncodingUtility.Decode(encodedPassword);
        //Console.WriteLine($"Decoded Password: {decodedPassword}");

        // Decode a password using Base64
        public static string Decode(string base64EncodedData)
        {
            byte[] base64EncodedBytes = Convert.FromBase64String(base64EncodedData);
            return Encoding.UTF8.GetString(base64EncodedBytes);
        }




    }
}