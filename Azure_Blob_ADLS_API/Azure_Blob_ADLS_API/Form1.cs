using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Net;
using System.IO;
using System.Security.Cryptography;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Net;
using System.Web;
using System.Net.Http.Headers;
using System.Collections.Specialized;
using System.Net.Http;
using System.Globalization;
using System.Web.ModelBinding;

namespace Azure_Blob_ADLS_API
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void Form1_Load(object sender, EventArgs e)
        {

        }

        private void btnSelectFile_Click(object sender, EventArgs e)
        {
            ofdLoadFile.ShowDialog();
            txtFilePath.Text = ofdLoadFile.FileName;
        }

        async private void BtnBlockBlobPut_Click(object sender, EventArgs e)
        {

            // using REST API documented here:
            // https://docs.microsoft.com/en-us/rest/api/storageservices/put-blob

            // get file contents
            string fileContent = File.ReadAllText(txtFilePath.Text);

            // strip off file (blob) name
            string blobName = txtFilePath.Text.Substring(txtFilePath.Text.LastIndexOf("\\") +  1);

            // build Uri
            string requestUri = String.Format(@"https://{0}.blob.core.windows.net/{1}/{2}", txtStorageAccountName.Text, txtStorageAccountContainer.Text, blobName);

            // create request and set body content
            HttpRequestMessage request = new HttpRequestMessage(HttpMethod.Put, requestUri);
            request.Content = new ByteArrayContent(Encoding.UTF8.GetBytes(fileContent));

            DateTime now = DateTime.UtcNow;

            // set headers
            request.Headers.Add("x-ms-blob-type", "BlockBlob");
            request.Headers.Add("x-ms-date", now.ToString("R", CultureInfo.InvariantCulture));
            request.Headers.Add("x-ms-version", "2017-07-29");
            request.Headers.Authorization = GetAuthorizationHeader(txtStorageAccountName.Text, txtStorageKey.Text, DateTime.UtcNow, request);

            try
            {
                using (HttpResponseMessage response = await new HttpClient().SendAsync(request))
                {
                    MessageBox.Show(String.Format(@"{0} : {1}", response.StatusCode.ToString(), response.ReasonPhrase.ToString()));
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message.ToString());
            }
        }

        internal static AuthenticationHeaderValue GetAuthorizationHeader(
            string storageAccountName, string storageAccountKey, DateTime now,
            HttpRequestMessage httpRequestMessage, string ifMatch = "", string md5 = "")
        {

            // From: https://docs.microsoft.com/en-us/azure/storage/common/storage-rest-api-auth

            // This is the raw representation of the message signature.
            HttpMethod method = httpRequestMessage.Method;
            String MessageSignature = String.Format("{0}\n\n\n{1}\n{5}\n\n\n\n{2}\n\n\n\n{3}{4}",
                        method.ToString(),
                        (method == HttpMethod.Get || method == HttpMethod.Head) ? String.Empty
                          : httpRequestMessage.Content.Headers.ContentLength.ToString(),
                        ifMatch,
                        GetCanonicalizedHeaders(httpRequestMessage),
                        GetCanonicalizedResource(httpRequestMessage.RequestUri, storageAccountName),
                        md5);

            // Now turn it into a byte array.
            byte[] SignatureBytes = Encoding.UTF8.GetBytes(MessageSignature);

            // Create the HMACSHA256 version of the storage key.
            HMACSHA256 SHA256 = new HMACSHA256(Convert.FromBase64String(storageAccountKey));

            // Compute the hash of the SignatureBytes and convert it to a base64 string.
            string signature = Convert.ToBase64String(SHA256.ComputeHash(SignatureBytes));

            // This is the actual header that will be added to the list of request headers.
            AuthenticationHeaderValue authHV = new AuthenticationHeaderValue("SharedKey",
                storageAccountName + ":" + Convert.ToBase64String(SHA256.ComputeHash(SignatureBytes)));
            return authHV;
        }

        private static string GetCanonicalizedHeaders(HttpRequestMessage httpRequestMessage)
        {

            // From:  https://docs.microsoft.com/en-us/azure/storage/common/storage-rest-api-auth

            var headers = from kvp in httpRequestMessage.Headers
                          where kvp.Key.StartsWith("x-ms-", StringComparison.OrdinalIgnoreCase)
                          orderby kvp.Key
                          select new { Key = kvp.Key.ToLowerInvariant(), kvp.Value };

            StringBuilder headersBuilder = new StringBuilder();

            // Create the string in the right format; this is what makes the headers "canonicalized" --
            //   it means put in a standard format. https://en.wikipedia.org/wiki/Canonicalization
            foreach (var kvp in headers)
            {
                headersBuilder.Append(kvp.Key);
                char separator = ':';

                // Get the value for each header, strip out \r\n if found, then append it with the key.
                foreach (string headerValue in kvp.Value)
                {
                    string trimmedValue = headerValue.TrimStart().Replace("\r\n", string.Empty);
                    headersBuilder.Append(separator).Append(trimmedValue);

                    // Set this to a comma; this will only be used
                    // if there are multiple values for one of the headers.
                    separator = ',';
                }

                headersBuilder.Append("\n");
            }

            return headersBuilder.ToString();
        }

        private static string GetCanonicalizedResource(Uri address, string storageAccountName)
        {

            // From: https://docs.microsoft.com/en-us/azure/storage/common/storage-rest-api-auth

            // The absolute path will be "/" because for we're getting a list of containers.
            StringBuilder sb = new StringBuilder("/").Append(storageAccountName).Append(address.AbsolutePath);

            // Address.Query is the resource, such as "?comp=list".
            // This ends up with a NameValueCollection with 1 entry having key=comp, value=list.
            // It will have more entries if you have more query parameters.
            NameValueCollection values = HttpUtility.ParseQueryString(address.Query);

            foreach (var item in values.AllKeys.OrderBy(k => k))
            {
                sb.Append('\n').Append(item.ToLower()).Append(':').Append(values[item]);
            }

            return sb.ToString();
        }

        async private void BtnReadADLSFile_Click(object sender, EventArgs e)
        {
            // using REST API documented here:
            // https://docs.microsoft.com/en-us/rest/api/storageservices/datalakestoragegen2/path/read

            // build Uri
            string requestUri = String.Format(@"https://{0}.dfs.core.windows.net/{1}/{2}", txtStorageAccountName.Text, txtStorageAccountContainer.Text, txtADLSPath.Text);

            // create request and set body content
            HttpRequestMessage request = new HttpRequestMessage(HttpMethod.Get, requestUri);

            DateTime now = DateTime.UtcNow;

            // set headers
            request.Headers.Add("x-ms-date", now.ToString("R", CultureInfo.InvariantCulture));
            request.Headers.Add("x-ms-version", "2018-11-09");
            request.Headers.Authorization = GetAuthorizationHeader(txtStorageAccountName.Text, txtStorageKey.Text, DateTime.UtcNow, request);

            try
            {
                using (HttpResponseMessage response = await new HttpClient().SendAsync(request))
                {
                    // just showing status
                    MessageBox.Show(String.Format(@"{0} : {1}", response.StatusCode.ToString(), response.ReasonPhrase.ToString()));

                    // get reference to stream 
                    var sr = (StreamContent)response.Content;

                    // get data as string for demo (small amount of data for demo)
                    string s = await sr.ReadAsStringAsync();

                    // get file name and write
                    sfdFileName.Filter = "Text (.txt) | .txt";
                    sfdFileName.ShowDialog();

                    File.WriteAllText(sfdFileName.FileName, s);
                    MessageBox.Show(String.Format("File saved to '{0}'", sfdFileName.FileName));

                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message.ToString());
            }
        }

        private void TxtFilePath_TextChanged(object sender, EventArgs e)
        {
            if (txtFilePath.Text.Length > 0)
            {
                txtADLSPath.Enabled = false;
                btnReadADLSFile.Enabled = false;
                btnBlockBlobPut.Enabled = true;
            }
            else
            {
                txtADLSPath.Enabled = true;
                btnBlockBlobPut.Enabled = true;
                btnReadADLSFile.Enabled = false;
            }
        }

        private void TxtADLSPath_TextChanged(object sender, EventArgs e)
        {
            if (txtADLSPath.Text.Length > 0)
            {
                txtFilePath.Enabled = false;
                btnBlockBlobPut.Enabled = false;
                btnReadADLSFile.Enabled = true;
            }
            else
            {
                txtFilePath.Enabled = true;
                btnReadADLSFile.Enabled = true;
                btnBlockBlobPut.Enabled = false;
            }
        }
    }
}
