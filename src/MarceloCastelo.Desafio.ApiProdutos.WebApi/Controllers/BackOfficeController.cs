using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System.Net.Mime;

namespace MarceloCastelo.Desafio.ApiProdutos.WebApi.Controllers;

[ApiController]
public class BackOfficeController : ControllerBase
{
    [HttpPost]
    [Consumes(MediaTypeNames.Application.Json)]
    [Route("/api/v1/backoffice/customer/import")]
    public async Task<IActionResult> ImportCustomerAsync(
        CancellationToken cancellationToken)
    {
        throw new NotImplementedException();
    }
}
