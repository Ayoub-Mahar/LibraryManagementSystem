// <auto-generated />
using LibraryManagementSystem.Data;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Infrastructure;
using Microsoft.EntityFrameworkCore.Metadata;
using Microsoft.EntityFrameworkCore.Storage.ValueConversion;

#nullable disable

namespace LibraryManagementSystem.Migrations
{
    [DbContext(typeof(DbContextClass))]
    partial class DbContextClassModelSnapshot : ModelSnapshot
    {
        protected override void BuildModel(ModelBuilder modelBuilder)
        {
#pragma warning disable 612, 618
            modelBuilder
                .HasAnnotation("ProductVersion", "6.0.0")
                .HasAnnotation("Relational:MaxIdentifierLength", 128);

            SqlServerModelBuilderExtensions.UseIdentityColumns(modelBuilder, 1L, 1);

            modelBuilder.Entity("LibraryManagementSystem.Entities.BookMainCategory", b =>
                {
                    b.Property<int>("PK_MainCategoryID")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int");

                    SqlServerPropertyBuilderExtensions.UseIdentityColumn(b.Property<int>("PK_MainCategoryID"), 1L, 1);

                    b.Property<string>("MainCategoryName")
                        .IsRequired()
                        .HasColumnType("nvarchar(max)");

                    b.HasKey("PK_MainCategoryID");

                    b.ToTable("BookMainCategory");
                });

            modelBuilder.Entity("LibraryManagementSystem.Entities.Books", b =>
                {
                    b.Property<int>("PK_BookID")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int");

                    SqlServerPropertyBuilderExtensions.UseIdentityColumn(b.Property<int>("PK_BookID"), 1L, 1);

                    b.Property<string>("AutherName")
                        .IsRequired()
                        .HasColumnType("nvarchar(max)");

                    b.Property<bool>("Availability")
                        .HasColumnType("bit");

                    b.Property<string>("BookTitle")
                        .IsRequired()
                        .HasColumnType("nvarchar(max)");

                    b.Property<string>("Edition")
                        .IsRequired()
                        .HasColumnType("nvarchar(max)");

                    b.Property<int>("FK_MainCategoryID")
                        .HasColumnType("int");

                    b.Property<int>("FK_SubCategoryID")
                        .HasColumnType("int");

                    b.Property<bool>("ISBN")
                        .HasColumnType("bit");

                    b.Property<int>("Price")
                        .HasColumnType("int");

                    b.HasKey("PK_BookID");

                    b.HasIndex("FK_MainCategoryID");

                    b.HasIndex("FK_SubCategoryID");

                    b.ToTable("Books");
                });

            modelBuilder.Entity("LibraryManagementSystem.Entities.BookSubCategory", b =>
                {
                    b.Property<int>("PK_SubCategoryID")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int");

                    SqlServerPropertyBuilderExtensions.UseIdentityColumn(b.Property<int>("PK_SubCategoryID"), 1L, 1);

                    b.Property<int>("FK_MainCategoryID")
                        .HasColumnType("int");

                    b.Property<string>("SubCategoryName")
                        .IsRequired()
                        .HasColumnType("nvarchar(max)");

                    b.HasKey("PK_SubCategoryID");

                    b.ToTable("BookSubCategory");
                });

            modelBuilder.Entity("LibraryManagementSystem.Entities.Books", b =>
                {
                    b.HasOne("LibraryManagementSystem.Entities.BookMainCategory", "BookMainCategories")
                        .WithMany()
                        .HasForeignKey("FK_MainCategoryID")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.HasOne("LibraryManagementSystem.Entities.BookSubCategory", "BookSubCategoies")
                        .WithMany()
                        .HasForeignKey("FK_SubCategoryID")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.Navigation("BookMainCategories");

                    b.Navigation("BookSubCategoies");
                });
#pragma warning restore 612, 618
        }
    }
}
