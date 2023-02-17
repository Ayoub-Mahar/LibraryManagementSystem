using LibraryManagementSystem.Entities;
using Microsoft.EntityFrameworkCore;

namespace LibraryManagementSystem.Data
{
    public class DbContextClass : DbContext
    {
        protected readonly IConfiguration Configuration;
        public DbContextClass(IConfiguration configuration)
        {
            Configuration = configuration;
        }

        protected override void OnConfiguring(DbContextOptionsBuilder options)
        {
            options.UseSqlServer(Configuration.GetConnectionString("DefaultConnection"));
        }
        public DbSet<Books> Books { get; set; }
        public DbSet<BookMainCategory> BookMainCategory { get; set; }
        public DbSet<BookSubCategory> BookSubCategory { get; set; }
    }
}
