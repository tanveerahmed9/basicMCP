using Microsoft.AspNetCore.Mvc;
using System.Collections.Generic;

namespace Apis
{
    [ApiController]
    [Route("api/[controller]")]
    public class GetDataController : ControllerBase
    {
        // GET: api/GetData
        [HttpGet]
        public IActionResult Get()
        {
            // Mocked data as if fetched from SQLite
            var data = new List<object>
            {
                new { Id = 1, Name = "Alice", Value = "Sample1" },
                new { Id = 2, Name = "Bob", Value = "Sample2" },
                new { Id = 3, Name = "Charlie", Value = "Sample3" }
            };
            return Ok(data);
        }
    }
}
