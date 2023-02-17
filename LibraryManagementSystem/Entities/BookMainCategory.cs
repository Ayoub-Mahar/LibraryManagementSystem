using System.ComponentModel.DataAnnotations;

namespace LibraryManagementSystem.Entities
{
    public class BookMainCategory
    {
        [Key]
        public int PK_MainCategoryID { get; set; }

        [Required]
        public string MainCategoryName { get; set; }
    }
}
