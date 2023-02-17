using LibraryManagementSystem.Entities;
using LibraryManagementSystem.Repositories;
using Microsoft.AspNetCore.Cors;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace LibraryManagementSystem.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class BookController : ControllerBase
    {
        private readonly IBookService _bookService;
        public BookController(IBookService bookService)
        {
            this._bookService = bookService;
        }
       
        [HttpGet("getBooklist")]
        public async Task<List<Books>> GetBookListAsync()
        {
            try
            {
                return await _bookService.GetBookListAsync();
            }
            catch
            {
                throw;
            }
        }
        
        [HttpGet("GetMainCategory")]
        public async Task<List<BookMainCategory>> GetMainCategory()
        {
            try
            {
                return await _bookService.GetMainCategory();
            }
            catch
            {
                throw;
            }
        }
        
        [HttpGet("getBooklistByCategoryID")]
        public async Task<IEnumerable<Books>> getBooklistByCategoryID(int pK_MainCategoryID)
        {
            {
                try
                {
                    var response = await _bookService.GetBookListByCategoryIDAsync(pK_MainCategoryID);
                    if (response == null)
                    {
                        return null;
                    }
                    return response;
                }
                catch
                {
                    throw;
                }
            }
        }


        [HttpGet("getSubCategoryByMainCategoryID")]
        public async Task<IEnumerable<BookSubCategory>> getSubCategoryByMainCategoryID(int id)
        {
            {
                try
                {
                    var response = await _bookService.getSubCategoryByMainCategoryID(id);
                    if (response == null)
                    {
                        return null;
                    }
                    return response;
                }
                catch
                {
                    throw;
                }
            }
        }


        [HttpGet("GetBookByCategoryID")]
        public async Task<IEnumerable<Books>> GetBookByCategoryID(int mainCategoryId, int subCategoryId)
        {
            {
                try
                {
                    var response = await _bookService.GetBookByCategoryID(mainCategoryId,subCategoryId);
                    if (response == null)
                    {
                        return null;
                    }
                    return response;
                }
                catch
                {
                    throw;
                }
            }
        }
    }
}
