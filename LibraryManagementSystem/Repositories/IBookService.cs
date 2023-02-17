using LibraryManagementSystem.Entities;

namespace LibraryManagementSystem.Repositories
{
    public interface IBookService
    {
        public Task<List<Books>> GetBookListAsync();
        public Task<IEnumerable<Books>> GetBookListByCategoryIDAsync(int Id);
        public Task<IEnumerable<Books>> GetBookByCategoryID(int mainCategoryId, int subCategoryId);
        public Task<IEnumerable<BookSubCategory>> getSubCategoryByMainCategoryID(int Id);
        public Task<List<BookMainCategory>> GetMainCategory();
    }
}
