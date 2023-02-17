window.addEventListener("load", (event) => {
    $('.subCategory').hide();
    loadData();
    BookMainCategory();
   
});
 
function loadData() {
    $.ajax({
        url: "http://localhost:5269/api/Book/getBooklist",
        type: "GET",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {
            var html = '';
            $.each(result, function (key, item) {
                var isAvailablle = "";
                if (item.availability) {
                    isAvailablle = "Yes";
                }
                else {
                    isAvailablle = "No"
                }
                html += '<tr>';
                html += '<td>' + item.pK_BookID + '</td>';
                html += '<td>' + item.bookTitle + '</td>';
                html += '<td>' + item.price + '</td>';
                html += '<td>' + item.edition + '</td>';
                html += '<td>' + item.autherName + '</td>';
                html += '<td>' + isAvailablle + '</td>';
                html += '</tr>';
            });
            $('.tbody').html(html);
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}  
var mainCategoryID = 0;
var subCategoryID = 0;
function FunctionMainCategory(value) {
    
    mainCategoryID = value;
    $('.subCategory').show();
    BookSubCategory(value);
    $.ajax({
        url: "http://localhost:5269/api/Book/getBooklistByCategoryID?pK_MainCategoryID=" + value,
        type: "GET",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {
            FillTable(result);
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}
function FunctionSubCategory(value) {

    subCategoryID = value;
    $('.subCategory').show();
    $.ajax({
        url: "http://localhost:5269/api/Book/GetBookByCategoryID?mainCategoryId=" + mainCategoryID + "&subCategoryId=" + subCategoryID,
        type: "GET",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {
            FillTable(result);
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}
function FillTable(data) {
    var html = '';
    $.each(data, function (key, item) {
        var isAvailablle = "";
        if (item.availability) {
            isAvailablle = "Yes";
        }
        else {
            isAvailablle = "No"
        }
        html += '<tr>';
        html += '<td>' + item.pK_BookID + '</td>';
        html += '<td>' + item.bookTitle + '</td>';
        html += '<td>' + item.price + '</td>';
        html += '<td>' + item.edition + '</td>';
        html += '<td>' + item.autherName + '</td>';
        html += '<td>' + isAvailablle + '</td>';
        html += '</tr>';
    });
    $('.tbody').html(html);
}
function BookMainCategory() {
    $.ajax({
        url: "http://localhost:5269/api/Book/GetMainCategory",
        type: "GET",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {

            var dropdown = document.getElementById("ddlMainCategory");
            for (var i = 0; i < result.length; i++) {
                var option = document.createElement("option");
                option.text = result[i].mainCategoryName;
                option.value = result[i].pK_MainCategoryID;
                dropdown.add(option);
            }

            //$.each(result, function (data, value) {
            //    $("#ddlMainCategory").append($("<option></option>").val(value.pK_MainCategoryID).html(value.mainCategoryName));
            //}) 
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}  
function BookSubCategory(id) {
    
    var dropdown = document.getElementById("ddlSubCategory");
    for (var option in dropdown) {
        dropdown.remove(option);
    }
    $.ajax({
        url: "http://localhost:5269/api/Book/getSubCategoryByMainCategoryID?id="+id,
        type: "GET",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {
            var newOption = document.createElement("option");
            newOption.text = "Select All";
            newOption.value = "0";
            dropdown.add(newOption);

            for (var i = 0; i < result.length; i++) {
                option = document.createElement("option");
                option.text = result[i].subCategoryName;
                option.value = result[i].pK_SubCategoryID;
                dropdown.add(option);
            }
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}  
