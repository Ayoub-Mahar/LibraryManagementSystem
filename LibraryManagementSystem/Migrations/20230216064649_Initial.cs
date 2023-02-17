using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace LibraryManagementSystem.Migrations
{
    public partial class Initial : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "BookMainCategory",
                columns: table => new
                {
                    PK_MainCategoryID = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    MainCategoryName = table.Column<string>(type: "nvarchar(max)", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_BookMainCategory", x => x.PK_MainCategoryID);
                });

            migrationBuilder.CreateTable(
                name: "BookSubCategory",
                columns: table => new
                {
                    PK_SubCategoryID = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    SubCategoryName = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    FK_MainCategoryID = table.Column<int>(type: "int", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_BookSubCategory", x => x.PK_SubCategoryID);
                });

            migrationBuilder.CreateTable(
                name: "Books",
                columns: table => new
                {
                    PK_BookID = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    BookTitle = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    Price = table.Column<int>(type: "int", nullable: false),
                    Edition = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    AutherName = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    Availability = table.Column<bool>(type: "bit", nullable: false),
                    ISBN = table.Column<bool>(type: "bit", nullable: false),
                    FK_MainCategoryID = table.Column<int>(type: "int", nullable: true),
                    FK_SubCategoryID = table.Column<int>(type: "int", nullable: true)
                }
                //constraints: table =>
                //{
                //    table.PrimaryKey("PK_Books", x => x.PK_BookID);
                //    table.ForeignKey(
                //        name: "FK_MainCategoryID",
                //        column: x => x.FK_MainCategoryID,
                //        principalTable: "BookMainCategory",
                //        principalColumn: "PK_MainCategoryID",
                //        onDelete: ReferentialAction.Cascade);
                //    table.ForeignKey(
                //        name: "FK_SubCategoryID",
                //        column: x => x.FK_SubCategoryID,
                //        principalTable: "BookSubCategory",
                //        principalColumn: "PK_SubCategoryID",
                //        onDelete: ReferentialAction.Cascade);
                //}
                );

            migrationBuilder.CreateIndex(
                name: "IX_Books_FK_MainCategoryID",
                table: "Books",
                column: "FK_MainCategoryID");

            migrationBuilder.CreateIndex(
                name: "IX_Books_FK_SubCategoryID",
                table: "Books",
                column: "FK_SubCategoryID");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "Books");

            migrationBuilder.DropTable(
                name: "BookMainCategory");

            migrationBuilder.DropTable(
                name: "BookSubCategory");
        }
    }
}
