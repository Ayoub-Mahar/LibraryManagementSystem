
using LibraryManagementSystem.Data;
using LibraryManagementSystem.Repositories;

var builder = WebApplication.CreateBuilder(args);

builder.Services.AddCors();
// Add services to the container.
builder.Services.AddScoped<IBookService, BookService>();
builder.Services.AddDbContext<DbContextClass>();
builder.Services.AddControllers();

// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();

var app = builder.Build();

// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{   
    app.UseSwagger();
    app.UseSwaggerUI();
}

app.UseAuthorization();

app.MapControllers();

app.UseCors(builder => builder
                .AllowAnyHeader()
                .AllowAnyMethod()
                .SetIsOriginAllowed((host) => true)
                .AllowCredentials()
            );

app.Run();
