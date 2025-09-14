using System.Collections.Generic;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Azure.WebJobs;
using Microsoft.Azure.WebJobs.Extensions.Http;
using Microsoft.AspNetCore.Http;
using Microsoft.Extensions.Logging;

namespace Apis
{
    public static class GetDataFunction
    {
        [FunctionName("GetData")]
        public static async Task<IActionResult> Run(
            [HttpTrigger(AuthorizationLevel.Function, "get", Route = "GetData")] HttpRequest req,
            ILogger log)
        {
            // Mocked data as if fetched from SQLite
            var data = new List<object>
            {
                new { Id = 1, Name = "Alice", Value = "Sample1" },
                new { Id = 2, Name = "Bob", Value = "Sample2" },
                new { Id = 3, Name = "Charlie", Value = "Sample3" }
            };
            return new OkObjectResult(data);
        }
    }
}
