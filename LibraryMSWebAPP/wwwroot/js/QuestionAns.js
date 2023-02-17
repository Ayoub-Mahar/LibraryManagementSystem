window.addEventListener("load", (event) => {
    loadQuestions();
});

function loadQuestions() {
    $.ajax({
        url: "https://api.stackexchange.com/2.3/questions?order=desc&sort=activity&site=stackoverflow",
        type: "GET",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {
            var html = '';
            var vals = [];
            for (var i = 0; i < result.items.length; i++) {
                vals.push(result.items[i]);
            }
            for (var i = 0; i < vals.length; i++) {
                html += '<tr>';
                html += '<td>' + vals[i].title + '</td>';
                html += '<td><button type="button" class="btn btn-primary btnDetails" onclick="QuestionDetailFunc(\'' + vals[i].question_id + ',' + vals[i].title + ',' + vals[i].owner.display_name + ',' + vals[i].is_answered + ',' + vals[i].answer_count + ',' + vals[i].view_count + '\')" id="btnDetails">Details</button></td>';
                html += '</tr>';
                $('.tbody').html(html);
            }
        },
        error: function (errormessage) {
            console.log(errormessage.responseText);
        }
    });
}  
function QuestionDetailFunc(details) {

    var myModal = new bootstrap.Modal(document.getElementById('exampleModal'))
    myModal.show()

    var nameArr = details.split(',');
    console.log(nameArr);

    document.getElementById("questionID").innerHTML = nameArr[0];
    document.getElementById("title").innerHTML = nameArr[1];
    document.getElementById("name").innerHTML = nameArr[2];

    if (innerHTML = nameArr[3] == true) {
        document.getElementById("isAnswer").innerHTML = "Yes";
    }
    else {
        document.getElementById("isAnswer").innerHTML = "No";
    }

    document.getElementById("total-answer").innerHTML = nameArr[4];
    document.getElementById("total-view").innerHTML = nameArr[5];
}
