using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace LibraryManagementSystem.Entities
{
    public class BookSubCategory
    {
        [Key]
        public int PK_SubCategoryID { get; set; }

        public string SubCategoryName { get; set; }


        // Foreign key   
        [Display(Name = "BookMainCategory")]
        public int FK_MainCategoryID { get; set; }

        [ForeignKey("FK_MainCategoryID")]
        public virtual BookMainCategory BookMainCategory { get; set; }
    }
}
