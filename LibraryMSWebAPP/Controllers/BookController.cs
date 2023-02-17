using Microsoft.AspNetCore.Cors;
using Microsoft.AspNetCore.Mvc;

namespace LibraryMSWebAPP.Controllers
{
    [EnableCors("AllowAll")]
    public class BookController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }
    }
}
