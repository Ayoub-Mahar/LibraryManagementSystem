using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;
using System.Xml.Linq;

namespace LibraryManagementSystem.Entities
{
    public class Books
    {
        [Key]
        public int PK_BookID { get; set; }
        public string BookTitle { get; set; }
        public int Price { get; set; }
        public string Edition { get; set; }
        public string AutherName { get; set; }
        public bool Availability { get; set; }
        public bool ISBN { get; set; }


        // Foreign key   
        [Display(Name = "BookMainCategory")]
        public int FK_MainCategoryID { get; set; }

        [ForeignKey("FK_MainCategoryID")]
        public virtual BookMainCategory BookMainCategories { get; set; }

        // Foreign key   
        [Display(Name = "BookSubCategory")]
        public int FK_SubCategoryID { get; set; }

        [ForeignKey("FK_SubCategoryID")]
        public virtual BookSubCategory BookSubCategoies { get; set; }
    }
}
