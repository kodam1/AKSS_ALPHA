using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.IO;
using System.Security.Cryptography;
using System.Text;
using System.Text.RegularExpressions;
using System.Net.Mail;
//using System.Net.Http;
using System.Threading.Tasks;
using System.Data;
using System.Globalization;
//using System.Text.Json;
using System.Net.Sockets;


namespace AKSS_Management
{
    public class CommonLogicHelper
    {

        public string GenerateRandomString(int length)
        {
            const string chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
            var random = new Random();
            var result = new char[length];
            for (int i = 0; i < length; i++)
            {
                result[i] = chars[random.Next(chars.Length)];
            }
            return new string(result);
        }

        /// <summary>
        /// Hashes a string using SHA256.
        /// </summary>
        public string HashString(string input)
        {
            using (var sha256 = SHA256.Create())
            {
                byte[] bytes = sha256.ComputeHash(Encoding.UTF8.GetBytes(input));
                var builder = new StringBuilder();
                foreach (var b in bytes)
                {
                    builder.Append(b.ToString("x2"));
                }
                return builder.ToString();
            }
        }

        /// <summary>
        /// Validates an email address format.
        /// </summary>
        public bool ValidateEmail(string email)
        {
            try
            {
                var addr = new MailAddress(email);
                return addr.Address == email;
            }
            catch
            {
                return false;
            }
        }

        /// <summary>
        /// Writes a log message to a specified log file.
        /// </summary>
        public void WriteLog(string message, string logFilePath)
        {
            using (StreamWriter writer = new StreamWriter(logFilePath, true))
            {
                writer.WriteLine($"[{DateTime.Now}] {message}");
            }
        }

        /// <summary>
        /// Reads all lines from a specified file.
        /// </summary>
        public string[] ReadFile(string filePath)
        {
            return File.ReadAllLines(filePath);
        }

        /// <summary>
        /// Encodes a string for use in a URL.
        /// </summary>
        public string UrlEncode(string value)
        {
            return HttpUtility.UrlEncode(value);
        }

        /// <summary>
        /// Decodes a URL-encoded string.
        /// </summary>
        public string UrlDecode(string value)
        {
            return HttpUtility.UrlDecode(value);
        }

        /// <summary>
        /// Escapes HTML characters in a string.
        /// </summary>
        public string HtmlEncode(string value)
        {
            return HttpUtility.HtmlEncode(value);
        }

        /// <summary>
        /// Decodes HTML-encoded characters in a string.
        /// </summary>
        public string HtmlDecode(string value)
        {
            return HttpUtility.HtmlDecode(value);
        }

        /// <summary>
        /// Converts a plain text string to Base64 format.
        /// </summary>
        public string ToBase64(string plainText)
        {
            var bytes = Encoding.UTF8.GetBytes(plainText);
            return Convert.ToBase64String(bytes);
        }

        /// <summary>
        /// Decodes a Base64 string to plain text.
        /// </summary>
        public string FromBase64(string base64Text)
        {
            var bytes = Convert.FromBase64String(base64Text);
            return Encoding.UTF8.GetString(bytes);
        }

        /// <summary>
        /// Removes all non-alphanumeric characters from a string.
        /// </summary>
        public string RemoveSpecialCharacters(string input)
        {
            return Regex.Replace(input, "[^a-zA-Z0-9]", "");
        }

        /// <summary>
        /// Calculates the difference in days between two dates.
        /// </summary>
        public int CalculateDaysDifference(DateTime startDate, DateTime endDate)
        {
            return (endDate - startDate).Days;
        }

        /// <summary>
        /// Sends an email using SMTP.
        /// </summary>
        public void SendEmail(string smtpServer, int port, string fromEmail, string toEmail, string subject, string body, string username, string password)
        {
            using (var client = new SmtpClient(smtpServer, port))
            {
                client.Credentials = new System.Net.NetworkCredential(username, password);
                client.EnableSsl = true;

                var mailMessage = new MailMessage(fromEmail, toEmail, subject, body);
                client.Send(mailMessage);
            }
        }

        /// <summary>
        /// Sends an SMS using an external API.
        /// </summary>
        //public async Task<bool> SendSmsAsync(string apiUrl, string apiKey, string toPhoneNumber, string message)
        //{
        //    using (var client = new HttpClient())
        //    {
        //        var requestContent = new FormUrlEncodedContent(new Dictionary<string, string>
        //    {
        //        { "apikey", apiKey },
        //        { "to", toPhoneNumber },
        //        { "message", message }
        //    });

        //        HttpResponseMessage response = await client.PostAsync(apiUrl, requestContent);
        //        return response.IsSuccessStatusCode;
        //    }
        //}

        /// <summary>
        /// Checks if a given string is a valid date.
        /// </summary>
        public bool IsValidDate(string input)
        {
            return DateTime.TryParse(input, out _);
        }

        /// <summary>
        /// Generates a GUID string.
        /// </summary>
        public string GenerateGuid()
        {
            return Guid.NewGuid().ToString();
        }

        /// <summary>
        /// Converts a DataTable to a CSV string.
        /// </summary>
        public string DataTableToCsv(DataTable dataTable)
        {
            var csvBuilder = new StringBuilder();
            foreach (DataColumn column in dataTable.Columns)
            {
                csvBuilder.Append(column.ColumnName + ",");
            }
            csvBuilder.AppendLine();

            foreach (DataRow row in dataTable.Rows)
            {
                foreach (var item in row.ItemArray)
                {
                    csvBuilder.Append(item.ToString() + ",");
                }
                csvBuilder.AppendLine();
            }
            return csvBuilder.ToString();
        }

        /// <summary>
        /// Parses a CSV string into a DataTable.
        /// </summary>
        public DataTable CsvToDataTable(string csvContent)
        {
            var dataTable = new DataTable();
            var rows = csvContent.Split(new[] { '\n' }, StringSplitOptions.RemoveEmptyEntries);
            var headers = rows[0].Split(',');

            foreach (var header in headers)
            {
                dataTable.Columns.Add(header);
            }

            for (int i = 1; i < rows.Length; i++)
            {
                var values = rows[i].Split(',');
                dataTable.Rows.Add(values);
            }

            return dataTable;
        }

        /// <summary>
        /// Converts a string to Title Case.
        /// </summary>
        public string ToTitleCase(string input)
        {
            var textInfo = CultureInfo.CurrentCulture.TextInfo;
            return textInfo.ToTitleCase(input.ToLower());
        }

        /// <summary>
        /// Removes duplicate characters from a string.
        /// </summary>
        public string RemoveDuplicateCharacters(string input)
        {
            return new string(input.ToCharArray().Distinct().ToArray());
        }

        /// <summary>
        /// Retrieves the file extension from a file path.
        /// </summary>
        public string GetFileExtension(string filePath)
        {
            return Path.GetExtension(filePath);
        }

        /// <summary>
        /// Reads a JSON file and deserializes it into an object of type T.
        /// </summary>
        //public T ReadJsonFile<T>(string filePath)
        //{
        //    var jsonContent = File.ReadAllText(filePath);
        //    return System.Text.Json.JsonSerializer.Deserialize<T>(jsonContent);
        //}

        /// <summary>
        /// Writes an object to a file as JSON.
        /// </summary>
        //public void WriteJsonFile<T>(string filePath, T obj)
        //{
        //    var jsonContent = System.Text.Json.JsonSerializer.Serialize
    }


}