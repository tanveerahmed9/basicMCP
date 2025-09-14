using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Azure.Functions.Worker;
using Microsoft.Extensions.Logging;

namespace Company.Function;

public class TestApi(ILogger<TestApi> logger)
{
    private readonly ILogger<TestApi> _logger = logger;

    [Function("testapi")]
    public IActionResult Run([HttpTrigger(AuthorizationLevel.Anonymous, "get", "post")] HttpRequest req)
    {
        _logger.LogInformation("C# HTTP trigger function processed a request.");
        return new OkObjectResult("Welcome to Azure Functions!");
    }

    // New functionality: returns current server time in UTC
    [Function("gettime")]
    public IActionResult GetTime([HttpTrigger(AuthorizationLevel.Anonymous, "get", Route = "gettime")] HttpRequest req)
    {
        var utcNow = DateTime.UtcNow;
        _logger.LogInformation($"gettime called at {utcNow}");
        return new OkObjectResult(new { UtcNow = utcNow });
    }

    // Endpoint 1: expects a 'name' query parameter and returns a greeting
    [Function("greet")]
    public IActionResult Greet([HttpTrigger(AuthorizationLevel.Anonymous, "get", Route = "greet")] HttpRequest req)
    {
        string? name = req.Query["name"].FirstOrDefault();
        if (string.IsNullOrEmpty(name))
        {
            return new BadRequestObjectResult("Please provide a 'name' query parameter.");
        }
        return new OkObjectResult($"Hello, {name}! Welcome to Azure Functions.");
    }

    // Endpoint 2: expects an 'id' query parameter and returns a mock object
    [Function("getinfo")]
    public IActionResult GetInfo([HttpTrigger(AuthorizationLevel.Anonymous, "get", Route = "getinfo")] HttpRequest req)
    {
        string? id = req.Query["id"].FirstOrDefault();
        if (string.IsNullOrEmpty(id))
        {
            return new BadRequestObjectResult("Please provide an 'id' query parameter.");
        }
        // Mock object for demonstration
        var info = new { Id = id, Status = "Active", Timestamp = DateTime.UtcNow };
        return new OkObjectResult(info);
    }
}