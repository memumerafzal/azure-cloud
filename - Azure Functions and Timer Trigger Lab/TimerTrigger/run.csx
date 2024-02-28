using System;
using System.Net.Http;

public static void Run(TimerInfo myTimer, ILogger log)
{
    log.LogInformation($"PAPM Legacy AutoLoadERAFiles function executed at: {DateTime.Now}");
    string apiUrl = "https://edi.pptomations.com/Home/ParseERAFiles_From_Ftp";
    using (HttpClient client = new HttpClient())
        {
            try
                {// Send a POST request to the URL with an empty request body
                    HttpResponseMessage response = client.PostAsync(apiUrl, null).Result;

                    // Check if the response is successful (status code 200 OK)
                    if (response.IsSuccessStatusCode)
                    {
                        string responseContent = response.Content.ReadAsStringAsync().Result;
                        log.LogInformation("Response: " + responseContent);
                    }
                    else
                    {
                        log.LogInformation("HTTP Request Failed with status code: " + response.StatusCode);
                    }
                }
            catch (Exception ex)
            {
                log.LogInformation("An error occurred: " + ex.Message);
            }
        }
}
