using LibraryManagementSystem.Data;
using LibraryManagementSystem.Entities;
using Microsoft.Data.SqlClient;
using Microsoft.EntityFrameworkCore;

namespace LibraryManagementSystem.Repositories
{
    public class BookService : IBookService
    {

        private readonly DbContextClass _dbContext;
        public BookService(DbContextClass dbContext)
        {
            _dbContext = dbContext;
        }

        public async Task<List<Books>> GetBookListAsync()
        {
            try
            {
                return await _dbContext.Books
               .FromSqlRaw<Books>("GetBookList")
               .ToListAsync();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public async Task<IEnumerable<Books>> GetBookListByCategoryIDAsync(int pK_MainCategoryID)
        {
            try
            {
                var param = new SqlParameter("@FK_MainCategoryID", pK_MainCategoryID);
                var bookByCategory = await Task.Run(() => _dbContext.Books
                                .FromSqlRaw(@"exec GetBookListBYCategoryID @FK_MainCategoryID", param).ToListAsync());
                return bookByCategory;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public async Task<List<BookMainCategory>> GetMainCategory()
        {
            try
            {
                return await _dbContext.BookMainCategory
                .FromSqlRaw<BookMainCategory>("spBookMainCategory")
                .ToListAsync();
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        public async Task<IEnumerable<BookSubCategory>> getSubCategoryByMainCategoryID(int id)
        {
            try
            {
                var param = new SqlParameter("@FK_MainCategoryID", id);
                var bookByCategory = await Task.Run(() => _dbContext.BookSubCategory
                                .FromSqlRaw(@"exec spGetSubCategoryByMainCategoryID @FK_MainCategoryID", param).ToListAsync());
                return bookByCategory;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public async Task<IEnumerable<Books>> GetBookByCategoryID(int mainCategoryId, int subCategoryId)
        {
            try
            {
                var param = new SqlParameter("@FK_MainCategoryID", mainCategoryId);
                var param2 = new SqlParameter("@FK_SubCategoryID", subCategoryId);
                var bookByCategory = await Task.Run(() => _dbContext.Books
                                .FromSqlRaw(@"exec GetBookByCategoryID @FK_MainCategoryID,@FK_SubCategoryID", param, param2).ToListAsync());
                return bookByCategory;
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
    }
}
